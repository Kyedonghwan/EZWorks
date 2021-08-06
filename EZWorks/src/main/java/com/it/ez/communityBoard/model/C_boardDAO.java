package com.it.ez.communityBoard.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.ez.community.common.CommunitySearchVO;

@Mapper
public interface C_boardDAO {
	int insertC_board(C_boardVO boardVo);
	List<C_boardVO> selectC_boardList(int communityNo);
	C_boardVO selectC_boardByNo(int boardNo);
	int updateC_board(C_boardVO boardVo);
	int deleteC_board(int boardNo);
	int insertBoardClassic(C_boardClassicVO classicVo);
	int insertBoardFeed(C_boardFeedVO feedVo);
	List<C_boardClassicVO> selectC_boardClassicAll();
	List<C_boardClassicVO> selectC_boardClassicMain(int communityNo);
	int selectC_boardClassicCount(int communityNo);
	int selectC_boardFeedCount(int communityNo);
	List<C_boardClassicVO> searchC_boardClassic(CommunitySearchVO searchVo);
	List<C_boardFeedVO> selectC_boardFeedAll();
	List<C_boardFeedVO> selectC_boardFeedMain(int communityNo);
	List<C_boardFeedVO> selectFeed(C_boardFeedVO feedVo);
	int selectTotalRecord(CommunitySearchVO searchVo);
	int updateClassicReadCount(int contentNo);
	int deleteC_boardClassic(int contentNo);
	int deleteC_boardFeed(int contentNo);
}
