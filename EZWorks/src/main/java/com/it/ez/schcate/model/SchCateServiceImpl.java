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

	@Override
	public int insertCate(SchCateVO vo) {
		return schCateDao.insertCate(vo);
	}

	@Override
	public SchCateVO showCateName(String schCateNo) {
		return schCateDao.showCateName(schCateNo);
	}
	
}
