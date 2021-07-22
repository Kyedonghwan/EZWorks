package com.it.ez.posting.model;

import java.util.List;

import org.springframework.stereotype.Service;

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
}
