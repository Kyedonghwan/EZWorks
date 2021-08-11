package com.it.ez.community.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.it.ez.community.common.CommunitySearchVO;

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
	public List<CommunityMemberVO> selectAllCommunity(CommunitySearchVO searchVo) {
		return communityDao.selectAllCommunity(searchVo);
	}

	@Override
	public CommunityVO selectCommunityByNo(int communityNo) {
		return communityDao.selectCommunityByNo(communityNo);
	}

	@Override
	public List<CommunityMemberVO> selectCommunityByMember(int memberNo) {
		return communityDao.selectCommunityByMember(memberNo);
	}

	@Override
	public List<CommunityMemberVO> selectMember(int commnityNo) {
		return communityDao.selectMember(commnityNo);
	}

	@Override
	public int insertCommunityMember(CommunityMemberVO memVo) {
		int cnt=communityDao.insertCommunityMember(memVo);
		if(cnt>0) {
			CommunityVO vo=new CommunityVO();
			communityDao.updateCommunityCount(vo);
		}
		return cnt;
	}

	@Override
	public String selectCommunityMaster(int communityNo) {
		return communityDao.selectCommunityMaster(communityNo);
	}

	@Override
	public int selectTotalRecord(CommunitySearchVO searchVo) {
		return communityDao.selectTotalRecord(searchVo);
	}

	@Override
	public List<CommunityMemberVO> selectCommunity() {
		return communityDao.selectCommunity();
	}

	@Override
	public List<CommunityMemberVO> findMemberNo(int memberNo) {
		return communityDao.findMemberNo(memberNo);
	}


}
