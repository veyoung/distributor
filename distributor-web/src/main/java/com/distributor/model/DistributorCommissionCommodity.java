package com.distributor.model;

import java.util.Date;

public class DistributorCommissionCommodity {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor_commission_commodity.id
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    private Long id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor_commission_commodity.commodity_name
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    private String commodityName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor_commission_commodity.commodity_count
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    private Integer commodityCount;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor_commission_commodity.commodity_commission
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    private Integer commodityCommission;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor_commission_commodity.distributor_commission_id
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    private Long distributorCommissionId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor_commission_commodity.create_time
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    private Date createTime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor_commission_commodity.id
     *
     * @return the value of distributor_commission_commodity.id
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    public Long getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor_commission_commodity.id
     *
     * @param id the value for distributor_commission_commodity.id
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor_commission_commodity.commodity_name
     *
     * @return the value of distributor_commission_commodity.commodity_name
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    public String getCommodityName() {
        return commodityName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor_commission_commodity.commodity_name
     *
     * @param commodityName the value for distributor_commission_commodity.commodity_name
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    public void setCommodityName(String commodityName) {
        this.commodityName = commodityName == null ? null : commodityName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor_commission_commodity.commodity_count
     *
     * @return the value of distributor_commission_commodity.commodity_count
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    public Integer getCommodityCount() {
        return commodityCount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor_commission_commodity.commodity_count
     *
     * @param commodityCount the value for distributor_commission_commodity.commodity_count
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    public void setCommodityCount(Integer commodityCount) {
        this.commodityCount = commodityCount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor_commission_commodity.commodity_commission
     *
     * @return the value of distributor_commission_commodity.commodity_commission
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    public Integer getCommodityCommission() {
        return commodityCommission;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor_commission_commodity.commodity_commission
     *
     * @param commodityCommission the value for distributor_commission_commodity.commodity_commission
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    public void setCommodityCommission(Integer commodityCommission) {
        this.commodityCommission = commodityCommission;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor_commission_commodity.distributor_commission_id
     *
     * @return the value of distributor_commission_commodity.distributor_commission_id
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    public Long getDistributorCommissionId() {
        return distributorCommissionId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor_commission_commodity.distributor_commission_id
     *
     * @param distributorCommissionId the value for distributor_commission_commodity.distributor_commission_id
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    public void setDistributorCommissionId(Long distributorCommissionId) {
        this.distributorCommissionId = distributorCommissionId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor_commission_commodity.create_time
     *
     * @return the value of distributor_commission_commodity.create_time
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor_commission_commodity.create_time
     *
     * @param createTime the value for distributor_commission_commodity.create_time
     *
     * @mbggenerated Fri Aug 21 12:25:53 CST 2015
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}