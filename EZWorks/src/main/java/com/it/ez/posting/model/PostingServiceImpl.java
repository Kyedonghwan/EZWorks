package com.it.ez.posting.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.it.ez.board.common.BoardSearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PostingServiceImpl implements PostingService{
	private final PostingDAO postingDao;

	@Override
	public List<EmpPostingViewVO> selectByBoard(int boardNo) {
		return postingDao.selectByBoard(boardNo);
	}

	@Override
	public List<BoardMainPostingVO> selectAllPosting() {
		return postingDao.selectAllPosting();
	}

	@Override
	public int insertPosting(PostingVO vo) {
		return postingDao.insertPosting(vo);
	}

	@Override
	public int insertPostingFiles(PostingFilesVO vo) {
		return postingDao.insertPostingFiles(vo);
	}

	@Override
	public List<BoardClassicPostingVO> selectAllPostingClassic(BoardSearchVO searchVo) {
		return postingDao.selectAllPostingClassic(searchVo);
	}

	@Override
	public List<BoardFeedPostingVO> selectPostingFeed(int boardNo) {
		return postingDao.selectPostingFeed(boardNo);
	}

	@Override
	public int selectTotalRecord(BoardSearchVO searchVo) {
		return postingDao.selectTotalRecord(searchVo);
	}

	@Override
	public PostingVO selectByPostingNo(int postingNo) {
		return postingDao.selectByPostingNo(postingNo);
	}

	@Override
	public BoardClassicPostingVO selectClassicByPostingNo(int postingNo) {
		return postingDao.selectClassicByPostingNo(postingNo);
	}

	@Override
	public BoardClassicPostingVO selectClassicPrev(int postingNo, int boardNo) {
		return postingDao.selectClassicPrev(postingNo, boardNo);
	}

	@Override
	public BoardClassicPostingVO selectClassicNext(int postingNo, int boardNo) {
		return postingDao.selectClassicNext(postingNo, boardNo);
	}

	@Override
	public int selectTotalCount(int boardNo) {
		return postingDao.selectTotalCount(boardNo);
	}

	@Override
	public int getCurrentStatusVal(int boardNo, int postingNo) {
		return postingDao.getCurrentStatusVal(boardNo, postingNo);
	}

	@Override
	public List<BoardMainPostingVO> selectAllFavBoardPosting(int empNo) {
		return postingDao.selectAllFavBoardPosting(empNo);
	}

	@Override
	public List<PostingFilesVO> selectFilesOfPosting(int postingNo) {
		return postingDao.selectFilesOfPosting(postingNo);
	}
}
