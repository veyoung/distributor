package com.distributor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.distributor.mapper.CategoryMapper;
import com.distributor.mapper.CommodityMapper;
import com.distributor.model.Category;
import com.distributor.utils.ConstantVariable;
import com.distributor.utils.IdGenerator;

@Controller
public class CategoryController extends BaseController{
	@Autowired
	CategoryMapper categoryMapper;
	@Autowired
	CommodityMapper commodityMapper;
	
	/**
	 * 商品分类列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value=("commodityCategoryList/{page}"), method=RequestMethod.GET)
	@ResponseBody
	public Object commodityCategoryList(@PathVariable("page") int page){
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("pageSize", ConstantVariable.Pagesize);
		    param.put("offset", ConstantVariable.Pagesize * page);
			List<Category> categories = categoryMapper.selectAllCategorysSelective(param);
			int total = categoryMapper.getCountSelectAllCategorysSelective(param);
		
			Map<String, Object> result = success(categories);
			result.put("total", total);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}
	
	/**
	 * 添加分类
	 * @param model
	 * @return
	 */
	@RequestMapping(value=("commodityCategory"), method=RequestMethod.POST)
	public String CategoryAdd(@RequestParam("name") String name){
		try {
			Category category = new Category();
			category.setId(IdGenerator.getInstance().nextId());
			category.setName(name);
			categoryMapper.insert(category);
			return "commoditycategorylist";	
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}	
	}
	
	/**
	 * 删除指定分类
	 * @param id
	 * @return
	 */
	@RequestMapping(value="commodityCategory/delete/{id}", method=RequestMethod.GET)
	public String CategoryDelete(@PathVariable("id") long id){
		try {
			categoryMapper.deleteByPrimaryKey(id);
			commodityMapper.deleteByCategoryId(id);
			return "commoditycategorylist";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public static void main(String[] args){
		StringBuilder stringBuilder = new StringBuilder("12423");
		stringBuilder.insert(stringBuilder.length()-2, '.');
		System.out.println(stringBuilder.toString());
	} 
}
