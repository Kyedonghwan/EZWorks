package com.it.ez.community.model;

import java.util.List;

import com.it.ez.communityBoard.model.C_boardClassicVO;
import com.it.ez.communityBoard.model.C_boardVO;

public interface CommunityService {
	int insertCommunity(CommunityVO vo);
	List<CommunityVO> selectCommunity();
	CommunityVO selectCommunityByNo(int communityNo);
	List<CommunityLevelVO>selectCommunityMember(int communityNo);
	int insertCommunityMember(CommunityLevelVO levelVo);
}
