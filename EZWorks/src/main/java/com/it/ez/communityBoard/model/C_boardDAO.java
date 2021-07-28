package com.it.ez.communityBoard.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.ez.community.common.CommunitySearchVO;

@Mapper
public interface C_boardDAO {
	int insertC_board(C_boardVO boardVo);
	List<C_boardVO> selectC_board(int communityNo);
	int updateC_board(C_boardVO boardVo);
	int deleteC_board(int boardNo);
	int insertBoardClassic(C_boardClassicVO classicVo);
	int insertBoardFeed(C_boardFeedVO feedVo);
	List<C_boardClassicVO> selectC_boardView(int communityNo);
	List<C_boardClassicVO> selectAllC_boardView();
	C_boardClassicVO selectC_boardClassic(CommunitySearchVO searchVo);
	int selectTotalRecord(CommunitySearchVO searchVo);
	int updateClassicReadCount(int contentNo);
	int updateFeedReadCount(int contentNo);
	int deleteC_boardClassic(int contentNo);
	int deleteC_boardFeed(int contentNo);
}
