package com.it.ez.communityBoard.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.ez.community.common.CommunitySearchVO;

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
	public List<C_boardVO> selectC_board(int communityNo) {
		return c_boardDao.selectC_board(communityNo);
	}

	@Override
	public int updateC_board(C_boardVO boardVo) {
		return c_boardDao.updateC_board(boardVo);
	}

	@Override
	public int deleteC_board(int boardNo) {
		return c_boardDao.deleteC_board(boardNo);
	}

	@Override
	public int insertBoardClassic(C_boardClassicVO classicVo) {
		return c_boardDao.insertBoardClassic(classicVo);
	}

	@Override
	public int insertBoardFeed(C_boardFeedVO feedVo) {
		return c_boardDao.insertBoardFeed(feedVo);
	}

	@Override
	public List<C_boardClassicVO> selectC_boardView(int communityNo) {
		return c_boardDao.selectC_boardView(communityNo);
	}

	@Override
	public List<C_boardClassicVO> selectAllC_boardView() {
		return c_boardDao.selectAllC_boardView();
	}

	@Override
	public C_boardClassicVO selectC_boardClassic(CommunitySearchVO searchVo) {
		return c_boardDao.selectC_boardClassic(searchVo);
	}

	@Override
	public int selectTotalRecord(CommunitySearchVO searchVo) {
		return c_boardDao.selectTotalRecord(searchVo);
	}

	@Override
	public int updateClassicReadCount(int contentNo) {
		return c_boardDao.updateClassicReadCount(contentNo);
	}

	@Override
	public int updateFeedReadCount(int contentNo) {
		return c_boardDao.updateFeedReadCount(contentNo);
	}

	@Override
	public int deleteC_boardClassic(int contentNo) {
		return c_boardDao.deleteC_boardClassic(contentNo);
	}

	@Override
	public int deleteC_boardFeed(int contentNo) {
		return c_boardDao.deleteC_boardFeed(contentNo);
	}
	
	
	
}
