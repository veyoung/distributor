package com.distributor.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.distributor.mapper.CommodityMapper;
import com.distributor.mapper.DistributorIncludeMapper;
import com.distributor.mapper.DistributorMapper;
import com.distributor.mapper.OrderCommodityIncludeMapper;
import com.distributor.mapper.OrderRecordMapper;
import com.distributor.model.Commodity;
import com.distributor.model.Distributor;
import com.distributor.model.DistributorCommission;
import com.distributor.model.DistributorCommissionCommodity;
import com.distributor.model.DistributorInclude;
import com.distributor.model.OrderCommodityInclude;
import com.distributor.model.OrderRecord;
import com.distributor.service.OrderService;
import com.distributor.utils.CommonUtils;
import com.distributor.utils.ConstantVariable;
import com.distributor.utils.IdGenerator;
import com.distributor.utils.TimeUtils;
import com.distributor.mapper.DistributorCommissionMapper;
import com.distributor.mapper.DistributorCommissionCommodityMapper;
@Controller
public class OrderController extends BaseController{
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
	@Autowired
	DistributorCommissionCommodityMapper distributorCommissionCommodityMapper;
	
	@Autowired
	OrderService orderservice;
	
	/**
	 * 提交订单
	 * @param distributorId
	 * @return
	 */
	@RequestMapping(value = "submitOrder", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> submitOrder(
			@RequestParam("distributorId") Long distributorId,
			@RequestParam("totalPrice") String totalPrice){
		try {
			Float totalPriceNumic = Float.parseFloat(totalPrice);
			OrderRecord order = orderservice.submitOrder(distributorId, totalPriceNumic);
			if (order != null){
				return success(order);
			} else {
				return fail("订单提交失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return fail("订单提交失败！");
		}
	}
	
	/**
	 * 按分页查询出需要的订单
	 * @param page
	 * @return
	 */
	@RequestMapping(value="order/{startTime}/{endTime}/{page}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getOrders(
			@PathVariable("page") int page,
			@PathVariable("startTime") String startTime,
			@PathVariable("endTime") String endTime
			){
		try {
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Map<String, Object> param = new HashMap<String, Object>();
			if(!startTime.equals("0")){
				param.put("startTime", format1.parse(startTime));
			}
			if(!endTime.equals("0")){
				param.put("endTime", format1.parse(endTime));
			}
			param.put("pageSize", ConstantVariable.Pagesize);
			param.put("offset", page * ConstantVariable.Pagesize);
			
			List<OrderRecord> orders = orderRecordMapper.selectOrdersSelective(param);
			int total = orderRecordMapper.getCountSelective(param);
			for(OrderRecord orderRecord : orders){
				//订单归属分销商
				Distributor orderdistributor = distributorMapper.selectByPrimaryKey(orderRecord.getDistributorId());
				if(orderdistributor != null){
					orderRecord.setOrderDistributor(orderdistributor);
				}
				
				//订单上级分销商
				DistributorInclude distributorInclude = distributorIncludeMapper.selectByChildId(orderdistributor.getId());
				if(distributorInclude != null && distributorInclude.getParentId() != null){
					Distributor bossDistributor = distributorMapper.selectByPrimaryKey(distributorInclude.getParentId());
					orderRecord.setBossDistributor(bossDistributor);
				}
				
				//订单关联的商品
				List<OrderCommodityInclude> list = orderCommodityIncludeMapper.selectAllLastByOrderId(orderRecord.getId());
				if(list.size() > 0){
					for(OrderCommodityInclude orderCommodityInclude : list){
						Commodity commodity = commodityMapper.selectByPrimaryKey(orderCommodityInclude.getCommodityId());
						if(commodity != null){
							orderCommodityInclude.setCommodity(commodity);
						}
					}
					orderRecord.setOrderCommodityIncludeList(list);
				}
			}
			
			Map<String, Object> result = success(orders);
			result.put("total", total);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}
	
	/**
	 * 分销商消费查询
	 * @param distributorId
	 * @param startTime
	 * @param endTime
	 * @param page
	 * @return
	 */
	@RequestMapping("distributorOrder/list/{distributorId}/{startTime}/{endTime}/{page}")
	@ResponseBody
	public Object getDistributorOrderList(
			@PathVariable("distributorId") Long distributorId,
			@PathVariable("startTime") String startTime,
			@PathVariable("endTime") String endTime,
			@PathVariable("page") int page
			){
		try {
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			Map<String, Object> param = new HashMap<String, Object>();
			if(!startTime.equals("0")){
				param.put("startTime", format1.parse(startTime));
			}
			if(!endTime.equals("0")){
				param.put("endTime", format1.parse(endTime));
			}
			param.put("pageSize", ConstantVariable.Pagesize);
			param.put("offset", page * ConstantVariable.Pagesize);
			param.put("distributorId", distributorId);
			
			List<OrderRecord> orders = orderRecordMapper.selectOrdersSelective(param);
			for(OrderRecord order : orders){
				Map<String, Object> queryParam = new HashMap<String, Object>();
				queryParam.put("distributorId", distributorId);
				queryParam.put("orderId", order.getId());
				List<DistributorCommission> list = distributorCommissionMapper.selectCommissionsSelective(queryParam);
				if(list.size() == 1){
					order.setCommission(list.get(0).getCommission());
				}
			}
			int total = orderRecordMapper.getCountSelective(param);
			Map<String, Object> result = success(orders);
			result.put("total", total);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}
	
	/**
	 * 分销商积分查询
	 * @param distributorId
	 * @param startTime
	 * @param endTime
	 * @param page
	 * @return
	 */
	@RequestMapping("distributorCommission/list/{distributorId}/{startTime}/{endTime}/{page}")
	@ResponseBody
	public Object getDistributorCommissionList(
			@PathVariable("distributorId") Long distributorId,
			@PathVariable("startTime") String startTime,
			@PathVariable("endTime") String endTime,
			@PathVariable("page") int page
			){
		try {
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			Map<String, Object> param = new HashMap<String, Object>();
			if(!startTime.equals("0")){
				param.put("startTime", format1.parse(startTime));
			}
			if(!endTime.equals("0")){
				param.put("endTime", format1.parse(endTime));
			}
			param.put("pageSize", ConstantVariable.Pagesize);
			param.put("offset", page * ConstantVariable.Pagesize);
			param.put("distributorId", distributorId);
			List<DistributorCommission> distributorcommisssions = distributorCommissionMapper.selectCommissionsSelective(param);
			
			for(DistributorCommission distributorcommisssion : distributorcommisssions){
				//取Distributor
				Long orderId = distributorcommisssion.getOrderId();
				if(orderId != null){
					OrderRecord orderRecord = orderRecordMapper.selectByPrimaryKey(orderId);
					if(orderRecord.getDistributorId() != null){
						Distributor orderDistributor = distributorMapper.selectByPrimaryKey(orderRecord.getDistributorId());
						distributorcommisssion.setOrderDistributor(orderDistributor);
					}
				}
				
				//取DistributorCommissionCommodityMapper
				List<DistributorCommissionCommodity> list = distributorCommissionCommodityMapper.getListByDistributorCommissionId(distributorcommisssion.getId());
				if(list.size() > 0){
					distributorcommisssion.setDistributorCommissionCommodityList(list);
				}
			}
			int total = distributorCommissionMapper.getCountSelective(param);
			Map<String, Object> result = success(distributorcommisssions);
			result.put("total", total);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}
	
}
