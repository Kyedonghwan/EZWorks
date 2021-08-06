package com.it.ez.myapprovalline.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyApprovalLineDAO {
	int insertMal(MyApprovalLineVO vo);
	List<String> loadMal(int empNo);
	int isDuplMalName(MyApprovalLineVO vo);
	List<Map<String,Object>> loadMals(MyApprovalLineVO vo);
	Map<String,Object> selectDept(int malEmpno);
}
