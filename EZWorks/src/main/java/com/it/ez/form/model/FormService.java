package com.it.ez.form.model;

import java.util.List;
import java.util.Map;

public interface FormService {
	List<FormVO> selectForm();
	List<String> selectFormFolder();
	int insertUsedForm(Map<String, Object> map);
	List<Map<String,Object>> showUsedForm(int empNo);
}
