package com.it.ez.communityBoard.model;

import java.util.List;

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
	public List<C_boardVO> selectC_boardList(int communityNo) {
		return c_boardDao.selectC_boardList(communityNo);
	}


	@Override
	public C_boardVO selectC_boardByNo(int boardNo) {
		return c_boardDao.selectC_boardByNo(boardNo);
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
	public List<C_boardClassicVO> searchC_boardClassic(CommunitySearchVO searchVo) {
		return c_boardDao.searchC_boardClassic(searchVo);
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
	public int deleteC_boardClassic(int contentNo) {
		return c_boardDao.deleteC_boardClassic(contentNo);
	}

	@Override
	public int deleteC_boardFeed(int contentNo) {
		return c_boardDao.deleteC_boardFeed(contentNo);
	}

	@Override
	public List<C_boardClassicVO> selectC_boardClassicAll() {
		return c_boardDao.selectC_boardClassicAll();
	}

	@Override
	public List<C_boardFeedVO> selectC_boardFeedAll() {
		return c_boardDao.selectC_boardFeedAll();
	}

	@Override
	public List<C_boardClassicVO> selectC_boardClassicMain(int communityNo) {
		return c_boardDao.selectC_boardClassicMain(communityNo);
	}

	@Override
	public List<C_boardFeedVO> selectC_boardFeedMain(int communityNo) {
		return c_boardDao.selectC_boardFeedMain(communityNo);
	}

	@Override
	public List<C_boardFeedVO> selectFeed(C_boardFeedVO feedVo) {
		return c_boardDao.selectFeed(feedVo);
	}

	@Override
	public int selectC_boardCount(int communityNo) {
		int cnt1=c_boardDao.selectC_boardClassicCount(communityNo);
		int cnt2=c_boardDao.selectC_boardFeedCount(communityNo);
		int sum=cnt1+cnt2;
		
		return sum;
	}

	@Override
	public int selectC_boardClassicCount(int communityNo) {
		return c_boardDao.selectC_boardClassicCount(communityNo);
	}

	@Override
	public int selectC_boardFeedCount(int communityNo) {
		return c_boardDao.selectC_boardFeedCount(communityNo);
	}

	@Override
	public int insertReply(C_boardReplyVO replyVo) {
		int cnt =c_boardDao.insertReply(replyVo);
		if(cnt>0) {
			c_boardDao.updateReplyCounts(replyVo.getGroupNo());			
		}
		
		return cnt;
	}

	@Override
	public List<C_boardReplyVO> selectC_boardReply(int groupNo) {
		return c_boardDao.selectC_boardReply(groupNo);
	}

	@Override
	public C_boardClassicVO selectClassicDetail(int contentNo) {
		return c_boardDao.selectClassicDetail(contentNo);
	}

	@Override
	public int deleteReply(int replyNo) {
		return c_boardDao.deleteReply(replyNo);
	}

	@Override
	public int updateDownCount(int contentNo) {
		return c_boardDao.updateDownCount(contentNo);
	}
	
	
}
