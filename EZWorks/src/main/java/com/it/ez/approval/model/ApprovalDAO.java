package com.it.ez.approval.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalDAO {
	int insertApproval(ApprovalVO approvalVo);
	int insertApprovalLine(ApprovalLineVO alVo);
	int insertReference(ReferenceVO vo);
	int insertBrowse(BrowseVO vo);
	
	int insertReception(ReceptionVO vo);
	List<Map<String,Object>> selectWaitApproval(int empNo);
	List<Map<String,Object>> selectStamp(int approvalNo);
	Map<String, Object> selectWaitApprovalVO(int approvalNo);
	ApprovalVO selectApprovalByNo(int approvalNo);
	List<Map<String,Object>> selectReference(int apporvalNo);
	List<Map<String,Object>> selectBrowse(int apporvalNo);
	List<Map<String,Object>> selectReception(int apporvalNo);
	int updateApproval(int approvalNo);
	int updateApprovalLine(ApprovalLineVO vo);
	int isCompleteApproval(int approvalNo);
	int updateCurrentStateComplete(int approvalNo);
	int updateCurrentStateDisagree(int approvalNo);
	List<Map<String,Object>> selectCompleteApproval(int empNo);
	Integer selectApprovalLineOrder(ApprovalLineVO vo);
	int updateApprovalCancel(int approvalNo);
	int updateApprovalLineCancel(ApprovalLineVO vo);
	int updateApprovalLineDisagree(ApprovalLineVO vo);
	
	List<Map<String,Object>> selectReferenceByEmpNo(int empNo);
	List<Map<String,Object>> selectBrowseByEmpNo(int empNo);
	List<Map<String,Object>> selectUnionRef(int empNo);
	
	List<Map<String,Object>> selectDraftAll(int empNo);
	List<Map<String,Object>> selectDraftContinue(int empNo);
	List<Map<String,Object>> selectDraftAgree(int empNo);
	List<Map<String,Object>> selectDraftDisagree(int empNo);
	
	List<Map<String,Object>> selectTempList(int empNo);
	
	int deleteReference(int approvalNo);
	int deleteBrowse(int approvalNo);
	int deleteReception(int approvalNo);
	int deleteApprovalLine(int approvalNo);
	int deleteApproval(int approvalNo);
	int deleteApprovalComment(int approvalNo);
	int insertApprovalFile(ApprovalFileVO vo);
	List<ApprovalFileVO> selectApprovalFile(int approvalNo);
	int deleteApprovalFile(int approvalNo);
	
	List<Map<String,Object>> selectDraftAgreeByDept(int deptNo);
	List<Map<String,Object>> selectReferenceByDeptNo(int deptNo);
}
