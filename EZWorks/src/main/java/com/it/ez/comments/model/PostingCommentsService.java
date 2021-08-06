package com.it.ez.comments.model;

import java.util.List;
import java.util.Map;

public interface PostingCommentsService {
	public List<PostingReplyViewVO> allCommentsByPostingNo(int postingNo);
	public int addComments(PostingReplyVO vo);
	public PostingReplyViewVO selectReplyByNo(int replyNo);
	public int selectReplyCountByPostingNo(int postingNo);
}
