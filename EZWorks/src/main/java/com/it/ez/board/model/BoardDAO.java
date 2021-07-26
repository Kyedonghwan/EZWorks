package com.it.ez.board.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	public List<BoardVO> selectAllBoard();
	public BoardVO selectByBoardNo(int boardNo);
	public List<BoardVO> selectByBoardType(String boardType);
	public List<Integer> selectBoardAdmin(int boardNo);
	public int insertFavBoards(int boardNo, int empNo);
	public List<BoardVO> selectFavBoards(int empNo);
	public int deleteFavBoards(int boardNo, int empNo);
}
