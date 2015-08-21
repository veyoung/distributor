package com.distributor.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.distributor.mapper.CommodityMapper;
import com.distributor.mapper.DistributorBalanceMapper;
import com.distributor.mapper.DistributorCommissionCommodityMapper;
import com.distributor.mapper.DistributorCommissionMapper;
import com.distributor.mapper.DistributorIncludeMapper;
import com.distributor.mapper.DistributorMapper;
import com.distributor.mapper.OrderCommodityIncludeMapper;
import com.distributor.mapper.OrderRecordMapper;
import com.distributor.model.Commodity;
import com.distributor.model.Distributor;
import com.distributor.model.DistributorBalance;
import com.distributor.model.DistributorCommission;
import com.distributor.model.DistributorCommissionCommodity;
import com.distributor.model.DistributorInclude;
import com.distributor.model.OrderCommodityInclude;
import com.distributor.model.OrderRecord;
import com.distributor.utils.IdGenerator;

@Service
public class OrderService{
	@Autowired
	OrderCommodityIncludeMapper orderCommodityIncludeMapper;
	@Autowired
	CommodityMapper commodityMapper;
	@Autowired
	DistributorMapper distributorMapper;
	@Autowired
	DistributorBalanceMapper distributorBalanceMapper;
	@Autowired
	DistributorIncludeMapper distributorIncludeMapper;
	@Autowired
	OrderRecordMapper orderRecordMapper;
	@Autowired
	DistributorCommissionMapper distributorCommissionMapper;
	@Autowired
	DistributorCommissionCommodityMapper distributorCommissionCommodityMapper;
	
	@Transactional
	public OrderRecord submitOrder(Long distributorId, Float totalPrice){
		Distributor orderDistributor = distributorMapper.selectByPrimaryKey(distributorId);
		if (orderDistributor == null){//提交订单分销商为空,无法提交订单
			return null;
		} else {//提交订单的分销商存在
			
			//产生订单
			OrderRecord order = new OrderRecord();
			order.setId(IdGenerator.getInstance().nextId());
			order.setDistributorId(distributorId);
			order.setMoney((int)(totalPrice*100));
			order.setCreateTime(new Date());
			order.setStatus(1);
			orderRecordMapper.insertSelective(order);
			
			List<OrderCommodityInclude> orderCommodityIncludes = orderCommodityIncludeMapper.selectAllLatest();
			if(getLevel(distributorId) == 3){//vip-vip 自己积分 没有下级
				
				commodityCommission(orderCommodityIncludes, order, distributorId, 0);
				
				if(hasSuperior(distributorId) != null){//vip-gold 有上级  上级积分
					
					commodityCommission(orderCommodityIncludes, order, hasSuperior(distributorId), 1);
				}
				
				if(hasSuperiorDouble(distributorId) != null){
					commodityCommission(orderCommodityIncludes, order, hasSuperiorDouble(distributorId), 2);
				}
			}
			else if(getLevel(distributorId) == 2){
				commodityCommission(orderCommodityIncludes, order, distributorId, 3);
				if(hasSuperior(distributorId) != null){
					commodityCommission(orderCommodityIncludes, order, hasSuperior(distributorId), 2);
				}
			}
			else if(getLevel(distributorId) == 1){//钻石会员 
				commodityCommission(orderCommodityIncludes, order, distributorId, 5);
			}
				
			//写distributor_balance
			DistributorBalance distributorBalance = new DistributorBalance();
			distributorBalance.setId(IdGenerator.getInstance().nextId());
			distributorBalance.setDistributorId(null);
			distributorBalance.setCreateTime(new Date());
			distributorBalance.setBalanceChange(-(int)(totalPrice*100));
			Distributor distributorDb = distributorMapper.selectByPrimaryKey(distributorId);
			if(distributorDb.getBalance() >= totalPrice*100){
				int balance = (int)(distributorDb.getBalance() -totalPrice*100);
				distributorBalance.setBalance(balance);
				Distributor record = new Distributor();
				record.setId(distributorId);
				record.setBalance(balance);
				distributorMapper.updateByPrimaryKeySelective(record);
				distributorBalanceMapper.insertSelective(distributorBalance);
			}else{
				//return null;
			}
			
			
			//写order_commodity_include中order_id
			orderCommodityIncludeMapper.setAllLatestWithOrderId(order.getId());
			return order;
		} 
	}
	
	Integer getLevel(Long distributorId){
		Distributor distributor = distributorMapper.selectByPrimaryKey(distributorId);
		if(distributor.getLevel() != null){
			return distributor.getLevel();
		}else{
			return null;
		}
	}
	
	//判断是否有上级
	Long hasSuperior(Long distributorId){
		DistributorInclude distributorInclude = distributorIncludeMapper.selectByChildId(distributorId);
		if(distributorInclude == null){
			return null;
		}
		if(distributorInclude.getParentId() != null){
			return distributorInclude.getParentId();
		}else{
			return null;
		}
	}
	
	//判断是否有双层上级
	Long hasSuperiorDouble(Long distributorId){
		if(hasSuperior(distributorId) != null){//有上级
			Long superiorId = hasSuperior(distributorId);
			if(hasSuperior(superiorId) != null){//是否有双层上级
				return hasSuperior(superiorId);
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
	
	//判断是否有下级
	List<DistributorInclude> hasJunior (Long distributorId) {
		List<DistributorInclude> list = distributorIncludeMapper.selectSubmemberIdsByOwnerId(distributorId);
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}
	
	// 判断是否有双层下级
	Map<String, List<DistributorInclude>> hasJuniorDouble(Long distributorId) {
		if(hasJunior(distributorId).size() > 0){//有下级
			Map<String, List<DistributorInclude>> map = new HashMap<String, List<DistributorInclude>>();
			map.put("firstJunior", hasJunior(distributorId));//存下级
			List<DistributorInclude> list = new ArrayList<DistributorInclude>();//存双层下级
			for(DistributorInclude distributorInclude : hasJunior(distributorId)){
				if(distributorInclude.getChildId() != null){
					if(hasJunior(distributorInclude.getChildId()).size() > 0){//有双层下级
						list.addAll(hasJunior(distributorInclude.getChildId()));
					}
				}	
			}
			if(list.size() > 0){
				map.put("secondJunior", list);
			}
			if(map.size() > 0){
				return map;
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
	

	/**
	 * 商品积分的公共方法
	 * @param orderCommodityIncludes订单包含的所有商品
	 * @param order订单
	 * @param distributorId应该增加积分的分销商，不一定是订单所属分销商
	 * @param category订单分销商与积分分销商的关系
	 */
	void commodityCommission(List<OrderCommodityInclude> orderCommodityIncludes, OrderRecord order, Long distributorId,
			int category){
		//先拿到订单所属的所有商品
		int commissionAddPrice = 0;
		Long distributorCommissionId = IdGenerator.getInstance().nextId();
		for(OrderCommodityInclude orderCommodityInclude : orderCommodityIncludes){//商品的遍历过程
			Commodity commodity = commodityMapper.selectByPrimaryKey(orderCommodityInclude.getCommodityId());//商品
			//Integer commodityNum = orderCommodityInclude.getCommodityCount();//商品份数
			int commoditycommission = getCommissionRule(commodity, category) * orderCommodityInclude.getCommodityCount();
			commissionAddPrice += commoditycommission;
			
			//写商品提成数据库
			DistributorCommissionCommodity commodityCommission = new DistributorCommissionCommodity();
			commodityCommission.setId(IdGenerator.getInstance().nextId());
			commodityCommission.setCommodityCommission(commoditycommission);
			commodityCommission.setCommodityCount(orderCommodityInclude.getCommodityCount());
			commodityCommission.setCommodityName(commodity.getName());
			commodityCommission.setCreateTime(new Date());
			commodityCommission.setDistributorCommissionId(distributorCommissionId);
			distributorCommissionCommodityMapper.insert(commodityCommission);
		}
		
		//写分销商总提成数据库
		DistributorCommission distributorCommission = new DistributorCommission();
		distributorCommission.setId(distributorCommissionId);
		distributorCommission.setDistributorId(distributorId);
		distributorCommission.setOrderId(order.getId()); 
		distributorCommission.setCommission(commissionAddPrice);
		distributorCommission.setCreateTime(new Date());
		DistributorCommission dc = distributorCommissionMapper.selectLatestRecordById(distributorId);
		if(dc == null){
			distributorCommission.setTotalcommission(commissionAddPrice);
		}else{
			if(dc.getTotalcommission() != null){
				Integer totalcommission = dc.getTotalcommission() + commissionAddPrice;
				distributorCommission.setTotalcommission(totalcommission);
			}
		}
		distributorCommissionMapper.insert(distributorCommission);
	}
	
	int getCommissionRule(Commodity commodity, int category){
		int rule=0;
		switch(category){
		case 0:
			rule = commodity.getVipVip();
			break;
		case 1:
			rule = commodity.getVipGold();
			break;
		case 2:
			rule = commodity.getGoldDiamond();
			break;
		case 3:
			rule = commodity.getGoldGold();
			break;
		case 4:
			rule = commodity.getGoldDiamond();
			break;
		case 5:
			rule = commodity.getDiamondDiamond();
			break;
		default:
			rule = 0;
			break;
		}
		return rule;
	}
}
