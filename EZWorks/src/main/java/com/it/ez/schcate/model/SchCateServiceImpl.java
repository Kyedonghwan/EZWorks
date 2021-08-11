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

	@Override
	public int updateColor(int schCateNo) {
		return schCateDao.updateColor(schCateNo);
	}

	@Override
	public int delCate(int schCateNo) {
		return schCateDao.delCate(schCateNo);
	}

	@Override
	public SchCateVO showCateByNo(int schCatNo) {
		return schCateDao.showCateByNo(schCatNo);
	}

	@Override
	public int updateCate(SchCateVO vo) {
		return schCateDao.updateCate(vo);
	}
	
}
