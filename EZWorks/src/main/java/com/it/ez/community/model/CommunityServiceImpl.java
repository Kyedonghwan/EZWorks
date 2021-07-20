package com.it.ez.community.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.it.ez.communityBoard.model.C_boardContentVO;
import com.it.ez.communityBoard.model.C_boardVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService{
	private final CommunityDAO communityDao;
	
	@Override
	public int insertCommunity(CommunityVO vo) {
		return communityDao.insertCommunity(vo);
	}

	@Override
	public List<CommunityVO> selectCommunity() {
		return communityDao.selectCommunity();
	}

	@Override
	public CommunityVO selectCommunityByNo(int communityNo) {
		return communityDao.selectCommunityByNo(communityNo);
	}

	@Override
	public int insertC_board(C_boardVO boardVo) {
		return communityDao.insertC_board(boardVo);
	}

	@Override
	public int insertBoardContent(C_boardContentVO contentVo) {
		return communityDao.insertBoardContent(contentVo);
	}

	@Override
	public List<C_boardVO> selectC_board(int communityNo) {
		return communityDao.selectC_board(communityNo);
	}

	@Override
	public List<C_boardContentVO> selectC_boardContent() {
		return communityDao.selectC_boardContent();
	}


}
