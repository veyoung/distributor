package com.distributor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.distributor.mapper.DistributorIncludeMapper;
import com.distributor.mapper.DistributorMapper;
import com.distributor.model.Distributor;
import com.distributor.model.DistributorInclude;
import com.distributor.utils.ConstantVariable;
import com.distributor.utils.IdGenerator;

@Controller
public class DistributorController extends BaseController{
	@Autowired
	DistributorMapper distributorMapper;
	@Autowired
	DistributorIncludeMapper distributorIncludeMapper;
	
	/**
	 * 分销商列表
	 * @return
	 */
	@RequestMapping(value="list/{page}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> distributorList(@PathVariable("page") int page){	
		return getDistributorList(page);
	}
	
	/**
	 * 公共方法
	 * @param page
	 * @return
	 */
	private Map<String, Object> getDistributorList(int page){
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("pageSize", ConstantVariable.Pagesize);
			param.put("offset", ConstantVariable.Pagesize * page);
			List<Distributor> distributors = distributorMapper.selectSelective(param);
			int total = distributorMapper.getCountAll();
			for(Distributor distributor : distributors){
				DistributorInclude distributorInclude = distributorIncludeMapper.selectByChildId(distributor.getId());
				if(distributorInclude != null){
					Distributor owner = distributorMapper.selectByPrimaryKey(distributorInclude.getParentId());
					if(owner != null){
						distributor.setOwner(owner);
					}
				}
			}
			Map<String, Object> result = success(distributors);
			result.put("total", total);
			return result;
		} catch (Exception e) {
			return fail();
		}
	}
	
	/**
	 * 添加分销商
	 * @param distributor
	 * @return
	 */
	@Transactional
	@RequestMapping("distributorAdd")
	public String distributorAdd(Distributor distributor, Long ownerId){	
		try {
			Long id = IdGenerator.getInstance().nextId();
			if(distributor != null){
				distributor.setId(id);
				distributor.setStatus(1);
				distributorMapper.insert(distributor);
				
				if(ownerId != null){//如果填写了父分销商ID，则添加父分销商信息
					DistributorInclude distributorInclude = new DistributorInclude();
					distributorInclude.setId(IdGenerator.getInstance().nextId());
					distributorInclude.setParentId(ownerId);
					distributorInclude.setChildId(id);
					distributorIncludeMapper.insert(distributorInclude);
				}
			}
			return "distributorlist";
		} catch (Exception e) {
			return "error";
		}
	}
	
	/**
	 * 删除分销商
	 * @param distributor
	 * @return
	 */
	@RequestMapping("distributorDelete/{id}")
	public String distributorDelete(@PathVariable("id") Long id){	
		try {
			distributorMapper.deleteDistributor(id);
			return "distributorlist";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	/**
	 * 分销商编辑跳转
	 * @param distributor
	 * @return
	 */
	@RequestMapping(value="distributorEdit/{id}", method = RequestMethod.GET)
	public String distributorEdit(@PathVariable("id") Long id, Model model){	
		try {
			Distributor distributor = distributorMapper.selectByPrimaryKey(id);
			model.addAttribute("distributor", distributor);
			
			DistributorInclude include = distributorIncludeMapper.selectByChildId(id);
			model.addAttribute("ownerId", include != null ? include.getParentId() : 0);
			return "distributoredit";
		} catch (Exception e) {
			return "error";
		}
	}
	
	/**
	 * 校验分销商详细信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="distributorInfo/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> distributor(@PathVariable("id") Long id){	
		try {
			Distributor distributor = distributorMapper.selectByPrimaryKey(id);
			if (distributor != null){
				DistributorInclude distributorInclude = distributorIncludeMapper.selectByChildId(distributor.getId());
				if(distributorInclude != null){
					Distributor owner = distributorMapper.selectByPrimaryKey(distributorInclude.getParentId());
					if(owner != null){//添加owner对象
						distributor.setOwner(owner);
					}
				}else{
					Distributor defaultDistributor = new Distributor();
					defaultDistributor.setName("暂无");
					defaultDistributor.setCommission(0);
					distributor.setOwner(defaultDistributor);
				}
				return success(distributor);
			} else {
				return fail();
			}
		} catch (Exception e) {
			return fail();
		}
	}
	
	/**
	 * 分销商编辑后提交
	 * @param distributor
	 * @return
	 */
	@RequestMapping(value="distributorEdit", method = RequestMethod.POST)
	public String distributorEditSubmit(Distributor distributor){	
		try {
			distributorMapper.updateByPrimaryKey(distributor);
			
//			if(ownerId != null){//如果填写了父分销商ID，则添加父分销商信息
//				DistributorInclude distributorInclude = new DistributorInclude();
//				distributorInclude.setId(IdGenerator.getInstance().nextId());
//				distributorInclude.setParentId(ownerId);
//				distributorInclude.setChildId(id);
//				distributorIncludeMapper.insert(distributorInclude);
//			}
			
			return "distributorlist";
		} catch (Exception e) {
			return "error";
		}
	}
	
}
