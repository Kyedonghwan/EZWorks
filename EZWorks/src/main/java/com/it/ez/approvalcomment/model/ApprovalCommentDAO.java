package com.it.ez.approvalcomment.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalCommentDAO {
	int insertAC(ApprovalCommentVO vo);
	ApprovalCommentVO selectAC(int acNo);
	List<Map<String,Object>> selectAcList(int approvalNo);
}
