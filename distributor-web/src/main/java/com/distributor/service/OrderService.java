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
import com.distributor.mapper.DistributorCommissionMapper;
import com.distributor.mapper.DistributorIncludeMapper;
import com.distributor.mapper.DistributorMapper;
import com.distributor.mapper.OrderCommodityIncludeMapper;
import com.distributor.mapper.OrderRecordMapper;
import com.distributor.model.Commodity;
import com.distributor.model.Distributor;
import com.distributor.model.DistributorBalance;
import com.distributor.model.DistributorCommission;
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
			int commissionPrice = 0;
			for(OrderCommodityInclude orderCommodityInclude : orderCommodityIncludes){
				Commodity commodity = commodityMapper.selectByPrimaryKey(orderCommodityInclude.getCommodityId());
				Integer commodityNum = orderCommodityInclude.getCommodityCount();
				//totalPrice += commodity.getPrice()*commodityNum;
				if(getLevel(distributorId) == 3){//vip-vip 自己积分 没有下级
					commissionPrice = commodity.getVipVip()*commodityNum;
					DistributorCommission distributorCommission = new DistributorCommission();
					distributorCommission.setId(IdGenerator.getInstance().nextId());
					distributorCommission.setDistributorId(distributorId);
					distributorCommission.setOrderId(order.getId()); 
					distributorCommission.setCommission(commissionPrice);
					DistributorCommission dc = distributorCommissionMapper.selectLatestRecordById(distributorId);
					if(dc == null){
						distributorCommission.setTotalcommission(commissionPrice);
					}else{
						if(dc.getTotalcommission() != null){
							Integer totalcommission = dc.getTotalcommission() + commissionPrice;
							distributorCommission.setTotalcommission(totalcommission);
						}
					}
					distributorCommission.setCreateTime(new Date());
					distributorCommissionMapper.insertSelective(distributorCommission);
					if(hasSuperior(distributorId) != null){//vip-gold 有上级  上级积分
						Long  superiorId = hasSuperior(distributorId);
						commissionPrice = commodity.getVipGold()*commodityNum;
						DistributorCommission distributorCommissionP = new DistributorCommission();
						distributorCommissionP.setId(IdGenerator.getInstance().nextId());
						distributorCommissionP.setDistributorId(superiorId);
						distributorCommissionP.setOrderId(order.getId()); 
						distributorCommissionP.setCommission(commissionPrice);
						DistributorCommission dcp = distributorCommissionMapper.selectLatestRecordById(superiorId);
						if(dcp == null){
							distributorCommissionP.setTotalcommission(commissionPrice);
						}else{
							if(dcp.getTotalcommission() != null){
								Integer totalcommission = dcp.getTotalcommission() + commissionPrice;
								distributorCommissionP.setTotalcommission(totalcommission);
							}
						}
						distributorCommissionP.setCreateTime(new Date());
						distributorCommissionMapper.insertSelective(distributorCommissionP);
					}
					if(hasSuperiorDouble(distributorId) != null){//vip-diamond有双层上级  上上级积分
						Long superiorDoubleId = hasSuperiorDouble(distributorId);
						commissionPrice = commodity.getVipDiamond()*commodityNum;
						DistributorCommission distributorCommissionPP = new DistributorCommission();
						distributorCommissionPP.setId(IdGenerator.getInstance().nextId());
						distributorCommissionPP.setDistributorId(superiorDoubleId);
						distributorCommissionPP.setOrderId(order.getId()); 
						distributorCommissionPP.setCommission(commissionPrice);
						DistributorCommission dcpp = distributorCommissionMapper.selectLatestRecordById(superiorDoubleId);
						if(dcpp == null){
							distributorCommissionPP.setTotalcommission(commissionPrice);
						}else{
							if(dcpp.getTotalcommission() != null){
								Integer totalcommission = dcpp.getTotalcommission() + commissionPrice;
								distributorCommissionPP.setTotalcommission(totalcommission);
							}
						}
						distributorCommissionPP.setCreateTime(new Date());
						distributorCommissionMapper.insertSelective(distributorCommissionPP);
					}
				}else if(getLevel(distributorId) == 2){//有上级且有下级 自己积分
					commissionPrice = commodity.getGoldGold()*commodityNum;
					DistributorCommission distributorCommission = new DistributorCommission();
					distributorCommission.setId(IdGenerator.getInstance().nextId());
					distributorCommission.setDistributorId(distributorId);
					distributorCommission.setOrderId(order.getId()); 
					distributorCommission.setCommission(commissionPrice);
					DistributorCommission dc = distributorCommissionMapper.selectLatestRecordById(distributorId);
					if(dc == null){
						distributorCommission.setTotalcommission(commissionPrice);
					}else{
						if(dc.getTotalcommission() != null){
							Integer totalcommission = dc.getTotalcommission() + commissionPrice;
							distributorCommission.setTotalcommission(totalcommission);
						}
					}
					distributorCommission.setCreateTime(new Date());
					distributorCommissionMapper.insertSelective(distributorCommission);
					
					//上级积分
					if(hasSuperior(distributorId) != null){
						Long superiorId = hasSuperior(distributorId);
						commissionPrice = commodity.getGoldDiamond()*commodityNum;
						DistributorCommission distributorCommissionP = new DistributorCommission();
						distributorCommissionP.setId(IdGenerator.getInstance().nextId());
						distributorCommissionP.setDistributorId(superiorId);
						distributorCommissionP.setOrderId(order.getId()); 
						distributorCommissionP.setCommission(commissionPrice);
						DistributorCommission dcp = distributorCommissionMapper.selectLatestRecordById(distributorId);
						if(dcp == null){
							distributorCommissionP.setTotalcommission(commissionPrice);
						}else{
							if(dcp.getTotalcommission() != null){
								Integer totalcommission = dcp.getTotalcommission() + commissionPrice;
								distributorCommissionP.setTotalcommission(totalcommission);
							}
						}
						distributorCommissionP.setCreateTime(new Date());
						distributorCommissionMapper.insertSelective(distributorCommissionP);
					}
				}else if(getLevel(distributorId) == 1){//砖石会员 
					commissionPrice = commodity.getDiamondDiamond()*commodityNum;
					DistributorCommission distributorCommission = new DistributorCommission();
					distributorCommission.setId(IdGenerator.getInstance().nextId());
					distributorCommission.setDistributorId(distributorId);
					distributorCommission.setOrderId(order.getId()); 
					distributorCommission.setCommission(commissionPrice);
					DistributorCommission dc = distributorCommissionMapper.selectLatestRecordById(distributorId);
					if(dc == null){
						distributorCommission.setTotalcommission(commissionPrice);
					}else{
						if(dc.getTotalcommission() != null){
							Integer totalcommission = dc.getTotalcommission() + commissionPrice;
							distributorCommission.setTotalcommission(totalcommission);
						}
					}
					distributorCommission.setCreateTime(new Date());
					distributorCommissionMapper.insertSelective(distributorCommission);
				}
				
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
}
