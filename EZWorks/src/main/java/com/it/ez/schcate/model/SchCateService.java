package com.it.ez.schcate.model;

import java.util.List;

public interface SchCateService {
	List<SchCateVO> showAllCate(int empNo);
	int insertCate(SchCateVO vo);
	SchCateVO showCateName(String schCateNo);
	int updateColor(int schCateNo);
	int delCate(int schCateNo);
	SchCateVO showCateByNo(int schCatNo);
	int updateCate(SchCateVO vo);
}
