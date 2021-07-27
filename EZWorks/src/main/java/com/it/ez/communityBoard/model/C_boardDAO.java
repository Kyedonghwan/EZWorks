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
	int insertBoardContent(C_boardContentVO contentVo);
	List<C_boardContentVO> selectC_boardView(int communityNo);
	List<C_boardContentVO> selectAllC_boardView();
	int deleteC_boardContent(int contentNo);
}
