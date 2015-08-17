package com.distributor.mapper;

import java.util.List;
import java.util.Map;

import com.distributor.model.DistributorInclude;

public interface DistributorIncludeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table distributor_include
     *
     * @mbggenerated Sun Aug 02 11:27:33 CST 2015
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table distributor_include
     *
     * @mbggenerated Sun Aug 02 11:27:33 CST 2015
     */
    int insert(DistributorInclude record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table distributor_include
     *
     * @mbggenerated Sun Aug 02 11:27:33 CST 2015
     */
    int insertSelective(DistributorInclude record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table distributor_include
     *
     * @mbggenerated Sun Aug 02 11:27:33 CST 2015
     */
    DistributorInclude selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table distributor_include
     *
     * @mbggenerated Sun Aug 02 11:27:33 CST 2015
     */
    int updateByPrimaryKeySelective(DistributorInclude record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table distributor_include
     *
     * @mbggenerated Sun Aug 02 11:27:33 CST 2015
     */
    int updateByPrimaryKey(DistributorInclude record);
    
    List<DistributorInclude> selectSubmemberIdsByOwnerId(Long id);
    
    int deleteByOwnerIdAndChildId(Map<String, Object> param);
    
    DistributorInclude selectByChildId(Long childId);
    
    DistributorInclude selectByParentIdAndChildId(Map<String, Object> param);
}