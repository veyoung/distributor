package com.distributor.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.distributor.mapper.CommodityMapper;
import com.distributor.mapper.DistributorIncludeMapper;
import com.distributor.mapper.DistributorMapper;
import com.distributor.mapper.OrderCommodityIncludeMapper;
import com.distributor.mapper.OrderRecordMapper;
import com.distributor.utils.ConstantVariable;
import com.distributor.utils.TimeUtils;
import com.distributor.mapper.DistributorCommissionMapper;
import com.distributor.model.Distributor;
import com.distributor.model.DistributorCommission;

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
	@ResponseBody
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
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	/**
	 * 用户积分排行
	 * @return
	 */
	@RequestMapping("commission/ranking/{type}/{page}")
	@ResponseBody
	public Object commissionRanking(@PathVariable("type") int type, @PathVariable("page") int page){
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
			param.put("endTime", currentTime);
			param.put("startTime", startTime);
			param.put("pageSize", ConstantVariable.Pagesize);
			param.put("offset", page * ConstantVariable.Pagesize);
			List<DistributorCommission> list = distributorCommissionMapper.selectCommissionsSelective(param);
			int total = distributorCommissionMapper.getCountSelective(param);
			Map<Long, DistributorCommission> rankMap = new HashMap<Long, DistributorCommission>();
			for(DistributorCommission distributorCommission : list){//满足日期条件的所有记录 
				if(distributorCommission.getDistributorId() != null && !rankMap.containsKey(distributorCommission.getDistributorId())){//没有
					Distributor distributor= distributorMapper.selectByPrimaryKey(distributorCommission.getDistributorId());
					distributorCommission.setDistributor(distributor);
					rankMap.put(distributorCommission.getDistributorId(), distributorCommission);
				}else if(distributorCommission.getDistributorId() != null && rankMap.containsKey(distributorCommission.getDistributorId())){//已经有该条记录
					DistributorCommission existDC = rankMap.get(distributorCommission.getDistributorId());//去除已存在的记录
					if(existDC.getCommission() != null && distributorCommission.getCommission() != null){
						existDC.setCommission(existDC.getCommission() + distributorCommission.getCommission());
					}else if(existDC.getCommission() == null){
						existDC.setCommission(distributorCommission.getCommission());
					}
				}
			}
			Map<String, Object> result = success(sortMap(rankMap));
			result.put("total", total);
			return  success(result);
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}
	
	//排序
	 public static Map<Long, DistributorCommission> sortMap(Map<Long, DistributorCommission> oldMap) {  
	        ArrayList<Map.Entry<Long, DistributorCommission>> list = new ArrayList<Map.Entry<Long, DistributorCommission>>(oldMap.entrySet());  
	        Collections.sort(list, new Comparator<Map.Entry<Long, DistributorCommission>>() {  
	            @Override  
	            public int compare(Entry<Long, DistributorCommission> arg0,  
	                    Entry<Long, DistributorCommission> arg1) {  
	            	return arg0.getValue().getCommission() - arg1.getValue().getCommission();  
	            }  
	        });  
	        Map<Long, DistributorCommission> newMap = new LinkedHashMap<Long, DistributorCommission>();  
	        for (int i = list.size() - 1; i >= 0; i--) {  
	            newMap.put(list.get(i).getKey(), list.get(i).getValue());  
	        }  
	        return newMap;  
	    }  
	
	
}
