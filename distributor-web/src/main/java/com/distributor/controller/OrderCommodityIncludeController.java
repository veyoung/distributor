package com.distributor.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.distributor.mapper.CommodityMapper;
import com.distributor.mapper.OrderCommodityIncludeMapper;
import com.distributor.model.Commodity;
import com.distributor.model.OrderCommodityInclude;
import com.distributor.utils.CommonUtils;
import com.distributor.utils.IdGenerator;

@Controller
public class OrderCommodityIncludeController extends BaseController{
	@Autowired
	OrderCommodityIncludeMapper orderCommodityIncludeMapper;
	@Autowired
	CommodityMapper  commodityMapper;
	
	@RequestMapping(value = "addCommodity/{commodityId}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> addCommodity(
			@PathVariable("commodityId") Long commodityId,
			Model model){
		try {
			if(commodityMapper.selectByPrimaryKey(commodityId) != null){//商品Id可用
				
				if(orderCommodityIncludeMapper.selectLatestByCommodityId(commodityId) != null){
					//该商品已经添加到了订单中
					String tips = "该商品已添加到订单";
					return fail(tips);
				}
				else{//可以添加到订单
					OrderCommodityInclude ins = new OrderCommodityInclude();
					ins.setId(IdGenerator.getInstance().nextId());
					ins.setCommodityId(commodityId);
					ins.setCommodityCount(1);//默认是1件
					ins.setStatus(1);//新添加的商品
					orderCommodityIncludeMapper.insertSelective(ins);
					
					//列出所有的元素
					List<OrderCommodityInclude> orderCommodityIncludes 
						= orderCommodityIncludeMapper.selectAllLatest();
					List<Commodity> commodities = new ArrayList<Commodity>();
					for(OrderCommodityInclude orderCommodityInclude : orderCommodityIncludes){
						Commodity commodity = commodityMapper.selectByPrimaryKey(orderCommodityInclude.getCommodityId());
						commodity.setPriceDisplay(CommonUtils.priceInt2Float(commodity.getPrice()));
						commodities.add(commodity);
					}
					model.addAttribute("commodities", commodities);
					return success(commodities);
				}
			}else{
				String tips = "该商品不存在";
				return fail(tips);
			}
		} catch (Exception e) {
			return fail();
		}
	}
	
	@RequestMapping(value = "addCommodityCount/{commodityId}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> addCommodityCount(
			@PathVariable("commodityId") Long commodityId) {
		try {
			if (commodityMapper.selectByPrimaryKey(commodityId) == null) {
				String tips = "该商品不存在";
				return fail(tips);
				
			}
			if(orderCommodityIncludeMapper.selectLatestByCommodityId(commodityId) == null){//不是最新的
				String tips = "该商品不存在";
				return fail(tips);
			}
			orderCommodityIncludeMapper.addCountBycommodityId(commodityId);
			return success();
		} catch (Exception e) {
			return fail();
		}
	}
	
	@RequestMapping(value = "subtractCommodityCount/{commodityId}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> subtractCommodityCount(
			@PathVariable("commodityId") Long commodityId) {
		try {
			if (commodityMapper.selectByPrimaryKey(commodityId) == null) {
				String tips = "该商品不存在";
				return fail(tips);
				
			}
			if(orderCommodityIncludeMapper.selectLatestByCommodityId(commodityId) == null){//不是最新的
				String tips = "该商品不存在";
				return fail(tips);
			}
			orderCommodityIncludeMapper.subtractCountBycommodityId(commodityId);
			return success();
		} catch (Exception e) {
			return fail();
		}
	}

	@RequestMapping(value = "deleteCommodity/{commodityId}", method=RequestMethod.GET)
	public String deleteCommodity(@PathVariable("commodityId") Long commodityId,
			Model model){
		try {

			orderCommodityIncludeMapper.deleteLatestByCommodityId(commodityId);
			List<OrderCommodityInclude> orderCommodityIncludes 
				= orderCommodityIncludeMapper.selectAllLatest();
			List<Commodity> commodities = new ArrayList<Commodity>();
			for(OrderCommodityInclude orderCommodityInclude : orderCommodityIncludes){
				Commodity commodity = commodityMapper.selectByPrimaryKey(orderCommodityInclude.getCommodityId());
				commodity.setPriceDisplay(CommonUtils.priceInt2Float(commodity.getPrice()));
				commodities.add(commodity);
			}
			model.addAttribute("commodities", commodities);
			return "ordersubmit";
		} catch (Exception e) {
			return "error";
		}
	}
	
	@RequestMapping("ordersubmit")
	public String oderSubmitEnter(Model model){
		orderCommodityIncludeMapper.updateAllLatest();
		model.addAttribute("commodities", "");
		return "ordersubmit";
	}
}
