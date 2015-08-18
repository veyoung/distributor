package com.distributor.mapper;

import java.util.List;

import com.distributor.model.OrderCommodityInclude;

public interface OrderCommodityIncludeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_commodity_include
     *
     * @mbggenerated Sun Aug 09 22:04:56 CST 2015
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_commodity_include
     *
     * @mbggenerated Sun Aug 09 22:04:56 CST 2015
     */
    int insert(OrderCommodityInclude record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_commodity_include
     *
     * @mbggenerated Sun Aug 09 22:04:56 CST 2015
     */
    int insertSelective(OrderCommodityInclude record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_commodity_include
     *
     * @mbggenerated Sun Aug 09 22:04:56 CST 2015
     */
    OrderCommodityInclude selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_commodity_include
     *
     * @mbggenerated Sun Aug 09 22:04:56 CST 2015
     */
    int updateByPrimaryKeySelective(OrderCommodityInclude record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_commodity_include
     *
     * @mbggenerated Sun Aug 09 22:04:56 CST 2015
     */
    int updateByPrimaryKey(OrderCommodityInclude record);
    
    OrderCommodityInclude selectLatestByCommodityId(Long commodityId);
    
    List<OrderCommodityInclude> selectAllLatest();
    
    void setAllLatestWithOrderId(Long oderId);
    
    int deleteLatestByCommodityId(Long commodityId);
    
    void updateAllLatest();//所有最新的商品都设置为已使用
    
    void addCountBycommodityId(Long commodityId);
    
    void subtractCountBycommodityId(Long commodityId);
    
    
}