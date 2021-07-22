package com.it.ez.emp.model;

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
}
