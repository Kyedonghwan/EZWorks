package com.it.ez.emp.model;

public interface EmpService {
	public EmpVO selectEmpByEname(String empEname);
	public EmpVO selectEmpByEmpNo(int empNo);
}
