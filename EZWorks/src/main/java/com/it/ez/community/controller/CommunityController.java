package com.it.ez.community.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.it.ez.community.common.CommunityConstUtil;
import com.it.ez.community.common.CommunityFileUploadUtil;
import com.it.ez.community.common.CommunitySearchVO;
import com.it.ez.community.common.CommunutyPaginationInfo;
import com.it.ez.community.model.CommunityService;
import com.it.ez.community.model.CommunityVO;
import com.it.ez.communityBoard.model.C_boardClassicVO;
import com.it.ez.communityBoard.model.C_boardService;
import com.it.ez.communityBoard.model.C_boardVO;
import com.it.ez.emp.model.EmpService;
import com.it.ez.emp.model.EmpVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {
	private static final Logger logger 
		= LoggerFactory.getLogger(CommunityController.class);
	
	private final CommunityService communityService;
	private final C_boardService c_boardService;
	private final EmpService empService;
	private final CommunityFileUploadUtil fileUploadUtil;
	
	@GetMapping("/communityMain")
	public String communityMain(Model model, HttpSession session){
		logger.info("커뮤니티 메인 페이지");
		
		//아이디 세션 저장
		EmpVO empVo = empService.selectEmpByEmpNo(1);
		session.setAttribute("empVo", empVo);
		
		//화면 보여주기 
		List<CommunityVO> list=communityService.selectCommunity();
		List<C_boardClassicVO> viewList= c_boardService.selectAllC_boardView();
		logger.info("개별 커뮤니티 처리결과, list.size={}, viewList.size={}",
				list.size(), viewList.size());
		
		model.addAttribute("viewList", viewList);
		model.addAttribute("list", list);
		
		return "community/communityMain";
	}
	
	@GetMapping("/communityNew")
	public String newCommunity(Model model) {
		logger.info("커뮤니티 개설 페이지");
		
		List<CommunityVO> list=communityService.selectCommunity();
		logger.info("커뮤니티 개설 처리결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "community/communityNew";
		
	}
	
	@PostMapping("/communityNew")
	public String newCommunity_post(@ModelAttribute CommunityVO vo, Model model) {
		logger.info("커뮤니티 개설 처리, 파라미터 communityVo={}", vo);
		
		int cnt = communityService.insertCommunity(vo);
		logger.info("커뮤니티 개설 처리결과, cnt={}", cnt);
		
		String msg="커뮤니티 개설 실패!", url="/community/communityNew";
		if(cnt>0) {
			msg="커뮤니티가 개설되었습니다.";
			url="/community/communityMain";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}

	@GetMapping("/communityDetail")
	public String detailCommunity(@RequestParam(defaultValue = "0") int communityNo, 
			Model model) {
		logger.info("커뮤니티 정보 보기, 파라미터 communityNo={}", communityNo);
		
		List<CommunityVO> list = communityService.selectCommunity();
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		List<C_boardVO> boardList= c_boardService.selectC_board(communityNo);
		logger.info("커뮤니티 게시판 목)록 결과, list.size={}, Boardlist.size={}", 
				list.size(), boardList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("boardList", boardList);

		return "community/communityDetail";
	}
	
	
	@GetMapping("/communityOne")
	public String oneCommunity(@RequestParam(defaultValue = "0")int communityNo, 
			@RequestParam(defaultValue = "0") int boardNo, 
			@ModelAttribute CommunitySearchVO searchVo,
			Model model) {
		logger.info("개별 커뮤니티 페이지, 파라미터 communityNo={}, boardNo={}, searchVo={}", 
				communityNo, boardNo, searchVo);
		//페이징 처리
		//[1] PaginationInfo 객체 생성
		CommunutyPaginationInfo pagingInfo = new CommunutyPaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setBlockSize(CommunityConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(CommunityConstUtil.RECORD_COUNT);
		
		//[2] SearchVo에 paging관련 변수값 셋팅
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommunityConstUtil.RECORD_COUNT);
		logger.info("페이지번호 관련 셋팅 후 searchVo={}", searchVo);
		
		//2
		List<C_boardClassicVO> contentlist=c_boardService.selectAllC_boardView(searchVo);
		logger.info("글 전체 조회 결과, contentlist.size={}", list.size());
		
		int totalRecord=reBoardService.selectTotalRecord(searchVo);
		logger.info("totalRecord="+totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		
		//화면 보기
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		List<CommunityVO> list = communityService.selectCommunity();
		List<C_boardVO> boardList= c_boardService.selectC_board(communityNo);
		List<C_boardClassicVO> viewList= c_boardService.selectC_boardView(communityNo);
		
		logger.info("개별 커뮤니티 처리결과, vo={}, list.size={}, boardList.size={}, viewList.size={}", 
				vo, list.size(), boardList.size(), viewList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("boardList", boardList);
		model.addAttribute("viewList", viewList);
		
		return "community/communityOne";
		
	}
	
	@GetMapping("/c_boardWrite")
	public String writeCommunity(@RequestParam(defaultValue = "0") int communityNo, 
			HttpSession session, Model model) {
		logger.info("커뮤니티 게시판 글쓰기 페이지, 파라미터 communityNo={}", communityNo);
		//아이디 세션 저장
		EmpVO empVo = empService.selectEmpByEmpNo(1);
		session.setAttribute("empVo", empVo);
		String empName=empVo.getEmpName();
		
		//화면 보여주기 데이터
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		List<CommunityVO> list = communityService.selectCommunity();
		List<C_boardVO> boardList= c_boardService.selectC_board(communityNo);
		logger.info("커뮤니티 게시판 목록 결과, vo={}, list.size={}, boardList.size={}", 
				vo, list.size(), boardList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("boardList", boardList);
		
		return "community/board/c_boardWrite";
	}
	
	@PostMapping("/c_boardWrite")
	public String writeCommunity_post(@ModelAttribute C_boardClassicVO contentVo,
			@RequestParam(defaultValue = "0") int boardNo,  
			@RequestParam(defaultValue = "0") int communityNo,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session, Model model) {
		logger.info("커뮤니티 게시판 글쓰기 처리, 파라미터 contentVo={}, boardNo={}, communityNo={}"
				, contentVo, boardNo, communityNo);
		
		//아이디 세션 저장
		EmpVO empVo = (EmpVO)session.getAttribute("empVo");
		String empName=empVo.getEmpName();
		
		contentVo.setName(empName);
		contentVo.setBoardNo(boardNo);
		
		//파일 업로드 처리
		String fileName="", originFileName="";
		long fileSize=0;
		
		try {
			List<Map<String, Object>> list
				= fileUploadUtil.fileUpload(request,CommunityConstUtil.UPLOAD_FILE_FLAG);
			if(list!=null && !list.isEmpty()) {
				logger.info(CommunityConstUtil.UPLOAD_FILE_FLAG+"");
				logger.info(fileUploadUtil.getUploadPath(request,CommunityConstUtil.UPLOAD_FILE_FLAG));
				logger.info("list.size={}", list.size());
				
				for(int i=0; i<list.size(); i++) {
					Map<String, Object> map=list.get(i);
					fileName=(String)map.get("fileName");
					originFileName=(String)map.get("originalFileName");
					fileSize=(Long)map.get("fileSize");
					
				}
					logger.info("파일 업로드 성공, fileName={}, fileSize={}", fileName, fileSize);
					
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		contentVo.setFileName(fileName);
		contentVo.setFileSize(fileSize);
		contentVo.setOriginalFileName(originFileName);
				
				
		String msg="", url="";
		int cnt = c_boardService.insertBoardContent(contentVo);
		logger.info("커뮤니티 게시판 처리결과 cnt={}", cnt);
		if(cnt>0) {
			msg="커뮤니티 게시판 글쓰기 성공";
			url="/community/communityOne?communityNo="+communityNo;
		}else {
			msg="커뮤니티 게시판 글쓰기 실패!";
			url="/community/board/c_boardWrite";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@GetMapping("/c_boardNew")
	public String newBoard(@RequestParam(defaultValue = "0") int communityNo, Model model) {
		logger.info("커뮤니티 게시판 개설 페이지 보기");
		
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		List<CommunityVO> list = communityService.selectCommunity();
		List<C_boardVO> boardList= c_boardService.selectC_board(communityNo);
		logger.info("커뮤니티 게시판 개설 화면 결과, vo={}, list.size={}, boardList.size={}", 
				vo, list.size(), boardList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("boardList", boardList);
		
		return "community/board/c_boardNew";
		
	}
	
	@PostMapping("/c_boardNew")
	public String newBoard_post(@ModelAttribute C_boardVO vo, 
			@RequestParam(defaultValue = "0") int communityNo, Model model) {
		logger.info("커뮤니티 게시판 개설 처리, 파라미터 c_boardVo={}, communityNo={}", vo, communityNo);
		
		int cnt = c_boardService.insertC_board(vo);
		logger.info("커뮤니티 게시판 개설 처리결과, cnt={}", cnt);
		
		String msg="커뮤니티 게시판 개설 실패!", url="/community/board/c_boardNew";
		if(cnt>0) {
			msg="커뮤니티 게시판이 개설되었습니다.";
			url="/community/communityOne?communityNo="+communityNo;
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
}
