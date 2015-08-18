package com.distributor.model;

import java.util.List;

public class Distributor {
	private List<Distributor> subDistributors;//下属会员集合
	private Distributor owner;//上级会员
	
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor.id
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    private Long id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor.name
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor.level
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    private Integer level;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor.balance
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    private Integer balance;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor.mobile
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    private String mobile;


    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor.status
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    private Integer status;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column distributor.description
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    private String description;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor.id
     *
     * @return the value of distributor.id
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public Long getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor.id
     *
     * @param id the value for distributor.id
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor.name
     *
     * @return the value of distributor.name
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor.name
     *
     * @param name the value for distributor.name
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor.level
     *
     * @return the value of distributor.level
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public Integer getLevel() {
        return level;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor.level
     *
     * @param level the value for distributor.level
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public void setLevel(Integer level) {
        this.level = level;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor.balance
     *
     * @return the value of distributor.balance
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public Integer getBalance() {
        return balance;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor.balance
     *
     * @param balance the value for distributor.balance
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public void setBalance(Integer balance) {
        this.balance = balance;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor.mobile
     *
     * @return the value of distributor.mobile
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor.mobile
     *
     * @param mobile the value for distributor.mobile
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor.status
     *
     * @return the value of distributor.status
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor.status
     *
     * @param status the value for distributor.status
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column distributor.description
     *
     * @return the value of distributor.description
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public String getDescription() {
        return description;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column distributor.description
     *
     * @param description the value for distributor.description
     *
     * @mbggenerated Sat Aug 01 23:09:59 CST 2015
     */
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

	public List<Distributor> getSubDistributors() {
		return subDistributors;
	}

	public void setSubDistributors(List<Distributor> subDistributors) {
		this.subDistributors = subDistributors;
	}

	public Distributor getOwner() {
		return owner;
	}

	public void setOwner(Distributor owner) {
		this.owner = owner;
	}
}