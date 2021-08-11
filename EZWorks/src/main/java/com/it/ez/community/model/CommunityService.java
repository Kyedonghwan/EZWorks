package com.it.ez.community.model;

import java.util.List;

import com.it.ez.community.common.CommunitySearchVO;

public interface CommunityService {
	int insertCommunity(CommunityVO vo);
	List<CommunityMemberVO> selectAllCommunity(CommunitySearchVO searchVo);
	List<CommunityMemberVO> selectCommunity();
	CommunityVO selectCommunityByNo(int communityNo);
	List<CommunityMemberVO>selectCommunityByMember(int memberNo);
	List<CommunityMemberVO>selectMember(int commnityNo);
	List<CommunityMemberVO> findMemberNo(int memberNo);
	int insertCommunityMember(CommunityMemberVO memVo);
	String selectCommunityMaster(int communityNo);
	int selectTotalRecord(CommunitySearchVO searchVo);
}
