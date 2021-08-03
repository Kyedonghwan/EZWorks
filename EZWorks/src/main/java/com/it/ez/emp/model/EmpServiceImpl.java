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
	public List<Map<String, Object>> selectOrganization() {
		
		return empDao.selectOrganization();
	}

	@Override
	public String selectName(int empNo) {
		return empDao.selectName(empNo);
	}
	
}
