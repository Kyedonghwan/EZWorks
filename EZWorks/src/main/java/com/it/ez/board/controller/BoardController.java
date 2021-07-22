package com.it.ez.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.board.common.BoardConstUtil;
import com.it.ez.board.common.BoardFileUploadUtil;
import com.it.ez.board.model.BoardService;
import com.it.ez.board.model.BoardVO;
import com.it.ez.emp.model.EmpService;
import com.it.ez.emp.model.EmpVO;
import com.it.ez.posting.model.BoardMainPostingVO;
import com.it.ez.posting.model.EmpPostingViewVO;
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
		
		//게시판 사이드바 정보처리
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("파라미터, list={}", list.size());
		model.addAttribute("boardList", list);
		
		//temporary
		EmpVO empVo= empService.selectEmpByEname("KIMDEMO");
		session.setAttribute("empVo", empVo);
		
		//전체 게시글 조회
		List<BoardMainPostingVO> postList = postingService.selectAllPosting();
		model.addAttribute("allPostingList", postList);
		
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
	public String showSelectedBoard(@RequestParam int boardNo, Model model) {
		logger.info("선택한 게시판으로 이동, 파라미터 boardNo={}", boardNo);
		
		BoardVO vo = boardService.selectByBoardNo(boardNo);
		logger.info("선택한 게시판 vo={}", vo);
		
		List<BoardVO> boardList = boardService.selectAllBoard();
		logger.info("파라미터, list={}", boardList.size());
		
		List<EmpPostingViewVO> postingList = postingService.selectByBoard(boardNo);
		List<String> adminList = boardService.selectBoardAdmin(boardNo);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardVo", vo);
		model.addAttribute("postingList", postingList);
		model.addAttribute("adminList", adminList);
		
		String boardShowType = vo.getBoardShowType();
		String url="";
		if(boardShowType.equals(BoardService.BOARD_CLASSIC)) {
			url = "board/boardClassic";
		}else if(boardShowType.equals(BoardService.BOARD_FEED)) {
			url = "board/boardFeed";
		}
		
		return url;
	}
	
	@RequestMapping("/writePosting")
	public String writePosting(Model model, @RequestParam(required = false) Integer boardNo) {
		logger.info("게시판 메인 화면");
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("파라미터, list={}", list.size());
		model.addAttribute("boardList", list);
		
		Integer boardNo_chk = boardNo;
		
		if(boardNo_chk!=null&&boardNo_chk!=0) {
			BoardVO boardVo = boardService.selectByBoardNo(boardNo);
			model.addAttribute("boardVo", boardVo);
		}
		
		return "board/writePosting";
	}
	
	@PostMapping("/writePosting")
	public String writePosting_post(@ModelAttribute PostingVO postVo, HttpServletRequest request, Model model) {
		//post로 넘어온 postingvo 변수들 처리
		logger.info("파라미터 postVo={}",postVo);
		int cnt = postingService.insertPosting(postVo);
		logger.info("게시글 입력 처리 결과, cnt={}", cnt);
		//파일 업로드 처리
		String pfFileName="", pfOFileName="";
		long pfFileSize=0;
		try {
			List<Map<String, Object>> list = boardFileUploadUtil.fileUpload(request, BoardConstUtil.UPLOAD_FILE_FLAG);
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
				pfVo.setPostingNo(i)
			}
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		PostingFilesVO pfVo = new PostingFilesVO();
		pfVo.set
		//목록으로 반환
	}
}
