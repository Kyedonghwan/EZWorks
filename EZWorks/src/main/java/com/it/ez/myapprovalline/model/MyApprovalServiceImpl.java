package com.it.ez.myapprovalline.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyApprovalServiceImpl implements MyApprovalLineService{
	private final MyApprovalLineDAO dao;

	@Override
	@Transactional
	public String insertMal(List<MyApprovalLineVO> list) {
		int cnt=0;
		if(dao.isDuplMalName(list.get(0))>0){
			return "이미 존재합니다.";
		}
		
		for(MyApprovalLineVO vo:list) {
			cnt = dao.insertMal(vo);
		}
		
		return "추가되었습니다.";
	}

	@Override
	public List<String> loadMal(int empNo) {
		return dao.loadMal(empNo);
	}

	@Override
	public List<Map<String, Object>> loadMals(MyApprovalLineVO vo) {
		return dao.loadMals(vo);
	}
	
	

	@Override
	public Map<String, Object> selectDept(int malEmpno) {
		return dao.selectDept(malEmpno);
	}
	
}
