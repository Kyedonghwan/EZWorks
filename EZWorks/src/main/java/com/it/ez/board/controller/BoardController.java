package com.it.ez.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.it.ez.position.model.PositionService;
import com.it.ez.comments.model.PostingCommentsService;
import com.it.ez.comments.model.PostingReplyVO;
import com.it.ez.comments.model.PostingReplyViewVO;
import com.it.ez.dept.model.DeptService;
import com.it.ez.dept.model.DeptVO;
import com.it.ez.posting.model.BoardClassicPostingVO;
import com.it.ez.posting.model.BoardFeedPostingVO;
import com.it.ez.posting.model.BoardMainPostingVO;
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
	private final PostingCommentsService commentsService;
	private final PositionService positionService;
	private final DeptService deptService;
	//temporary
	private final EmpService empService;
	
	@RequestMapping("/boardMain")
	public String showboard(Model model, HttpSession session) {
		logger.info("????????? ?????? ??????");
		
///////////////////////temporary///////////////////////
		
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
///////////////////////temporary///////////////////////	
		int empNo = empVo.getEmpNo();
		int deptNo = empVo.getDeptNo();
		DeptVO deptVo = deptService.selectDeptByDeptNo(deptNo);
		model.addAttribute("deptVo", deptVo);
		//????????? ???????????? ????????????
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("????????????, list={}", list.size());
		model.addAttribute("boardList", list);
		List<BoardVO> favList = boardService.selectFavBoards(empNo);
		model.addAttribute("favList", favList);
		
		//?????? ????????? ?????? ??????????????? html ?????? ?????? ??? ??????.
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
		logger.info("ajax??? boardList ??????, ???????????? boardType={}", boardType);
		
		List<BoardVO> list = boardService.selectByBoardType(boardType);
		logger.info("list ??????, list.size={}", list.size());
		return list;
	}
	
	@RequestMapping("/selectedBoard")
	public String showSelectedBoard(HttpSession session, @RequestParam int boardNo, @ModelAttribute BoardSearchVO searchVo, Model model) {
		logger.info("????????? ??????????????? ??????, ???????????? boardNo={}", boardNo);
		logger.info("?????? searchvo.??????????????????????????????={}",searchVo.getRecordCountPerPage());
		//????????? ???????????? ??????
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		model.addAttribute("loginEmpNo", empNo);
		int deptNo = empVo.getDeptNo();
		DeptVO deptVo = deptService.selectDeptByDeptNo(deptNo);
		model.addAttribute("deptVo", deptVo);
		//????????? ???????????? ????????????
		List<BoardVO> boardlist = boardService.selectAllBoard();
		logger.info("????????????, list={}", boardlist.size());
		model.addAttribute("boardList", boardlist);
		List<BoardVO> favList = boardService.selectFavBoards(empNo);
		model.addAttribute("favList", favList);
		
		//????????? ???????????? vo
		BoardVO vo = boardService.selectByBoardNo(boardNo);
		logger.info("????????? ????????? vo={}", vo);
		model.addAttribute("boardVo", vo);
		
		//????????? ???????????? ????????? ?????????
		List<String> adminList = boardService.selectBoardAdmin(boardNo);
		model.addAttribute("adminList", adminList);
		

		//???????????????
		BoardPaginationInfo boardPagingInfo = new BoardPaginationInfo();
		boardPagingInfo.setCurrentPage(searchVo.getCurrentPage());

		boardPagingInfo.setBlockSize(BoardConstUtil.BLOCK_SIZE);
		if(searchVo.getRecordCountPerPage()!=0) {
			boardPagingInfo.setRecordCountPerPage(searchVo.getRecordCountPerPage());
			logger.info("????????? ?????? ??????={}", searchVo.getRecordCountPerPage());
		}else {
		boardPagingInfo.setRecordCountPerPage(BoardConstUtil.RECORD_COUNT);
		}
		searchVo.setBoardNo(boardNo);
		searchVo.setFirstRecordIndex(boardPagingInfo.getFirstRecordIndex());
		if(searchVo.getRecordCountPerPage()!=0) {
			searchVo.setRecordCountPerPage(searchVo.getRecordCountPerPage());
			logger.info("?????????????????? ??????={}",searchVo.getRecordCountPerPage());
		}else {
			searchVo.setRecordCountPerPage(BoardConstUtil.RECORD_COUNT);
		}
		logger.info("????????? ?????? ?????? ??? searchVo={}", searchVo);
		
		int totalRecord=postingService.selectTotalRecord(searchVo);
		logger.info("totalRecord="+totalRecord);
		boardPagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", boardPagingInfo);
		
		//????????? ????????? ?????? url ??????
		String boardShowType = vo.getBoardShowType();
		String url="";
		if(boardShowType.equals(BoardService.BOARD_CLASSIC)) {
			List<BoardClassicPostingVO> postingClassicList = postingService.selectAllPostingClassic(searchVo);
			
			//????????? ?????? ??????
			for(BoardClassicPostingVO postingvo : postingClassicList) {
				int countLikes = postingService.countLikes(postingvo.getPostingNo());
				postingvo.setPostingLikes(countLikes);
			}
			model.addAttribute("postingList", postingClassicList);
			url = "board/boardClassic";
		}else if(boardShowType.equals(BoardService.BOARD_FEED)) {
			List<BoardFeedPostingVO> postingFeedList = postingService.selectPostingFeed(boardNo);
			
			List<PostingFilesVO> allFilesList = new ArrayList<>();
			List<PostingReplyViewVO> replyList = new ArrayList<>();
			for(BoardFeedPostingVO feedvo : postingFeedList) {
				List<PostingFilesVO> filesList = postingService.selectFilesOfPosting(feedvo.getPostingNo());
				logger.info("?????? ??????, filesList.size={}", filesList.size());
				
				for(PostingFilesVO pf : filesList) {
					allFilesList.add(pf);
				}
				//???????????? ???????????? ????????? ?????? ??????
				int hasLiked = postingService.hasLiked(feedvo.getPostingNo(), empNo);
				feedvo.setHasLiked(hasLiked);
				//????????? ????????? ???
				int likes = postingService.countLikes(feedvo.getPostingNo());
				feedvo.setPostingLikes(likes);
				
				List<PostingReplyViewVO> postingreplylist = commentsService.allCommentsByPostingNo(feedvo.getPostingNo());
				int replyCount = commentsService.selectReplyCountByPostingNo(feedvo.getPostingNo());
				feedvo.setReplyCount(replyCount);
				for(PostingReplyViewVO list : postingreplylist) {
					replyList.add(list);
				}
			}
			for(PostingReplyViewVO abcd : replyList) {
				logger.info("?????????..? {}", abcd.getPostingNo());
			}
			model.addAttribute("replyList", replyList);
			model.addAttribute("allFilesList", allFilesList);
			model.addAttribute("postingList", postingFeedList);
			
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
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		model.addAttribute("loginEmpNo", empNo);
		
		int deptNo = empVo.getDeptNo();
		DeptVO deptVo = deptService.selectDeptByDeptNo(deptNo);
		model.addAttribute("deptVo", deptVo);
		//????????? ???????????? ????????????
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("????????????, list={}", list.size());
		model.addAttribute("boardList", list);
		
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
		//post??? ????????? postingvo ????????? ??????
		logger.info("???????????? postVo={}",postVo);
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		postVo.setEmpNo(empNo);
		int cnt = postingService.insertPosting(postVo);
		
		int postingNo = postVo.getPostingNo();
		logger.info("postingNo = {}", postingNo);
		logger.info("????????? ?????? ?????? ??????, cnt={}", cnt);
		//?????? ????????? ??????
		String pfFileName="", pfOFileName="";
		long pfFileSize=0;
		
		List<Map<String, Object>> list;
		try {
			list = boardFileUploadUtil.fileUpload(request, BoardConstUtil.UPLOAD_FILE_FLAG, "filepond");
			if(!list.isEmpty()&&list!=null) {
			logger.info(BoardConstUtil.UPLOAD_FILE_FLAG+"");
			logger.info(boardFileUploadUtil.getUploadPath(request, BoardConstUtil.UPLOAD_FILE_FLAG));
			logger.info("?????? list.size={}",list.size());
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
						logger.info("?????? ????????? ??????, pfVo={}",pfVo);
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
		//???????????? ??????
	}
	

	@PostMapping("/writeFeedPosting")
	public String writeFeedPosting_post(@ModelAttribute PostingVO postVo, HttpServletRequest request, Model model, HttpSession session) {
		logger.info("Feed ????????? posting ???????????? postVo={}", postVo);
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
			logger.info("?????? list.size={}",list.size());
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
						logger.info("?????? ????????? ??????, pfVo={}",pfVo);
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
		logger.info("?????? ????????? ??????, ???????????? postingNo={}", postingNo);
		
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		model.addAttribute("loginEmpNo", empNo);
		
		int deptNo = empVo.getDeptNo();
		DeptVO deptVo = deptService.selectDeptByDeptNo(deptNo);
		model.addAttribute("deptVo", deptVo);
		//????????? ???????????? ????????????
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("????????????, list={}", list.size());
		model.addAttribute("boardList", list);
		
		List<BoardVO> favList = boardService.selectFavBoards(empNo);
		model.addAttribute("favList", favList);

		//???????????? ??????
		List<PostingFilesVO> filesList = postingService.selectFilesOfPosting(postingNo);
		logger.info("?????? ??????, filesList.size={}", filesList.size());
		model.addAttribute("filesList", filesList);
		
		//????????? ????????? ???
		int likes = postingService.countLikes(postingNo);
		logger.info("????????? ????????? ??? postingNo={}, likes={}", postingNo, likes);
		model.addAttribute("likes", likes);
		
		//???????????? ???????????? ????????? ?????? ??????
		int hasLiked = postingService.hasLiked(postingNo, empNo);
		logger.info("????????? ??????, hasLiked={}", hasLiked);
		model.addAttribute("hasLiked", hasLiked);
		
		//????????? ??????
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
			List<PostingReplyViewVO> commentsList = commentsService.allCommentsByPostingNo(postingNo);
			for(PostingReplyViewVO pscv: commentsList) {
				logger.info("????????? ?????? postingcommentsviewvo={}", pscv);
				model.addAttribute("please", pscv.getReplyRegdate());
			}
			model.addAttribute("commentsList", commentsList);
		}else if(boardShowType.equals(BoardService.BOARD_FEED)) {
			url = "board/boardFeedDetail";
		}
		
		int totalCount = postingService.selectTotalCount(boardNo);
		model.addAttribute("totalCount", totalCount);
		
		int initTotalCount = commentsService.selectReplyCountByPostingNo(postingNo);
		model.addAttribute("initTotalCount", initTotalCount);
		
		return url;
	}
	
	@RequestMapping("/postingClassicPrev")
	public String postingClassicPrev(HttpSession session, @RequestParam int postingNo, @RequestParam int boardNo, Model model) {
		logger.info("?????? ??? ??????, postingNo={}, boardNo={}", postingNo, boardNo);
		
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		model.addAttribute("loginEmpNo", empNo);
		
		int deptNo = empVo.getDeptNo();
		DeptVO deptVo = deptService.selectDeptByDeptNo(deptNo);
		model.addAttribute("deptVo", deptVo);
		//????????? ???????????? ????????????
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("????????????, list={}", list.size());
		model.addAttribute("boardList", list);
		
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
		
		//???????????? ??????
		List<PostingFilesVO> filesList = postingService.selectFilesOfPosting(newPostingNo);
		logger.info("?????? ??????, filesList.size={}", filesList.size());
		model.addAttribute("filesList", filesList);
		
		int likes = postingService.countLikes(newPostingNo);
		logger.info("????????? ????????? ??? postingNo={}, likes={}", newPostingNo, likes);
		model.addAttribute("likes", likes);
		
		int hasLiked = postingService.hasLiked(newPostingNo, empNo);
		logger.info("????????? ??????, hasLiked={}", hasLiked);
		model.addAttribute("hasLiked", hasLiked);
		
		logger.info("empNo={}, postingNo={}", empNo, postingNo);
		
		//????????? ??????
		int viewcountupdate = postingService.updateViewCount(newPostingNo);
		
		//?????? ??????
		List<PostingReplyViewVO> commentsList = commentsService.allCommentsByPostingNo(newPostingNo);
		for(PostingReplyViewVO pscv: commentsList) {
			logger.info("????????? ?????? postingcommentsviewvo={}", pscv);
		}
		model.addAttribute("commentsList", commentsList);
		
		return "board/boardClassicDetail";
	}
	
	@RequestMapping("/postingClassicNext")
	public String postingClassicNext(HttpSession session, @RequestParam int postingNo, @RequestParam int boardNo, Model model) {
		logger.info("?????? ??? ??????, postingNo={}, boardNo={}", postingNo, boardNo);
		
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		model.addAttribute("loginEmpNo", empNo);
		
		int deptNo = empVo.getDeptNo();
		DeptVO deptVo = deptService.selectDeptByDeptNo(deptNo);
		model.addAttribute("deptVo", deptVo);
		//????????? ???????????? ????????????
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("????????????, list={}", list.size());
		model.addAttribute("boardList", list);
		
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
		
		//???????????? ??????
		List<PostingFilesVO> filesList = postingService.selectFilesOfPosting(newPostingNo);
		logger.info("?????? ??????, filesList.size={}", filesList.size());
		model.addAttribute("filesList", filesList);
		
		int likes = postingService.countLikes(newPostingNo);
		logger.info("????????? ????????? ??? postingNo={}, likes={}", newPostingNo, likes);
		model.addAttribute("likes", likes);
		
		int hasLiked = postingService.hasLiked(newPostingNo, empNo);
		logger.info("????????? ??????, hasLiked={}", hasLiked);
		model.addAttribute("hasLiked", hasLiked);
		
		logger.info("empNo={}, postingNo={}", empNo, postingNo);
		
		//????????? ??????
		int viewcountupdate = postingService.updateViewCount(postingNo);
		
		//?????? ??????
		List<PostingReplyViewVO> commentsList = commentsService.allCommentsByPostingNo(newPostingNo);
		for(PostingReplyViewVO pscv: commentsList) {
			logger.info("????????? ?????? postingcommentsviewvo={}", pscv);
		}
		model.addAttribute("commentsList", commentsList);
		
		return "board/boardClassicDetail";
	}
	
	@RequestMapping("/deletePosting")
	public String deletePosting(@RequestParam int postingNo, @RequestParam int boardNo, HttpServletRequest request) {
		//????????? ????????? ?????? ??????
		List<PostingFilesVO> list = postingService.selectFilesOfPosting(postingNo);
		for(PostingFilesVO vo : list) {
			String fileName = vo.getPfFileName();
			if(fileName!=null&&!fileName.isEmpty()) {
				String upPath = boardFileUploadUtil.getUploadPath(request, BoardConstUtil.UPLOAD_FILE_FLAG);
				File file = new File(upPath, fileName);
				if(file.exists()) {
					boolean bool = file.delete();
					logger.info("?????? ?????? ??????:{}", bool);
				}
			}
		}
		//posting ????????? ?????? ??????
		
		
		//?????? ????????? db ??????
		int cnt = postingService.deleteFileList(postingNo);
		
		//posting ??????
		int cnt2 = postingService.deletePosting(postingNo);
		
		return "redirect:/board/selectedBoard?boardNo="+boardNo;
	}
	
	/* public int insertFavBoards(int boardNo, int empNo);
	public List<Integer> selectFavBoards(int empNo);
	public int deleteFavBoards(int boardNo, int empNo); */
	
	@ResponseBody
	@RequestMapping("/insertFavBoards")
	public BoardVO insertFavBoards(@RequestParam int boardNo, @RequestParam int empNo) {
		logger.info("???????????? ????????? ?????? ????????????, boardNo={}, empNo={}", boardNo, empNo);
		
		int cnt = boardService.insertFavBoards(boardNo, empNo);
		if(cnt>0) {
			logger.info("???????????? ?????? ??????");
		}else {
			logger.info("???????????? ?????? ??????");
		}
		BoardVO vo = boardService.selectByBoardNo(boardNo);
		
		return vo;
	}
	
	@ResponseBody
	@RequestMapping("/deleteFavBoards")
	public void deleteFavBoards(@RequestParam int boardNo, @RequestParam int empNo) {
		logger.info("???????????? ?????? ????????????, boardNo={}, empNo={}", boardNo, empNo);
		
		int cnt = boardService.deleteFavBoards(boardNo, empNo);
		if(cnt>0) {
			logger.info("???????????? ?????? ??????");
		}else {
			logger.info("???????????? ?????? ??????");
		}
	}
	
	
	@RequestMapping("/download") 
	public ModelAndView download(@ModelAttribute PostingFilesVO vo, HttpServletRequest request) { 
		logger.info("???????????? ??????, ???????????? vo={}", vo);

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
		logger.info("????????? ??????, ???????????? postingNo={}, empNo={}", postingNo, empNo);
		
		int cnt = postingService.addLike(postingNo, empNo);
		logger.info("????????? ?????? ??????, cnt={}", cnt);
		
		int likes = postingService.countLikes(postingNo);
		logger.info("????????? ????????? ??? postingNo={}, likes={}", postingNo, likes);
		
		return likes;
	}
	
	@ResponseBody
	@RequestMapping("/deleteLike")
	public int deleteLike(@RequestParam int postingNo, @RequestParam int empNo) {
		logger.info("????????? ?????? ??????, ???????????? postingNo={}, empNo={}", postingNo, empNo);
		
		int cnt = postingService.deleteLike(postingNo, empNo);
		logger.info("????????? ?????? ?????? ??????, cnt={}", cnt);
		
		int likes = postingService.countLikes(postingNo);
		logger.info("????????? ????????? ??? postingNo={}, likes={}", postingNo, likes);
		
		return likes;
	}
	
	
	@ResponseBody
	@PostMapping("/addComments") 
	public PostingReplyViewVO addComments(@ModelAttribute PostingReplyVO replyVo) { 
		//db??? replyvo ??? ??????
		int cnt =commentsService.addComments(replyVo); 
		int postingNo = replyVo.getPostingNo();
		//?????? replyvo?????? replyNo??? reply"View"Vo??? ?????????
		int replyNo = replyVo.getReplyNo();
		logger.info("replyno={}", replyNo);
		PostingReplyViewVO outReplyVo = commentsService.selectReplyByNo(replyNo);
		logger.info("outreplyvo={}", outReplyVo);
		int tempTotalCount = commentsService.selectReplyCountByPostingNo(postingNo);
		outReplyVo.setInitTotalCount(tempTotalCount);
		Date regdate = outReplyVo.getReplyRegdate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd (E) HH:mm");
		String brandnewdate = sdf.format(regdate);
		outReplyVo.setBrandnewdate(brandnewdate);
		return outReplyVo; 
	}
	 
}