package com.it.ez.communityBoard.model;

import java.util.List;
import java.util.Map;

public interface C_boardService {
	int insertC_board(C_boardVO boardVo);
	int insertBoardContent(C_boardContentVO contentVo);
	List<C_boardVO> selectC_board(int communityNo);
	List<C_boardContentVO> selectC_boardContent();
	List<Map<String, Object>> selectC_boardView(int communityNo);
}
