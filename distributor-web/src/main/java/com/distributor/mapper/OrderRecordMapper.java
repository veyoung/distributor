package com.distributor.mapper;

import java.util.List;
import java.util.Map;

import com.distributor.model.OrderRecord;

public interface OrderRecordMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_record
     *
     * @mbggenerated Thu Aug 20 22:45:15 CST 2015
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_record
     *
     * @mbggenerated Thu Aug 20 22:45:15 CST 2015
     */
    int insert(OrderRecord record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_record
     *
     * @mbggenerated Thu Aug 20 22:45:15 CST 2015
     */
    int insertSelective(OrderRecord record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_record
     *
     * @mbggenerated Thu Aug 20 22:45:15 CST 2015
     */
    OrderRecord selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_record
     *
     * @mbggenerated Thu Aug 20 22:45:15 CST 2015
     */
    int updateByPrimaryKeySelective(OrderRecord record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_record
     *
     * @mbggenerated Thu Aug 20 22:45:15 CST 2015
     */
    int updateByPrimaryKey(OrderRecord record);
    
    List<OrderRecord> selectOrdersSelective(Map<String, Object> param);
    
    int getCountSelective(Map<String, Object> param);
    
    //删除分销商，级联删除订单
    void deleteOrderByDistributorId(Long distributorId);
}