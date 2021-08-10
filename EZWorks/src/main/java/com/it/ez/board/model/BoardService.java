package com.it.ez.board.model;

import java.util.List;

public interface BoardService {
	//게시판 유형 종류 
	public static final String ENTERPRISE_BOARD="전사게시판";
	public static final String DEPARTMENT_BOARD="부서게시판";
	//게시판 형태 종류
	public static final String BOARD_CLASSIC="CLASSIC";
	public static final String BOARD_FEED="FEED";
	//게시판 공유 설정
	public static final int NO_SHARE_BOARD=0;
	public static final int SHARE_BOARD=1;
	//게시판 공개 여부 설정
	public static final int BOARD_IS_PUBLIC=0;
	public static final int BOARD_IS_PRIVATE=1;
	//게시판 익명 여부 설정
	public static final int BOARD_IS_NOT_ANONYMOUS=0;
	public static final int BOARD_IS_ANONYMOUS=1;
	//게시판 말머리 사용 여부 설정
	public static final int BOARD_NOT_USE_HEADER=0;
	public static final int BOARD_USE_HEADER=1;
	//게시판 이메일 사용 여부 설정
	public static final int BOARD_USE_MAIL=0;
	public static final int BOARD_NOT_USE_MAIL=1;
	//게시판 삭제글 제목 표시 여부 설정
	public static final int BOARD_SHOW_TITLE=1;
	public static final int BOARD_NOT_SHOW_TITLE=0;
	//게시판 댓글 사용 여부 설정
	public static final int REPLY_ALLOWED=0;
	public static final int REPLY_NOT_ALLOWED=1;
	//게시판이 폴더로써 작용함의 여부 설정
	public static final int BOARD_IS_NOT_FOLDER=0;
	public static final int BOARD_IS_FOLDER=1;
	//구분선인지의 여부 설정
	public static final int BOARD_IS_NOT_LINE=0;
	public static final int BOARD_IS_LINE=1;
	
	
	public List<BoardVO> selectAllBoard();
	public BoardVO selectByBoardNo(int boardNo);
	public List<BoardVO> selectByBoardType(String boardType);
	public List<String> selectBoardAdmin(int boardNo);
	public int insertFavBoards(int boardNo, int empNo);
	public List<BoardVO> selectFavBoards(int empNo);
	public int deleteFavBoards(int boardNo, int empNo);
	public List<BoardVO> selectBoardByDeptNo(int deptNo);
}
