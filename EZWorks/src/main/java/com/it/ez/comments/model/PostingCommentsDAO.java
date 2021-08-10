package com.it.ez.comments.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostingCommentsDAO {
	public List<PostingReplyViewVO> allCommentsByPostingNo(int postingNo);
	public int addComments(PostingReplyVO vo);
	public PostingReplyViewVO selectReplyByNo(int replyNo);
	public int selectReplyCountByPostingNo(int postingNo);
	public int deleteReplies(int postingNo);
}
