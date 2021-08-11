package com.it.ez.community.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.ez.community.common.CommunitySearchVO;
import com.it.ez.communityBoard.model.C_boardClassicVO;
import com.it.ez.communityBoard.model.C_boardVO;

@Mapper
public interface CommunityDAO {
	int insertCommunity(CommunityVO vo);
	List<CommunityMemberVO> selectAllCommunity(CommunitySearchVO searchVo);
	List<CommunityMemberVO> selectCommunity();
	CommunityVO selectCommunityByNo(int communityNo);
	List<CommunityMemberVO>selectCommunityByMember(int memberNo);
	List<CommunityMemberVO>selectMember(int commnityNo);
	List<CommunityMemberVO> findMemberNo(int memberNo);
	int insertCommunityMember(CommunityMemberVO memVo);
	String selectCommunityMaster(int communityNo);
	int updateCommunityCount(CommunityVO vo);
	int selectTotalRecord(CommunitySearchVO searchVo);
} 
