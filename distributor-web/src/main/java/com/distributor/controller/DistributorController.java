package com.distributor.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.distributor.mapper.DistributorBalanceMapper;
import com.distributor.mapper.DistributorIncludeMapper;
import com.distributor.mapper.DistributorMapper;
import com.distributor.mapper.OrderRecordMapper;
import com.distributor.model.Distributor;
import com.distributor.model.DistributorBalance;
import com.distributor.model.DistributorInclude;
import com.distributor.model.User;
import com.distributor.utils.ConstantVariable;
import com.distributor.utils.IdGenerator;

@Controller
public class DistributorController extends BaseController{
	@Autowired
	DistributorMapper distributorMapper;
	@Autowired
	DistributorIncludeMapper distributorIncludeMapper; 
	@Autowired
	DistributorBalanceMapper distributorBalanceMapper;
	@Autowired
	OrderRecordMapper orderRecordMapper;
	
	/**
	 * 分销商列表
	 * @return
	 */
	@RequestMapping(value="list/{page}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> distributorList(
			HttpServletRequest request,
			@PathVariable("page") int page){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		return getDistributorList(page,user);
		
	}
	
	/**
	 * 公共方法
	 * @param page
	 * @return
	 */
	private Map<String, Object> getDistributorList(int page, User user){
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
			result.put("user", user);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
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
				distributor.setBalance(0);
				distributor.setCommission(0);
				distributor.setStatus(1);
				distributor.setCreateTime(new Date());
				distributorMapper.insert(distributor);
				
				if(ownerId != null ){//如果填写了父分销商ID，则添加父分销商信息
					Distributor boss = distributorMapper.selectByPrimaryKey(ownerId);
					if(boss != null && boss.getLevel() < distributor.getLevel()){//上级存在且符合添加规则
						DistributorInclude distributorInclude = new DistributorInclude();
						distributorInclude.setId(IdGenerator.getInstance().nextId());
						distributorInclude.setParentId(ownerId);
						distributorInclude.setChildId(id);
						distributorIncludeMapper.insert(distributorInclude);
					}
				}
			}
			return "distributorlist";
		} catch (Exception e) {
			e.printStackTrace();
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
			distributorIncludeMapper.deleteDistributorIncludeByParentId(id);//删除下级分销商
			orderRecordMapper.deleteOrderByDistributorId(id);//删除级联的订单
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
			e.printStackTrace();
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
					defaultDistributor.setBalance(0);
					distributor.setOwner(defaultDistributor);
				}
				return success(distributor);
			} else {
				return fail();
			}
		} catch (Exception e) {
			e.printStackTrace();
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
			//如果对分销商的编辑是提高分销商的level,则可能会改变归属关系
			Distributor dbDistributor = distributorMapper.selectByPrimaryKey(distributor.getId());
			if(dbDistributor.getLevel() != distributor.getLevel()){//改变级别
				if(dbDistributor.getLevel() == 1){//钻石会员
					if(distributor.getLevel() == 2){//钻石降为金牌
						List<DistributorInclude> includes = distributorIncludeMapper.selectSubmemberIdsByOwnerId(distributor.getId());
						for(DistributorInclude include : includes){
							Distributor child = distributorMapper.selectByPrimaryKey(include.getChildId());
							if(child.getLevel() == 2){
								Map<String, Object> param = new HashMap<String, Object>();
								param.put("ownerId", distributor.getId());
								param.put("childId", child.getId());
								distributorIncludeMapper.deleteByOwnerIdAndChildId(param);
							}
						}	
					}
				}
				if(dbDistributor.getLevel() == 2){//金牌会员无论
					distributorIncludeMapper.deleteDistributorIncludeByParentId(distributor.getId());
				}
				if(dbDistributor.getLevel() == 3){//VIP会员

				}
			}
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
			e.printStackTrace();
			return "error";
		}
	}
	
	/**
	 * 账户充值
	 * @param id
	 * @param money
	 * @return
	 */
	@RequestMapping("recharge/{distributorId}/{money}")
	@ResponseBody
	public Object recharge(
			@PathVariable("distributorId") Long id,
			@PathVariable("money") int money
			){
		try {
			money *= 100;
			Distributor distributor = distributorMapper.selectByPrimaryKey(id);
			if (distributor != null) {
				Distributor updateDistributor = new Distributor();
				updateDistributor.setId(id);
				updateDistributor.setBalance(distributor.getBalance() + money);
				distributorMapper.updateByPrimaryKeySelective(updateDistributor);
				
				DistributorBalance balance = new DistributorBalance();
				balance.setId(IdGenerator.getInstance().nextId());
				balance.setDistributorId(id);
				balance.setBalanceChange(money);
				balance.setBalance(distributor.getBalance() + money);
				balance.setCreateTime(new Date());
				distributorBalanceMapper.insert(balance);
				return success((distributor.getBalance() + money)/100);
			} else {
				return fail();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}
	
	/**
	 * 校验分销商姓名是否可用
	 * @param name
	 * @return
	 */
	@RequestMapping("validate/distributorName/{name}")
	@ResponseBody
	public Object validateDistributorName(@PathVariable("name") String name){
		try {
			Distributor distributor = distributorMapper.selectByName(name);
			if (distributor != null) {
				return success("yes");
			} else {
				return success("no");
			}
		} catch (Exception e) {
			return fail();
		}
	}
	
}
