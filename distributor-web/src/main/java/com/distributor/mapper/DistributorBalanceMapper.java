package com.distributor.mapper;

import com.distributor.model.DistributorBalance;

public interface DistributorBalanceMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table distributor_balance
     *
     * @mbggenerated Tue Aug 18 16:35:42 CST 2015
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table distributor_balance
     *
     * @mbggenerated Tue Aug 18 16:35:42 CST 2015
     */
    int insert(DistributorBalance record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table distributor_balance
     *
     * @mbggenerated Tue Aug 18 16:35:42 CST 2015
     */
    int insertSelective(DistributorBalance record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table distributor_balance
     *
     * @mbggenerated Tue Aug 18 16:35:42 CST 2015
     */
    DistributorBalance selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table distributor_balance
     *
     * @mbggenerated Tue Aug 18 16:35:42 CST 2015
     */
    int updateByPrimaryKeySelective(DistributorBalance record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table distributor_balance
     *
     * @mbggenerated Tue Aug 18 16:35:42 CST 2015
     */
    int updateByPrimaryKey(DistributorBalance record);
}