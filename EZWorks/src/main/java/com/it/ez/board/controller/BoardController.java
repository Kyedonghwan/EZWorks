package com.it.ez.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.it.ez.board.common.BoardConstUtil;
import com.it.ez.board.common.BoardFileUploadUtil;
import com.it.ez.board.common.BoardPaginationInfo;
import com.it.ez.board.common.BoardSearchVO;
import com.it.ez.board.model.BoardService;
import com.it.ez.board.model.BoardVO;
import com.it.ez.emp.model.EmpService;
import com.it.ez.emp.model.EmpVO;
import com.it.ez.posting.model.BoardClassicPostingVO;
import com.it.ez.posting.model.BoardFeedPostingVO;
import com.it.ez.posting.model.BoardMainPostingVO;
import com.it.ez.posting.model.PostingCommentsVO;
import com.it.ez.posting.model.PostingFilesVO;
import com.it.ez.posting.model.PostingService;
import com.it.ez.posting.model.PostingVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	private final PostingService postingService;
	private final BoardFileUploadUtil boardFileUploadUtil;
	//temporary
	private final EmpService empService;
	
	@RequestMapping("/boardMain")
	public String showboard(Model model, HttpSession session) {
		logger.info("게시판 메인 화면");
		
		//temporary
		EmpVO empVo=empService.selectEmpByEname("KIMDEMO");
		session.setAttribute("empVo", empVo);
		
		int empNo = empVo.getEmpNo();
		
		//게시판 사이드바 정보처리
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("파라미터, list={}", list.size());
		model.addAttribute("boardList", list);
		List<BoardVO> favList = boardService.selectFavBoards(empNo);
		model.addAttribute("favList", favList);
		
		//전체 게시글 조회 정규식으로 html 태그 제거 후 보냄.
		List<BoardMainPostingVO> postList = postingService.selectAllPosting();
		for(BoardMainPostingVO pl : postList) {
			String before = pl.getPostingContent();
			String after = before.replaceAll("<([^>]+)>", "");
			pl.setPostingContent(after);
		}
		model.addAttribute("allPostingList", postList);
		
		List<BoardMainPostingVO> favBoardPostingList = postingService.selectAllFavBoardPosting(empNo);
		for(BoardMainPostingVO fpl : favBoardPostingList) {
			String before = fpl.getPostingContent();
			String after = before.replaceAll("<([^>]+)>", "");
			fpl.setPostingContent(after);
		}
		model.addAttribute("favBoardPostingList", favBoardPostingList);
		return "board/boardMain";
	}
	
	@ResponseBody
	@RequestMapping("/getBoardList")
	public List<BoardVO> boardList(@RequestParam String boardType){
		logger.info("ajax로 boardList 받기, 파라미터 boardType={}", boardType);
		
		List<BoardVO> list = boardService.selectByBoardType(boardType);
		logger.info("list 크기, list.size={}", list.size());
		return list;
	}
	
	@RequestMapping("/selectedBoard")
	public String showSelectedBoard(HttpSession session, @RequestParam int boardNo, @ModelAttribute BoardSearchVO searchVo, Model model) {
		logger.info("선택한 게시판으로 이동, 파라미터 boardNo={}", boardNo);
		logger.info("받은 searchvo.레코드카운트퍼페이지={}",searchVo.getRecordCountPerPage());
		//게시판 사이드바 정보
		List<BoardVO> boardList = boardService.selectAllBoard();
		logger.info("파라미터, list={}", boardList.size());
		model.addAttribute("boardList", boardList);
		
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		model.addAttribute("loginEmpNo", empNo);
		List<BoardVO> favList = boardService.selectFavBoards(empNo);
		model.addAttribute("favList", favList);
		//선택한 게시판의 vo
		BoardVO vo = boardService.selectByBoardNo(boardNo);
		logger.info("선택한 게시판 vo={}", vo);
		model.addAttribute("boardVo", vo);
		
		//선택한 게시판의 관리자 리스트
		List<String> adminList = boardService.selectBoardAdmin(boardNo);
		model.addAttribute("adminList", adminList);
		

		//페이징처리
		BoardPaginationInfo boardPagingInfo = new BoardPaginationInfo();
		boardPagingInfo.setCurrentPage(searchVo.getCurrentPage());

		boardPagingInfo.setBlockSize(BoardConstUtil.BLOCK_SIZE);
		if(searchVo.getRecordCountPerPage()!=0) {
			boardPagingInfo.setRecordCountPerPage(searchVo.getRecordCountPerPage());
			logger.info("레코드 처음 바꿈={}", searchVo.getRecordCountPerPage());
		}else {
		boardPagingInfo.setRecordCountPerPage(BoardConstUtil.RECORD_COUNT);
		}
		searchVo.setBoardNo(boardNo);
		searchVo.setFirstRecordIndex(boardPagingInfo.getFirstRecordIndex());
		if(searchVo.getRecordCountPerPage()!=0) {
			searchVo.setRecordCountPerPage(searchVo.getRecordCountPerPage());
			logger.info("레코드카운트 바꿈={}",searchVo.getRecordCountPerPage());
		}else {
			searchVo.setRecordCountPerPage(BoardConstUtil.RECORD_COUNT);
		}
		logger.info("페이지 번호 세팅 후 searchVo={}", searchVo);
		
		int totalRecord=postingService.selectTotalRecord(searchVo);
		logger.info("totalRecord="+totalRecord);
		boardPagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", boardPagingInfo);
		
		//게시판 유형에 따른 url 처리
		String boardShowType = vo.getBoardShowType();
		String url="";
		if(boardShowType.equals(BoardService.BOARD_CLASSIC)) {
			List<BoardClassicPostingVO> postingClassicList = postingService.selectAllPostingClassic(searchVo);
			
			//좋아요 개수 처리
			for(BoardClassicPostingVO postingvo : postingClassicList) {
				int countLikes = postingService.countLikes(postingvo.getPostingNo());
				postingvo.setPostingLikes(countLikes);
			}
			model.addAttribute("postingList", postingClassicList);
			url = "board/boardClassic";
		}else if(boardShowType.equals(BoardService.BOARD_FEED)) {
			List<BoardFeedPostingVO> postingFeedList = postingService.selectPostingFeed(boardNo);
			model.addAttribute("postingList", postingFeedList);
			
			List<PostingFilesVO> allFilesList = new ArrayList<>();
			for(BoardFeedPostingVO feedvo : postingFeedList) {
				List<PostingFilesVO> filesList = postingService.selectFilesOfPosting(feedvo.getPostingNo());
				logger.info("파일 목록, filesList.size={}", filesList.size());
				
				for(PostingFilesVO pf : filesList) {
					allFilesList.add(pf);
				}
				//로그인된 사용자가 좋아요 등록 여부
				int hasLiked = postingService.hasLiked(feedvo.getPostingNo(), empNo);
				feedvo.setHasLiked(hasLiked);
				//게시물 좋아요 수
				int likes = postingService.countLikes(feedvo.getPostingNo());
				feedvo.setPostingLikes(likes);
			}
			model.addAttribute("allFilesList", allFilesList);
			
			url = "board/boardFeed";
		}
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping("/changeRecordCount")
	public int pageRecordChange(@RequestParam int recordCountPerPage, @ModelAttribute BoardPaginationInfo pagingInfo) {
		pagingInfo.setRecordCountPerPage(recordCountPerPage);
		int newRecordC=pagingInfo.getRecordCountPerPage();
		return newRecordC;
	}
	
	@GetMapping("/writePosting")
	public String writePosting(HttpSession session, Model model, @RequestParam(required = false) Integer boardNo, @RequestParam(required = false) Integer postingNo) {
		logger.info("게시판 메인 화면");
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("파라미터, list={}", list.size());
		model.addAttribute("boardList", list);
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		List<BoardVO> favList = boardService.selectFavBoards(empNo);
		model.addAttribute("favList", favList);
		
		Integer boardNo_chk = boardNo;
		
		if(boardNo_chk!=null&&boardNo_chk!=0) {
			BoardVO boardVo = boardService.selectByBoardNo(boardNo);
			model.addAttribute("boardVo", boardVo);
		}
		
		if(postingNo!=null&&postingNo!=0) {
			PostingVO vo = postingService.selectByPostingNo(postingNo);
			model.addAttribute("postingVO", vo);
		}
		
		return "board/writePosting";
	}
	
	@PostMapping("/writePosting")
	public String writePosting_post(@ModelAttribute PostingVO postVo, HttpServletRequest request, Model model, HttpSession session) {
		//post로 넘어온 postingvo 변수들 처리
		logger.info("파라미터 postVo={}",postVo);
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		postVo.setEmpNo(empNo);
		int cnt = postingService.insertPosting(postVo);
		
		int postingNo = postVo.getPostingNo();
		logger.info("postingNo = {}", postingNo);
		logger.info("게시글 입력 처리 결과, cnt={}", cnt);
		//파일 업로드 처리
		String pfFileName="", pfOFileName="";
		long pfFileSize=0;
		
		List<Map<String, Object>> list;
		try {
			list = boardFileUploadUtil.fileUpload(request, BoardConstUtil.UPLOAD_FILE_FLAG, "filepond");
			if(!list.isEmpty()&&list!=null) {
			logger.info(BoardConstUtil.UPLOAD_FILE_FLAG+"");
			logger.info(boardFileUploadUtil.getUploadPath(request, BoardConstUtil.UPLOAD_FILE_FLAG));
			logger.info("파일 list.size={}",list.size());
			List<PostingFilesVO> pfVoList = new ArrayList<>();
				for(int i=0;i<list.size();i++) {
					Map<String, Object> map = list.get(i);
					pfFileName=(String)map.get("fileName");
					pfFileSize=(Long)map.get("fileSize");
					pfOFileName=(String)map.get("originalFileName");
					
					PostingFilesVO pfVo = new PostingFilesVO();
					
					pfVo.setPfFileName(pfFileName);
					pfVo.setPfFileSize(pfFileSize);
					pfVo.setPfOFileName(pfOFileName);
					pfVo.setPostingNo(postingNo);
					
					int fileupcnt = postingService.insertPostingFiles(pfVo);
					if(fileupcnt>0) {
						logger.info("파일 업로드 성공, pfVo={}",pfVo);
					}
					pfVoList.add(pfVo);
				}
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/board/selectedBoard?boardNo="+postVo.getBoardNo();
		//목록으로 반환
	}
	

	@PostMapping("/writeFeedPosting")
	public String writeFeedPosting_post(@ModelAttribute PostingVO postVo, HttpServletRequest request, Model model, HttpSession session) {
		logger.info("Feed 게시판 posting 파라미터 postVo={}", postVo);
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		postVo.setEmpNo(empNo);
		int cnt = postingService.insertPosting(postVo);
		int postingNo = postVo.getPostingNo();
		logger.info("request={}", request);
		String pfFileName="", pfOFileName="";
		long pfFileSize=0;
		
		List<Map<String, Object>> list;
		try {
			list = boardFileUploadUtil.fileUpload(request, BoardConstUtil.UPLOAD_FILE_FLAG, "img_upload");
			if(!list.isEmpty()&&list!=null) {
			logger.info(BoardConstUtil.UPLOAD_FILE_FLAG+"");
			logger.info(boardFileUploadUtil.getUploadPath(request, BoardConstUtil.UPLOAD_FILE_FLAG));
			logger.info("파일 list.size={}",list.size());
			List<PostingFilesVO> pfVoList = new ArrayList<>();
				for(int i=0;i<list.size();i++) {
					Map<String, Object> map = list.get(i);
					pfFileName=(String)map.get("fileName");
					pfFileSize=(Long)map.get("fileSize");
					pfOFileName=(String)map.get("originalFileName");
					
					PostingFilesVO pfVo = new PostingFilesVO();
					
					pfVo.setPfFileName(pfFileName);
					pfVo.setPfFileSize(pfFileSize);
					pfVo.setPfOFileName(pfOFileName);
					pfVo.setPostingNo(postingNo);
					
					int fileupcnt = postingService.insertPostingFiles(pfVo);
					if(fileupcnt>0) {
						logger.info("파일 업로드 성공, pfVo={}",pfVo);
					}
					pfVoList.add(pfVo);
				}
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/board/selectedBoard?boardNo="+postVo.getBoardNo();
	}
	
	@RequestMapping("/postingDetail")
	public String postingDetail(HttpSession session, @RequestParam int postingNo, @RequestParam(required = false) Integer currentStatusVal, Model model) {
		logger.info("상세 게시글 조회, 파라미터 postingNo={}", postingNo);
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("파라미터, list={}", list.size());
		model.addAttribute("boardList", list);
		
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		model.addAttribute("loginEmpNo", empNo);
		
		List<BoardVO> favList = boardService.selectFavBoards(empNo);
		model.addAttribute("favList", favList);
		
		model.addAttribute("loginEmpNo", empNo);
		//파일목록 추가
		List<PostingFilesVO> filesList = postingService.selectFilesOfPosting(postingNo);
		logger.info("파일 목록, filesList.size={}", filesList.size());
		model.addAttribute("filesList", filesList);
		
		//게시물 좋아요 수
		int likes = postingService.countLikes(postingNo);
		logger.info("게시물 좋아요 수 postingNo={}, likes={}", postingNo, likes);
		model.addAttribute("likes", likes);
		
		//로그인된 사용자가 좋아요 등록 여부
		int hasLiked = postingService.hasLiked(postingNo, empNo);
		logger.info("좋아요 여부, hasLiked={}", hasLiked);
		model.addAttribute("hasLiked", hasLiked);
		
		//조회수 증가
		int viewcountupdate = postingService.updateViewCount(postingNo);
		
		//PostingVO vo = postingService.selectByPostingNo(postingNo);
		BoardClassicPostingVO vo = postingService.selectClassicByPostingNo(postingNo);
		int boardNo = vo.getBoardNo();
		if(currentStatusVal==null||currentStatusVal==0) {
			currentStatusVal = postingService.getCurrentStatusVal(boardNo, postingNo);
		}
		vo.setCurrentStatusVal(currentStatusVal);
		model.addAttribute("vo", vo);
		logger.info("current={}",vo.getCurrentStatusVal());
		BoardVO boardVo = boardService.selectByBoardNo(boardNo);
		model.addAttribute("boardVo", boardVo);
		String boardShowType = boardVo.getBoardShowType();
		String url = "";
		if(boardShowType.equals(BoardService.BOARD_CLASSIC)) {
			url = "board/boardClassicDetail";
		}else if(boardShowType.equals(BoardService.BOARD_FEED)) {
			url = "board/boardFeedDetail";
		}
		
		int totalCount = postingService.selectTotalCount(boardNo);
		model.addAttribute("totalCount", totalCount);
		
		return url;
	}
	
	@RequestMapping("/postingClassicPrev")
	public String postingClassicPrev(HttpSession session, @RequestParam int postingNo, @RequestParam int boardNo, Model model) {
		logger.info("이전 글 조회, postingNo={}, boardNo={}", postingNo, boardNo);
		
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("파라미터, list={}", list.size());
		model.addAttribute("boardList", list);
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		
		int empNo = empVo.getEmpNo();
		model.addAttribute("loginEmpNo", empNo);
		List<BoardVO> favList = boardService.selectFavBoards(empNo);
		model.addAttribute("favList", favList);
		
		BoardClassicPostingVO vo = postingService.selectClassicPrev(postingNo, boardNo);
		logger.info("vo.current={}", vo.getCurrentStatusVal());
		model.addAttribute("vo", vo);
		int newPostingNo = vo.getPostingNo();
		
		
		BoardVO boardVo = boardService.selectByBoardNo(boardNo);
		model.addAttribute("boardVo", boardVo);
		logger.info("boardVo={}",boardVo);
		
		int totalCount = postingService.selectTotalCount(boardNo);
		model.addAttribute("totalCount", totalCount);
		
		//파일목록 추가
		List<PostingFilesVO> filesList = postingService.selectFilesOfPosting(newPostingNo);
		logger.info("파일 목록, filesList.size={}", filesList.size());
		model.addAttribute("filesList", filesList);
		
		int likes = postingService.countLikes(newPostingNo);
		logger.info("게시물 좋아요 수 postingNo={}, likes={}", newPostingNo, likes);
		model.addAttribute("likes", likes);
		
		int hasLiked = postingService.hasLiked(newPostingNo, empNo);
		logger.info("좋아요 여부, hasLiked={}", hasLiked);
		model.addAttribute("hasLiked", hasLiked);
		
		logger.info("empNo={}, postingNo={}", empNo, postingNo);
		
		//조회수 증가
		int viewcountupdate = postingService.updateViewCount(newPostingNo);
		
		return "board/boardClassicDetail";
	}
	
	@RequestMapping("/postingClassicNext")
	public String postingClassicNext(HttpSession session, @RequestParam int postingNo, @RequestParam int boardNo, Model model) {
		logger.info("다음 글 조회, postingNo={}, boardNo={}", postingNo, boardNo);
		
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("파라미터, list={}", list.size());
		model.addAttribute("boardList", list);
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		model.addAttribute("loginEmpNo", empNo);
		List<BoardVO> favList = boardService.selectFavBoards(empNo);
		model.addAttribute("favList", favList);
		
		BoardClassicPostingVO vo = postingService.selectClassicNext(postingNo, boardNo);
		logger.info("vo.current={}", vo.getCurrentStatusVal());
		model.addAttribute("vo", vo);
		
		int newPostingNo = vo.getPostingNo();
		
		BoardVO boardVo = boardService.selectByBoardNo(boardNo);
		model.addAttribute("boardVo", boardVo);
		logger.info("boardVo={}",boardVo);
		
		int totalCount = postingService.selectTotalCount(boardNo);
		model.addAttribute("totalCount", totalCount);
		
		//파일목록 추가
		List<PostingFilesVO> filesList = postingService.selectFilesOfPosting(newPostingNo);
		logger.info("파일 목록, filesList.size={}", filesList.size());
		model.addAttribute("filesList", filesList);
		
		int likes = postingService.countLikes(newPostingNo);
		logger.info("게시물 좋아요 수 postingNo={}, likes={}", newPostingNo, likes);
		model.addAttribute("likes", likes);
		
		int hasLiked = postingService.hasLiked(newPostingNo, empNo);
		logger.info("좋아요 여부, hasLiked={}", hasLiked);
		model.addAttribute("hasLiked", hasLiked);
		
		logger.info("empNo={}, postingNo={}", empNo, postingNo);
		
		//조회수 증가
		int viewcountupdate = postingService.updateViewCount(postingNo);
		
		return "board/boardClassicDetail";
	}
	
	@RequestMapping("/deletePosting")
	public String deletePosting(@RequestParam int postingNo, @RequestParam int boardNo, HttpServletRequest request) {
		//파일이 있으면 파일 삭제
		List<PostingFilesVO> list = postingService.selectFilesOfPosting(postingNo);
		for(PostingFilesVO vo : list) {
			String fileName = vo.getPfFileName();
			if(fileName!=null&&!fileName.isEmpty()) {
				String upPath = boardFileUploadUtil.getUploadPath(request, BoardConstUtil.UPLOAD_FILE_FLAG);
				File file = new File(upPath, fileName);
				if(file.exists()) {
					boolean bool = file.delete();
					logger.info("파일 삭제 여부:{}", bool);
				}
			}
		}
		//posting 좋아요 삭제 처리
		
		
		//파일 리스트 db 삭제
		int cnt = postingService.deleteFileList(postingNo);
		
		//posting 삭제
		int cnt2 = postingService.deletePosting(postingNo);
		
		return "redirect:/board/selectedBoard?boardNo="+boardNo;
	}
	
	/* public int insertFavBoards(int boardNo, int empNo);
	public List<Integer> selectFavBoards(int empNo);
	public int deleteFavBoards(int boardNo, int empNo); */
	
	@ResponseBody
	@RequestMapping("/insertFavBoards")
	public BoardVO insertFavBoards(@RequestParam int boardNo, @RequestParam int empNo) {
		logger.info("즐겨찾기 게시판 추가 파라미터, boardNo={}, empNo={}", boardNo, empNo);
		
		int cnt = boardService.insertFavBoards(boardNo, empNo);
		if(cnt>0) {
			logger.info("즐겨찾기 추가 완료");
		}else {
			logger.info("즐겨찾기 추가 실패");
		}
		BoardVO vo = boardService.selectByBoardNo(boardNo);
		
		return vo;
	}
	
	@ResponseBody
	@RequestMapping("/deleteFavBoards")
	public void deleteFavBoards(@RequestParam int boardNo, @RequestParam int empNo) {
		logger.info("즐겨찾기 삭제 파라미터, boardNo={}, empNo={}", boardNo, empNo);
		
		int cnt = boardService.deleteFavBoards(boardNo, empNo);
		if(cnt>0) {
			logger.info("즐겨찾기 삭제 완료");
		}else {
			logger.info("즐겨찾기 삭제 실패");
		}
	}
	
	
	@RequestMapping("/download") 
	public ModelAndView download(@ModelAttribute PostingFilesVO vo, HttpServletRequest request) { 
		logger.info("다운로드 처리, 파라미터 vo={}", vo);

		Map<String, Object> map = new HashMap<>();
		
		String uploadPath=boardFileUploadUtil.getUploadPath(request, BoardConstUtil.UPLOAD_FILE_FLAG); 
		File file = new File(uploadPath, vo.getPfFileName()); 
		map.put("file", file); 
		map.put("originalFileName", vo.getPfOFileName());
		
		//ModelAndView(String viewName, Map<String, ?> model) 
		ModelAndView mav = new ModelAndView("boardDownloadView", map); 
		return mav; 
	}
	
	/*
	 * @RequestMapping("/uploadAndDisplayFeedPosting") public
	 * uploadAndDisplayFeedPosting(HttpSession session, Model model) {
	 * 
	 * }
	 * 
	 * @RequestMapping("/uploadAndDisplayComments") public
	 * uploadAndDisplayComments() {
	 * 
	 * }
	 */
	
	@ResponseBody
	@RequestMapping("/addLike")
	public int addLike(@RequestParam int postingNo, @RequestParam int empNo) {
		logger.info("좋아요 처리, 파라미터 postingNo={}, empNo={}", postingNo, empNo);
		
		int cnt = postingService.addLike(postingNo, empNo);
		logger.info("좋아요 처리 결과, cnt={}", cnt);
		
		int likes = postingService.countLikes(postingNo);
		logger.info("게시물 좋아요 수 postingNo={}, likes={}", postingNo, likes);
		
		return likes;
	}
	
	@ResponseBody
	@RequestMapping("/deleteLike")
	public int deleteLike(@RequestParam int postingNo, @RequestParam int empNo) {
		logger.info("좋아요 삭제 처리, 파라미터 postingNo={}, empNo={}", postingNo, empNo);
		
		int cnt = postingService.deleteLike(postingNo, empNo);
		logger.info("좋아요 삭제 처리 결과, cnt={}", cnt);
		
		int likes = postingService.countLikes(postingNo);
		logger.info("게시물 좋아요 수 postingNo={}, likes={}", postingNo, likes);
		
		return likes;
	}
}
