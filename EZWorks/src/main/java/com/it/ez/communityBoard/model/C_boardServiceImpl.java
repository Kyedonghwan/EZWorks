package com.it.ez.communityBoard.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class C_boardServiceImpl implements C_boardService{
	private final C_boardDAO c_boardDao;
	
	@Override
	public int insertC_board(C_boardVO boardVo) {
		return c_boardDao.insertC_board(boardVo);
	}

	@Override
	public int insertBoardContent(C_boardContentVO contentVo) {
		return c_boardDao.insertBoardContent(contentVo);
	}

	@Override
	public List<C_boardVO> selectC_board(int communityNo) {
		return c_boardDao.selectC_board(communityNo);
	}

	@Override
	public List<C_boardContentVO> selectC_boardContent() {
		return c_boardDao.selectC_boardContent();
	}

	@Override
	public List<Map<String, Object>> selectC_boardView(int communityNo) {
		return c_boardDao.selectC_boardView(communityNo);
	}
	
}
