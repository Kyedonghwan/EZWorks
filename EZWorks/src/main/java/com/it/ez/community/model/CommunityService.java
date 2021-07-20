package com.it.ez.community.model;

import java.util.List;

import com.it.ez.communityBoard.model.C_boardContentVO;
import com.it.ez.communityBoard.model.C_boardVO;

public interface CommunityService {
	int insertCommunity(CommunityVO vo);
	List<CommunityVO> selectCommunity();
	CommunityVO selectCommunityByNo(int communityNo);
	int insertC_board(C_boardVO boardVo);
	int insertBoardContent(C_boardContentVO contentVo);
	List<C_boardVO> selectC_board(int communityNo);
	List<C_boardContentVO> selectC_boardContent();
}
