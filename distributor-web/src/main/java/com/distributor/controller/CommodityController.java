package com.distributor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.distributor.mapper.CategoryMapper;
import com.distributor.mapper.CommodityMapper;
import com.distributor.model.Category;
import com.distributor.model.Commodity;
import com.distributor.model.User;
import com.distributor.utils.ConstantVariable;
import com.distributor.utils.IdGenerator;

@Controller
public class CommodityController extends BaseController{
	@Autowired
	CommodityMapper commodityMapper;
	@Autowired
	CategoryMapper categoryMapper;
	
	/**
	 * 商品列表
	 * @return
	 */
	@RequestMapping("commodityList/{page}")
	@ResponseBody
	public Map<String, Object> commodityList(
			HttpServletRequest request, 
			@PathVariable("page") int page){	
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
		    param.put("pageSize", ConstantVariable.Pagesize);
		    param.put("offset", ConstantVariable.Pagesize * page);
		    
		    List<Commodity> commoditys = commodityMapper.selectSelective(param);
		    for(Commodity commodity : commoditys){
		    	Category category = categoryMapper.selectByPrimaryKey(commodity.getCategoryId());
		    	if (category != null) {
		    		commodity.setCategoryName(category.getName());
		    	} 
		    }
		    int total = commodityMapper.countSelectSelective(param);
		    List<Category> categories = categoryMapper.selectAllCategorys();
		    String categoriesStr = "";
		    for(Category category : categories){
		    	categoriesStr += category.getId() + "," + category.getName() + ";";
		    }
		    
		    Map<String, Object> result = success(commoditys);
		    result.put("total", total);
		    result.put("categoriesStr", categoriesStr);
		    result.put("user", user);
		    return result;
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}	
	}
	
	/**
	 * 商品搜素
	 * @return
	 */
	@RequestMapping("commodityList/{categoryId}/{page}")
	@ResponseBody
	public Map<String, Object> commoditySearch(
			HttpServletRequest request,
			@PathVariable("categoryId") Long categoryId,
			@PathVariable("page") int page){	
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("categoryId", categoryId);
		    param.put("pageSize", ConstantVariable.Pagesize);
		    param.put("offset", ConstantVariable.Pagesize * page);
		    
		    List<Commodity> commoditys = commodityMapper.selectByCategory(param);
		    for(Commodity commodity : commoditys){
		    	Category category = categoryMapper.selectByPrimaryKey(commodity.getCategoryId());
		    	if (category != null) {
		    		commodity.setCategoryName(category.getName());
		    	} 
		    }
		    int total = commodityMapper.countSelectByCategory(param);
		    List<Category> categories = categoryMapper.selectAllCategorys();
		    String categoriesStr = "";
		    for(Category category : categories){
		    	categoriesStr += category.getId() + "," + category.getName() + ";";
		    }
		    
		    Map<String, Object> result = success(commoditys);
		    result.put("total", total);
		    result.put("categoriesStr", categoriesStr);
		    result.put("user", user);
		    return result;
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}	
	}
	
//	/**
//	 * 分页异步
//	 * @param page
//	 * @return
//	 */
//	@RequestMapping(value="commodityList/{page}", method=RequestMethod.GET)
//	@ResponseBody
//	public Map<String, Object> commodityAjaxList(@PathVariable("page") int page){
//		try {
//			HashMap<String, Object> param = new HashMap<String, Object>();
//		    param.put("pageSize", 10);
//		    param.put("offset", (page-1)*10);
//		    List<Commodity> commodities = commodityMapper.selectSelective(param);
//			return success(commodities);
//		} catch (Exception e) {
//			return fail();
//		}
//	}
	
	/**
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value=("getCommodity/{id}"), method=RequestMethod.GET)
	@ResponseBody
	public Object getCommodity(@PathVariable("id") Long id, Model model){
		try {
			Commodity commodity = commodityMapper.selectByPrimaryKey(id);
			return success(commodity);
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	} 
	
	/**
	 * 进入商品详情页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value=("commodity/{id}"), method=RequestMethod.GET)
	public String commodityChoose(@PathVariable("id") Long id, Model model){
		try {
			Commodity commodity = commodityMapper.selectByPrimaryKey(id);
			model.addAttribute("commodity", commodity);
			
			List<Category> categories = categoryMapper.selectAllCategorys();
		    String categoriesStr = "";
		    for(Category category : categories){
		    	categoriesStr += category.getId() + "," + category.getName() + ";";
		    }
		    model.addAttribute("categoriesStr", categoriesStr);
			return "commodityedit";	
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	} 
	
	/**
	 * 添加商品
	 * @param name
	 * @param categoryId
	 * @param price
	 * @param description
	 * @return
	 */
	@RequestMapping(value=("commodity"), method=RequestMethod.POST)
	public String commodityAdd(
			@RequestParam(value="name", required = true) String name,
			@RequestParam(value="brand", required = true) String brand,
			@RequestParam(value="categoryId", required = true) Long categoryId,
			@RequestParam(value="price", required = true) String price,
			@RequestParam(value="vipVip", required = true) String vipVip,
			@RequestParam(value="vipGold", required = true) String vipGold,
			@RequestParam(value="vipDiamond", required = true) String vipDiamond,
			@RequestParam(value="goldGold", required = true) String goldGold,
			@RequestParam(value="goldDiamond", required = true) String goldDiamond,
			@RequestParam(value="diamondDiamond", required = true) String diamondDiamond,
			@RequestParam(value="description", required = false) String description){
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("name", name);
			param.put("brand", brand);
			if(commodityMapper.selectByNameAndBrand(param) != null){
				return "error";//商品已存在
			}
			
			Commodity commodity = new Commodity();
			commodity.setId(IdGenerator.getInstance().nextId());
			commodity.setName(name);
			commodity.setBrand(brand);
			commodity.setCategoryId(categoryId);
			commodity.setPrice((int)(Float.parseFloat(price) * 100));
			commodity.setVipVip((int)(Float.parseFloat(vipVip) * 100));
			commodity.setVipGold((int)(Float.parseFloat(vipGold) * 100));
			commodity.setVipDiamond((int)(Float.parseFloat(vipDiamond) * 100));
			commodity.setGoldGold((int)(Float.parseFloat(goldGold) * 100));
			commodity.setGoldDiamond((int)(Float.parseFloat(goldDiamond) * 100));
			commodity.setDiamondDiamond((int)(Float.parseFloat(diamondDiamond) * 100));
			commodity.setDescription(description);
			commodity.setStatus(1);
			commodityMapper.insert(commodity);
			
			return "commoditylist";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	
	/**
	 * 编辑商品
	 * @param name
	 * @param categoryId
	 * @param price
	 * @param description
	 * @return
	 */
	@RequestMapping(value=("commodity/edit"), method=RequestMethod.POST)
	public String commodityEdit(@RequestParam("id") Long id,
			@RequestParam(value="name", required = true) String name,
			@RequestParam(value="brand", required = true) String brand,
			@RequestParam(value="categoryId", required = true) Long categoryId,
			@RequestParam(value="price", required = true) String price,
			@RequestParam(value="vipVip", required = true) String vipVip,
			@RequestParam(value="vipGold", required = true) String vipGold,
			@RequestParam(value="vipDiamond", required = true) String vipDiamond,
			@RequestParam(value="goldGold", required = true) String goldGold,
			@RequestParam(value="goldDiamond", required = true) String goldDiamond,
			@RequestParam(value="diamondDiamond", required = true) String diamondDiamond,
			@RequestParam(value="description", required = true) String description){
		try {
			Commodity commodity = new Commodity();
			commodity.setId(id);
			commodity.setName(name);
			commodity.setBrand(brand);
			commodity.setCategoryId(categoryId);
			commodity.setPrice((int)(Float.parseFloat(price) * 100));
			commodity.setVipVip((int)(Float.parseFloat(vipVip) * 100));
			commodity.setVipGold((int)(Float.parseFloat(vipGold) * 100));
			commodity.setVipDiamond((int)(Float.parseFloat(vipDiamond) * 100));
			commodity.setGoldGold((int)(Float.parseFloat(goldGold) * 100));
			commodity.setGoldDiamond((int)(Float.parseFloat(goldDiamond) * 100));
			commodity.setDiamondDiamond((int)(Float.parseFloat(diamondDiamond) * 100));
			commodity.setDescription(description);
			commodity.setStatus(1);
			commodityMapper.updateByPrimaryKey(commodity);
			
			return "commoditylist";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 下线某商品
	 * @param id
	 * @return
	 */
	@RequestMapping("commodity/delete/{id}")
	public String commodityDelet(@PathVariable("id") Long id){
		try {
			Commodity commodity = new Commodity();
			commodity.setId(id);
			commodity.setStatus(2);
			commodityMapper.updateByPrimaryKeySelective(commodity);
			return "commoditylist";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	/**
	 * 搜索商品
	 * @return
	 */
	@RequestMapping("commodity/search")
	@ResponseBody
	public Map<String, Object> commoditySearch(
			@RequestParam("name") String name,
			@RequestParam("id") Long id){
		try {
			if(name != null){
				Commodity commodity = commodityMapper.selectWithSearhName(name);
				return success(commodity);
			}
			return fail();			
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}

	public static void main(String[] args){
		StringBuilder stringBuilder = new StringBuilder("12423");
		stringBuilder.insert(stringBuilder.length()-2, '.');
		System.out.println(stringBuilder.toString());
	} 
}
