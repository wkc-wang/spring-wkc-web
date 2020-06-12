package com.edu.mapper;

import com.edu.bean.Deptartment;
import com.edu.bean.DeptartmentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeptartmentMapper {
    long countByExample(DeptartmentExample example);

    int deleteByExample(DeptartmentExample example);

    int deleteByPrimaryKey(Integer deptId);

    int insert(Deptartment record);

    int insertSelective(Deptartment record);

    List<Deptartment> selectByExample(DeptartmentExample example);

    Deptartment selectByPrimaryKey(Integer deptId);

    int updateByExampleSelective(@Param("record") Deptartment record, @Param("example") DeptartmentExample example);

    int updateByExample(@Param("record") Deptartment record, @Param("example") DeptartmentExample example);

    int updateByPrimaryKeySelective(Deptartment record);

    int updateByPrimaryKey(Deptartment record);
}