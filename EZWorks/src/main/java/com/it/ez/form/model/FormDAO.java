package com.it.ez.form.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FormDAO {
	List<FormVO> selectForm();
	List<String> selectFormFolder();
	int insertUsedForm(Map<String, Object> map);
	List<Map<String,Object>> showUsedForm(int empNo);
	int isDuplUsedForm(Map<String,Object> map);
}
