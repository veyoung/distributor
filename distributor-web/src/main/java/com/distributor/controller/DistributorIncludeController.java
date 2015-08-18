package com.distributor.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.distributor.mapper.DistributorIncludeMapper;
import com.distributor.mapper.DistributorMapper;
import com.distributor.model.Distributor;
import com.distributor.model.DistributorInclude;
import com.distributor.utils.IdGenerator;   

@Controller
public class DistributorIncludeController extends BaseController{
	@Autowired
	DistributorMapper distributorMapper;
	@Autowired
	DistributorIncludeMapper distributorIncludeMapper;
	
	/**
	 * 下属分销商列表
	 * @param distributor
	 * @return
	 */
	@RequestMapping(value="distributorSubmember/{id}", method = RequestMethod.GET)
	public String distributorSubmember(@PathVariable("id") Long id, Model model){	
		try {
			List<Distributor> subMembers = new ArrayList<Distributor>();
			List<DistributorInclude> distributorIncludes = distributorIncludeMapper.selectSubmemberIdsByOwnerId(id);
			if(distributorIncludes != null){
				for(DistributorInclude distributorInclude : distributorIncludes){
					subMembers.add(distributorMapper.selectByPrimaryKey(distributorInclude.getChildId()));
				}
			}
			Distributor distributor = distributorMapper.selectByPrimaryKey(id);
			model.addAttribute("distributor", distributor);
			model.addAttribute("subMembers", subMembers);
			return "distributorsubmembers";
		} catch (Exception e) {
			return "error";
		}
		
	}
	
	/**
	 * 下属分销商添加
	 * @param distributor
	 * @return
	 */
	@RequestMapping(value="distributorSubmemberAdd/{ownerId}/{childId}", method = RequestMethod.GET)
	@ResponseBody
	public Object distributorSubmemberAdd(
			@PathVariable("ownerId") Long ownerId,
			@PathVariable("childId") Long childId){
		try {
			if(ownerId != childId ){//子分销商存在
				Distributor owner = distributorMapper.selectByPrimaryKey(ownerId);
				Distributor child = distributorMapper.selectByPrimaryKey(childId);
				if(owner != null && child != null 
						&& owner.getLevel() < child.getLevel()){
					
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("parentId", ownerId);
					param.put("childId", childId);
					DistributorInclude include = distributorIncludeMapper.selectByParentIdAndChildId(param);
					//如果当前不存在该子分销商
					if(include == null){
						DistributorInclude distributorInclude = new DistributorInclude();
						distributorInclude.setId(IdGenerator.getInstance().nextId());
						distributorInclude.setParentId(ownerId);
						distributorInclude.setChildId(childId);
						distributorIncludeMapper.insert(distributorInclude);//更新map表
						return success();
					}
				}
			}
			return fail();
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}
	
	/**
	 * 下属分销商移除
	 * @param distributor
	 * @return
	 */
	@RequestMapping(value="distributorSubmemberDelete/{childId}/{ownerId}", method = RequestMethod.GET)
	public String distributorSubmemberDelete(
			@PathVariable("ownerId") Long ownerId,
			@PathVariable("childId") Long childId){
		try {
			if(childId != null && ownerId != null){
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("ownerId", ownerId);
				params.put("childId", childId);
				distributorIncludeMapper.deleteByOwnerIdAndChildId(params);
				
				Distributor childDistributor = distributorMapper.selectByPrimaryKey(childId);
				distributorMapper.updateByPrimaryKeySelective(childDistributor);
			}
			return "redirect:/distributorSubmember/" + ownerId;
		} catch (Exception e) {
			return "error";
		}
		
	}
	
	/**
	 * 校验前端添加上分销商时 是否符合规则
	 * @param childId
	 * @param parentId
	 * @return
	 */
	@RequestMapping("validateDistributorLevel/{childLevel}/{parentId}")
	@ResponseBody
	public Map<String,Object> validateDistributorLevel(
			@PathVariable("childLevel") Long childLevel,
			@PathVariable("parentId") Long parentId
			){
		try {
			Distributor parent = distributorMapper.selectByPrimaryKey(parentId);
			if(parent == null){
				Map<String,Object> result = fail();
				result.put("content", "您添加的上级分销商不存在!");
				return result;
			}
			
			if (childLevel != null && childLevel > parent.getLevel()){
				return success();//可以为当前分销商添加上级分销商
			} else {
				Map<String,Object> result = fail();
				result.put("content", "您添加的上级分销商不符合规则!");
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}
	
}
