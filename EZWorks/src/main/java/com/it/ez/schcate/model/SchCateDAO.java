package com.it.ez.schcate.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SchCateDAO {
	List<SchCateVO> showAllCate(int empNo);
	int insertCate(SchCateVO vo);
	SchCateVO showCateName(String schCateNo);
	int updateColor(int schCateNo);
	int delCate(int schCateNo);
	SchCateVO showCateByNo(int schCatNo);
	int updateCate(SchCateVO vo);
}
