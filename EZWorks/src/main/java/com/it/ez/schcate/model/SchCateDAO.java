package com.it.ez.schcate.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SchCateDAO {
	List<SchCateVO> showAllCate(int empNo);
}