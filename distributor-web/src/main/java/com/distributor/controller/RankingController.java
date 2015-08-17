package com.distributor.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.distributor.mapper.CommodityMapper;
import com.distributor.mapper.DistributorIncludeMapper;
import com.distributor.mapper.DistributorMapper;
import com.distributor.mapper.OrderCommodityIncludeMapper;
import com.distributor.mapper.OrderRecordMapper;
import com.distributor.utils.TimeUtils;
import com.distributor.mapper.DistributorCommissionMapper;

@Controller
public class RankingController extends BaseController{
	@Autowired
	OrderCommodityIncludeMapper orderCommodityIncludeMapper;
	@Autowired
	CommodityMapper commodityMapper;
	@Autowired
	DistributorMapper distributorMapper;
	@Autowired
	DistributorIncludeMapper distributorIncludeMapper;
	@Autowired
	OrderRecordMapper orderRecordMapper;
	@Autowired
	DistributorCommissionMapper distributorCommissionMapper;
	
	
	/**
	 * 用户消费排行
	 * @return
	 */
	@RequestMapping("consume/ranking/{type}")
	public String consumeRanking(@PathVariable("type") int type){
		try {
			Date currentTime = new Date();
			Date startTime = null;
			//type:1、按周排行，2、按月排行,3、按年排行
			switch(type){
				case 1:
					startTime = new SimpleDateFormat("yyyy-MM-dd").parse(TimeUtils.lastWeek());
					break;
				case 2:
					startTime = new SimpleDateFormat("yyyy-MM-dd").parse(TimeUtils.lastMonth());
					break;
				case 3:
					startTime = new SimpleDateFormat("yyyy-MM-dd").parse(TimeUtils.lastYear());
					break;
				default:
					startTime = new Date();
			}
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("currentTime", currentTime);
			param.put("startTime", startTime);
			
			
			
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	/**
	 * 用户积分排行
	 * @return
	 */
	@RequestMapping("")
	public String commissionRanking(){
		try {
			
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
}
