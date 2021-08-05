package com.it.ez.approvalcomment.model;

import java.util.List;
import java.util.Map;

public interface ApprovalCommentService {
	int insertAC(ApprovalCommentVO vo);
	List<Map<String,Object>> showAll(int approvalNo);
}
