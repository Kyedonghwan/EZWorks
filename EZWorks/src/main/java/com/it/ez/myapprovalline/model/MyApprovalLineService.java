package com.it.ez.myapprovalline.model;

import java.util.List;
import java.util.Map;

public interface MyApprovalLineService {
	String insertMal(List<MyApprovalLineVO> list);
	List<String> loadMal(int empNo);
	List<Map<String,Object>> loadMals(MyApprovalLineVO vo);
	Map<String,Object> selectDept(int malEmpno);
}
