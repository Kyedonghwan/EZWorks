package com.it.ez.approvalcomment.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ApprovalCommentServiceImpl implements ApprovalCommentService{
	private final ApprovalCommentDAO dao;
	
	@Override
	public int insertAC(ApprovalCommentVO vo) {
		int cnt = dao.insertAC(vo);
		return cnt;
	}
	
	public List<Map<String,Object>> showAll(int approvalNo){
		return dao.selectAcList(approvalNo);
	}
}
