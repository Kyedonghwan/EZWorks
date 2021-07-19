package com.it.ez.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.ez.board.model.BoardService;
import com.it.ez.board.model.BoardVO;
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
	
	@RequestMapping("/boardMain")
	public String showboard(Model model) {
		logger.info("게시판 메인 화면");
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("파라미터, list={}", list.size());
		model.addAttribute("boardList", list);
		
		return "board/boardMain";
	}
	
	@RequestMapping("/selectedBoard")
	public String showSelectedBoard(@RequestParam int boardNo, Model model) {
		logger.info("선택한 게시판으로 이동, 파라미터 boardNo={}", boardNo);
		
		BoardVO vo = boardService.selectByBoardNo(boardNo);
		logger.info("선택한 게시판 vo={}", vo);
		
		List<BoardVO> boardList = boardService.selectAllBoard();
		logger.info("파라미터, list={}", boardList.size());
		
		List<PostingVO> postingList = postingService.selectByBoard(boardNo);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardVo", vo);
		model.addAttribute("postingList", postingList);
		
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
	public String writePosting(Model model) {
		logger.info("게시판 메인 화면");
		List<BoardVO> list = boardService.selectAllBoard();
		logger.info("파라미터, list={}", list.size());
		model.addAttribute("boardList", list);
		
		return "board/writePosting";
	}
}
