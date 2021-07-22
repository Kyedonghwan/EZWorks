package com.it.ez.emp.model;

import org.apache.ibatis.annotations.Mapper;

//com.it.ez.emp.model.EmpDAO
@Mapper
public interface EmpDAO {

	public EmpVO selectEmpByEname(String empEname);
	public EmpVO selectEmpByEmpNo(int empNo);

}
