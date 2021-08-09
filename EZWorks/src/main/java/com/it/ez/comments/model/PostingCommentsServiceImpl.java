package com.it.ez.comments.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PostingCommentsServiceImpl implements PostingCommentsService{
	private final PostingCommentsDAO postingCommentsDao;
	
	@Override
	public List<PostingReplyViewVO> allCommentsByPostingNo(int postingNo) {
		return postingCommentsDao.allCommentsByPostingNo(postingNo);
	}

	@Override
	public int addComments(PostingReplyVO vo) {
		return postingCommentsDao.addComments(vo);
	}

	@Override
	public PostingReplyViewVO selectReplyByNo(int replyNo) {
		return postingCommentsDao.selectReplyByNo(replyNo);
	}

	@Override
	public int selectReplyCountByPostingNo(int postingNo) {
		return postingCommentsDao.selectReplyCountByPostingNo(postingNo);
	}
	
}
