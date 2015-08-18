package com.distributor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.distributor.mapper.CommodityMapper;
import com.distributor.mapper.DistributorCommissionMapper;
import com.distributor.mapper.DistributorIncludeMapper;
import com.distributor.mapper.DistributorMapper;
import com.distributor.mapper.OrderCommodityIncludeMapper;
import com.distributor.mapper.OrderRecordMapper;
import com.distributor.model.Commodity;
import com.distributor.model.Distributor;
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
	DistributorIncludeMapper distributorIncludeMapper;
	@Autowired
	OrderRecordMapper orderRecordMapper;
	@Autowired
	DistributorCommissionMapper distributorCommissionMapper;
	
	@Transactional
	public OrderRecord submitOrder(Long distributorId){
		Distributor orderDistributor = distributorMapper.selectByPrimaryKey(distributorId);
		if (orderDistributor == null){//提交订单分销商为空,无法提交订单
			return null;
		} else {//提交订单的分销商存在
			
			List<OrderCommodityInclude> orderCommodityIncludes = orderCommodityIncludeMapper.selectAllLatest();
			int totalPrice = 0;
			int commissionPrice = 0;
			for(OrderCommodityInclude orderCommodityInclude : orderCommodityIncludes){
				Commodity commodity = commodityMapper.selectByPrimaryKey(orderCommodityInclude.getCommodityId());
				int commodityNum = orderCommodityInclude.getCommodityCount();
				Boolean bool = hasSuperior(distributorId);
				totalPrice += commodity.getPrice()*commodityNum;
			}
			
			//如果上级分销商存在，计算提成
			DistributorInclude distributorInclude = distributorIncludeMapper.selectByChildId(orderDistributor.getId());
			Distributor bossDistributor = null;
			if(distributorInclude != null){
				bossDistributor = distributorMapper.selectByPrimaryKey(distributorInclude.getParentId());
				//commissionPrice = totalPrice * bossDistributor.getCommission() / 100;
			}
			
			//产生订单
			OrderRecord order = new OrderRecord();
			order.setId(IdGenerator.getInstance().nextId());
			order.setDistributorId(distributorId);
			order.setCommission(commissionPrice);
			order.setMoney(totalPrice);
			orderRecordMapper.insertSelective(order);
			
			//如果升级分销商存在，增加上级分销商提成记录
			if(bossDistributor != null){
				DistributorCommission former = distributorCommissionMapper.selectLatestRecordById(bossDistributor.getId());
				DistributorCommission current = new DistributorCommission();
				current.setId(IdGenerator.getInstance().nextId());
				current.setDistributorId(bossDistributor.getId());
				current.setOrderId(order.getId());
				//current.setPercent(bossDistributor.getCommission());
				current.setCommission(commissionPrice);//提成金额
				if (former == null){
					current.setTotalcommission(0);
				} else {
					current.setTotalcommission(commissionPrice + former.getTotalcommission());
				}
				distributorCommissionMapper.insert(current);
			}
			
			orderCommodityIncludeMapper.setAllLatestWithOrderId(order.getId());
			return order;
		} 
	}
	
	
	Boolean hasSuperior(Long distributorId){
		DistributorInclude distributorInclude = distributorIncludeMapper.selectByChildId(distributorId);
		if(distributorInclude != null){
			
		}
		return null;
	}
	
	
}
