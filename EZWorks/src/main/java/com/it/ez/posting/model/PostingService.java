package com.it.ez.posting.model;

import java.util.List;

import com.it.ez.board.common.BoardSearchVO;

public interface PostingService {
	public static final int POSTING_ISPUBLIC=0;
	public static final int POSTING_ISPRIVATE=1;
	
	public static final int POSTING_ISNOTNOTICE=0;
	public static final int POSTING_ISNOTICE=1;

	public static final int POSTING_ISNOTTEMP=0;
	public static final int POSTING_ISTEMP=1;
	
	public List<EmpPostingViewVO> selectByBoard(int boardNo);
	public List<BoardMainPostingVO> selectAllPosting();
	public int insertPosting(PostingVO vo);
	public int insertPostingFiles(PostingFilesVO vo);
	public List<BoardClassicPostingVO> selectAllPostingClassic(BoardSearchVO searchVo);
	public List<BoardFeedPostingVO> selectPostingFeed(int boardNo);
	int selectTotalRecord(BoardSearchVO searchVo);
	public PostingVO selectByPostingNo(int postingNo);
	public BoardClassicPostingVO selectClassicByPostingNo(int postingNo);
	public BoardClassicPostingVO selectClassicPrev(int postingNo, int boardNo);
	public BoardClassicPostingVO selectClassicNext(int postingNo, int boardNo);
	public int selectTotalCount(int boardNo);
	public int getCurrentStatusVal(int boardNo, int postingNo);
	public List<BoardMainPostingVO> selectAllFavBoardPosting(int empNo);
	public List<PostingFilesVO> selectFilesOfPosting(int postingNo);
	public int addLike(int postingNo, int empNo);
	public int deleteLike(int postingNo, int empNo);
	public int countLikes(int postingNo);
	public int hasLiked(int postingNo, int empNo);
}
