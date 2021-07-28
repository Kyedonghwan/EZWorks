package com.it.ez.communityBoard.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface C_boardDAO {
	int insertC_board(C_boardVO boardVo);
	List<C_boardVO> selectC_board(int communityNo);
	int updateC_board(C_boardVO boardVo);
	int deleteC_board(int boardNo);
	int insertBoardContent(C_boardClassicVO contentVo);
	List<C_boardClassicVO> selectC_boardView(int communityNo);
	List<C_boardClassicVO> selectAllC_boardView();
	int deleteC_boardContent(int contentNo);
}
