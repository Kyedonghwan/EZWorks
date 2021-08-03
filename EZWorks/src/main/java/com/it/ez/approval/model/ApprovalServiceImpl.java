package com.it.ez.approval.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ApprovalServiceImpl implements ApprovalService{

	private final ApprovalDAO approvalDao;
	
	@Override
	public int insertApproval(ApprovalVO approvalVo) {
		return approvalDao.insertApproval(approvalVo);
	}

	@Override
	@Transactional
	public int insertApprovalLine(List<ApprovalLineVO> list) {
		int cnt=0;
		for(ApprovalLineVO vo:list) {
			cnt = approvalDao.insertApprovalLine(vo);
		}
		return cnt;
	}

	@Override
	public int insertReference(List<ReferenceVO> list) {
		int cnt=0;
		for(ReferenceVO vo:list) {
			cnt = approvalDao.insertReference(vo);
		}
		return cnt;
	}

	@Override
	public int insertBrowse(List<BrowseVO> list) {
		int cnt=0;
		for(BrowseVO vo:list) {
			cnt=approvalDao.insertBrowse(vo);
		}
		return cnt;
	}

	@Override
	public int insertReception(List<ReceptionVO> list) {
		int cnt=0;
		for(ReceptionVO vo:list) {
			cnt = approvalDao.insertReception(vo);
		}
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectWaitApproval(int empNo) {
		return approvalDao.selectWaitApproval(empNo);
	}

	@Override
	public List<Map<String, Object>> selectStamp(int approvalNo) {
		return approvalDao.selectStamp(approvalNo);
	}

	@Override
	public Map<String, Object> selectWaitApprovalVO(int approvalNo) {
		return approvalDao.selectWaitApprovalVO(approvalNo);
	}

	@Override
	public ApprovalVO selectApprovalByNo(int approvalNo) {
		return approvalDao.selectApprovalByNo(approvalNo);
	}

	@Override
	public List<Map<String, Object>> selectReference(int apporvalNo) {
		return approvalDao.selectReference(apporvalNo);
	}

	@Override
	public List<Map<String, Object>> selectBrowse(int apporvalNo) {
		return approvalDao.selectBrowse(apporvalNo);
	}

	@Override
	public List<Map<String, Object>> selectReception(int apporvalNo) {
		return approvalDao.selectReception(apporvalNo);
	}

	@Override
	public int updateApproval(int approvalNo) {
		return approvalDao.updateApproval(approvalNo);
	}

	@Override
	public int updateApprovalLine(ApprovalLineVO vo) {
		return approvalDao.updateApprovalLine(vo);
	}

	@Override
	public int updateCurrentStateComplete(int approvalNo) {
		return approvalDao.updateCurrentStateComplete(approvalNo);
	}

	@Override
	public int isCompleteApproval(int approvalNo) {
		return approvalDao.isCompleteApproval(approvalNo);
	}

	@Override
	public int updateCurrentStateDisagree(int approvalNo) {
		return approvalDao.updateCurrentStateDisagree(approvalNo);
	}

	@Override
	public List<Map<String, Object>> selectCompleteApproval(int empNo) {
		return approvalDao.selectCompleteApproval(empNo);
	}

	@Override
	public Integer selectApprovalLineOrder(ApprovalLineVO vo) {
		return approvalDao.selectApprovalLineOrder(vo);
	}

	@Override
	public int updateApprovalCancel(int approvalNo) {
		return approvalDao.updateApprovalCancel(approvalNo);
	}

	@Override
	public int updateApprovalLineCancel(ApprovalLineVO vo) {
		return approvalDao.updateApprovalLineCancel(vo);
	}

	@Override
	public int updateApprovalLineDisagree(ApprovalLineVO vo) {
		return approvalDao.updateApprovalLineDisagree(vo);
	}

	@Override
	public List<Map<String, Object>> selectReferenceByEmpNo(int empNo) {
		return approvalDao.selectReferenceByEmpNo(empNo);
	}

	@Override
	public List<Map<String, Object>> selectBrowseByEmpNo(int empNo) {
		return approvalDao.selectBrowseByEmpNo(empNo);
	}

	@Override
	public List<Map<String, Object>> selectUnionRef(int empNo) {
		return approvalDao.selectUnionRef(empNo);
	}

	@Override
	public List<Map<String, Object>> selectDraftAll(int empNo) {
		return approvalDao.selectDraftAll(empNo);
	}

	@Override
	public List<Map<String, Object>> selectDraftContinue(int empNo) {
		return approvalDao.selectDraftContinue(empNo);
	}

	@Override
	public List<Map<String, Object>> selectDraftAgree(int empNo) {
		return approvalDao.selectDraftAgree(empNo);
	}

	@Override
	public List<Map<String, Object>> selectDraftDisagree(int empNo) {
		return approvalDao.selectDraftDisagree(empNo);
	}

	@Override
	public List<Map<String, Object>> selectTempList(int empNo) {
		return approvalDao.selectTempList(empNo);
	}

	@Override
	@Transactional
	public int deleteApproval(int approvalNo) {
		int cnt=approvalDao.deleteReference(approvalNo);
		cnt=approvalDao.deleteBrowse(approvalNo);
		cnt=approvalDao.deleteReception(approvalNo);
		cnt=approvalDao.deleteApprovalLine(approvalNo);
		cnt=approvalDao.deleteApproval(approvalNo);
		return cnt;
	}

	

	
	
}
