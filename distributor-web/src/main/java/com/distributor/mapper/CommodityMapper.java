package com.distributor.mapper;

import java.util.List;
import java.util.Map;

import com.distributor.model.Commodity;

public interface CommodityMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table commodity
     *
     * @mbggenerated Mon Aug 03 21:33:08 CST 2015
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table commodity
     *
     * @mbggenerated Mon Aug 03 21:33:08 CST 2015
     */
    int insert(Commodity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table commodity
     *
     * @mbggenerated Mon Aug 03 21:33:08 CST 2015
     */
    int insertSelective(Commodity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table commodity
     *
     * @mbggenerated Mon Aug 03 21:33:08 CST 2015
     */
    Commodity selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table commodity
     *
     * @mbggenerated Mon Aug 03 21:33:08 CST 2015
     */
    int updateByPrimaryKeySelective(Commodity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table commodity
     *
     * @mbggenerated Mon Aug 03 21:33:08 CST 2015
     */
    int updateByPrimaryKey(Commodity record);
    
    List<Commodity> selectSelective(Map<String, Object> param);
    
    int countSelectSelective(Map<String, Object> param);
    
    //删除某个类目下的所有商品
    int deleteByCategoryId(Long categoryId);
    
    Commodity selectByName(String name);
    
    Commodity selectWithSearhName(String name);
}