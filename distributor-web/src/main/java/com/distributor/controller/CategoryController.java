package com.distributor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.distributor.mapper.CategoryMapper;
import com.distributor.model.Category;
import com.distributor.utils.IdGenerator;

@Controller
public class CategoryController extends BaseController{
	@Autowired
	CategoryMapper categoryMapper;
	
	/**
	 * 商品分类列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value=("commodityCategoryList"), method=RequestMethod.GET)
	public String commodityCategoryList(Model model){
		try {
			List<Category> categories = categoryMapper.selectAllCategorys();
			model.addAttribute("categories", categories);
			return "commoditycategorylist";
		} catch (Exception e) {
			return "error";
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
			return "redirect:/commodityCategoryList";	
		} catch (Exception e) {
			return "error";
		}	
	}
	
	/**
	 * 删除指定分类
	 * @param id
	 * @return
	 */
	@RequestMapping("commodityCategory/delete/{id}")
	public String CategoryDelete(@PathVariable("id") long id){
		try {
			categoryMapper.deleteByPrimaryKey(id);
			return "redirect:/commodityCategoryList";
		} catch (Exception e) {
			return "error";
		}
	}
	
	public static void main(String[] args){
		StringBuilder stringBuilder = new StringBuilder("12423");
		stringBuilder.insert(stringBuilder.length()-2, '.');
		System.out.println(stringBuilder.toString());
	} 
}
