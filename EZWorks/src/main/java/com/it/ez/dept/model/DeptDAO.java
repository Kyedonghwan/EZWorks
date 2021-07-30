package com.it.ez.dept.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeptDAO {
	List<DeptVO> selectDept();
	DeptVO selectDeptByDeptNo(int deptNo);
}
