package com.it.ez.community.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.it.ez.communityBoard.model.C_boardClassicVO;
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
	public List<CommunityLevelVO> selectCommunityMember(int communityNo) {
		return communityDao.selectCommunityMember(communityNo);
	}

	@Override
	public int insertCommunityMember(CommunityLevelVO levelVo) {
		return communityDao.insertCommunityMember(levelVo);
	}

}
