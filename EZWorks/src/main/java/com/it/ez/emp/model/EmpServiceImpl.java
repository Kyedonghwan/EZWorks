package com.it.ez.emp.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmpServiceImpl implements EmpService{
	private final EmpDAO empDao;

	@Override
	public EmpVO selectEmpByEname(String empEname) {
		return empDao.selectEmpByEname(empEname);
	}

	@Override
	public EmpVO selectEmpByEmpNo(int empNo) {
		return empDao.selectEmpByEmpNo(empNo);
	}
	
	@Override
	public List<Map<String, Object>> selectOrganization() {
		return empDao.selectOrganization();
	}

	@Override
	public EmpVO selectEmpInfo(int empNo) {
		return empDao.selectEmpInfo(empNo);
	}
	
}
