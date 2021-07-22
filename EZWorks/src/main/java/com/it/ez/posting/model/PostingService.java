package com.it.ez.posting.model;

import java.util.List;

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
}
