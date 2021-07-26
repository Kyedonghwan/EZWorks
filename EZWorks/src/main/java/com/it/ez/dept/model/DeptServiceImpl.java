package com.it.ez.dept.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeptServiceImpl implements DeptService{
	private final DeptDAO deptDao;
	
	@Override
	public List<DeptVO> selectDept() {
		return deptDao.selectDept();
	}
	
}
