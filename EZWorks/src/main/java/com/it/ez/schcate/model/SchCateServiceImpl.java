package com.it.ez.schcate.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SchCateServiceImpl implements SchCateService{
	private final SchCateDAO schCateDao;
	
	@Override
	public List<SchCateVO> showAllCate(int empNo) {
		return schCateDao.showAllCate(empNo);
	}
	
}
