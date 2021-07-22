package com.it.ez.posting.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostingDAO {
	public List<EmpPostingViewVO> selectByBoard(int boardNo);
	public List<BoardMainPostingVO> selectAllPosting();
	public int insertPosting(PostingVO vo);
	public int insertPostingFiles(PostingFilesVO vo);
}
