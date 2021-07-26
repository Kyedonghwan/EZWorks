package com.it.ez.emp.model;

import java.util.List;
import java.util.Map;

public interface EmpService {
	List<Map<String,Object>> selectOrganization();
	public EmpVO selectEmpByEname(String empEname);
	public EmpVO selectEmpByEmpNo(int empNo);
}