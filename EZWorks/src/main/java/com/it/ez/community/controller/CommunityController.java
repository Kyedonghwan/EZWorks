package com.it.ez.community.controller;

import java.io.IOException;
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

import com.it.ez.community.common.CommunityConstUtil;
import com.it.ez.community.common.CommunityFileUploadUtil;
import com.it.ez.community.common.CommunitySearchVO;
import com.it.ez.community.common.CommunutyPaginationInfo;
import com.it.ez.community.model.CommunityMemberVO;
import com.it.ez.community.model.CommunityService;
import com.it.ez.community.model.CommunityVO;
import com.it.ez.communityBoard.model.C_boardClassicVO;
import com.it.ez.communityBoard.model.C_boardFeedVO;
import com.it.ez.communityBoard.model.C_boardReplyVO;
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
	private final CommunityFileUploadUtil fileUploadUtil;
	
	
	@RequestMapping("/communityMain")
	public String MainCommunity(@ModelAttribute CommunitySearchVO searchVo,
			Model model, HttpSession session){
		logger.info("커뮤니티 메인 페이지");
		logger.info("searchVo.recordCountPage={}",searchVo.getRecordCountPerPage());
		
		//아이디 세션 저장
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
		logger.info("세션 저장 아이디, empVo={}", empVo);
		
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
		
		int totalRecord=communityService.selectTotalRecord(searchVo);
		logger.info("totalRecord="+totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//전체 커뮤니티 보여주기		
		List<CommunityMemberVO> comList = communityService.selectCommunity();
		List<CommunityMemberVO> list = communityService.selectAllCommunity(searchVo);
		
		for(int i=0; i<comList.size(); i++) {
			CommunityMemberVO vo = comList.get(i);
			int communityNo=vo.getCommunityNo();
			String communityMaster=communityService.selectCommunityMaster(communityNo);
			//logger.info("communityNo={}, writingCount={}, communityMaster={}", communityNo, writingCount, communityMaster);

			//vo에 마스터 저장
			vo.setCommunityMaster(communityMaster);
		}
		
		List<CommunityMemberVO> memNo=communityService.findMemberNo(empNo);
		model.addAttribute("memNo", memNo);
		
		for(int i=0; i<list.size(); i++) {
			CommunityMemberVO vo1 = list.get(i);
			int communityNo=vo1.getCommunityNo();
			int writingCount=c_boardService.selectC_boardCount(communityNo);
			
			String communityMaster=communityService.selectCommunityMaster(communityNo);
			//logger.info("communityNo={}, writingCount={}, communityMaster={}", communityNo, writingCount, communityMaster);

			//vo에 전체 글 수, 마스터 저장
			vo1.setWritingCount(writingCount);
			vo1.setCommunityMaster(communityMaster);
		}
		logger.info("전체 커뮤니티 리스트, comList.size={}. list.size={}", comList.size(), list.size());
		
		//가입한 커뮤니티 확인
		List<CommunityMemberVO> communityList=communityService.selectCommunityByMember(empNo);		
		for(CommunityMemberVO vo2: communityList) {
			int communityNo=vo2.getCommunityNo();
			int writingCount=c_boardService.selectC_boardCount(communityNo);
			String communityMaster=communityService.selectCommunityMaster(communityNo);
			//logger.info("communityNo={}, writingCount={}, communityMaster={}", communityNo, writingCount, communityMaster);
			
			//vo에 전체 글 수, 마스터 저장
			vo2.setWritingCount(writingCount);
			vo2.setCommunityMaster(communityMaster);
			
		}
		logger.info("가입한 커뮤니티 리스트 사이즈, communityList.size={}", communityList.size());
		
		// 피드 글 목록 보여주기
		List<C_boardFeedVO> feedList= c_boardService.selectC_boardFeedAll();
		for(C_boardFeedVO vo3 : feedList) {
			String before = vo3.getText();
			String after = before.replace("<([^>]+)>", "");				
			vo3.setText(after);
			
		}
		logger.info("Feed 게시판 리스트, feedList.size={}", feedList.size());
		
		// 클래식 글 목록 보여주기
		List<C_boardClassicVO>classicList=c_boardService.selectC_boardClassicAll();
		for(C_boardClassicVO vo4 : classicList) {
			String before = vo4.getText();
			String after = before.replace("<([^>]+)>", "");				
			vo4.setText(after);
			
		}
		logger.info("Classic 게시판 리스트, classicList.size={}", classicList.size());
		
		model.addAttribute("empVo", empVo);
		model.addAttribute("list", list);
		model.addAttribute("comList", comList);
		model.addAttribute("communityList", communityList);
		model.addAttribute("classicList", classicList);
		model.addAttribute("feedList", feedList);	
		
		return "community/communityMain";
	}
	
	@RequestMapping("/communityEnroll")
	public String EnrollCommunity(HttpSession session, 
			@RequestParam(defaultValue = "0") int communityNo, Model model) {
		logger.info("가입 처리 페이지, 파라미터 communityNo={}", communityNo);
		
		EmpVO empVo=(EmpVO)session.getAttribute("empVo");
		logger.info("empVo={}", empVo);
		int memberNo=empVo.getEmpNo();
		logger.info("가입 처리 아이디, memberNo={}", memberNo);
		
		CommunityMemberVO memVo=new CommunityMemberVO();
		memVo.setCommunityNo(communityNo);
		memVo.setMemberNo(memberNo);
		int cnt = communityService.insertCommunityMember(memVo);
		logger.info("가입 처리 결과, memVo={}, cnt={}",memVo, cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="가입 처리되었습니다.";
			url="/community/communityMain";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@GetMapping("/communityNew")
	public String newCommunity(HttpSession session, Model model) {
		logger.info("커뮤니티 개설 페이지");
		
		//아이디 세션 저장
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		logger.info("세션 저장 아이디, empVo={}", empVo);
		int empNo=empVo.getEmpNo();
		
		List<CommunityMemberVO> list=communityService.selectCommunity();
		logger.info("커뮤니티 개설 처리결과, list.size={}", list.size());
		//가입한 커뮤니티 확인
		List<CommunityMemberVO> communityList=communityService.selectCommunityByMember(empNo);
		model.addAttribute("communityList", communityList);
		model.addAttribute("list", list);
		
		return "community/communityNew";
		
	}
	
	@PostMapping("/communityNew")
	public String newCommunity_post(HttpSession session,
			@ModelAttribute CommunityVO vo, Model model) {
		logger.info("커뮤니티 개설 처리, 파라미터 communityVo={}", vo);
		
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		logger.info("세션 저장 아이디, empVo={}", empVo);
		int empNo=empVo.getEmpNo();
		
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
			HttpSession session, Model model) {
		logger.info("커뮤니티 정보 보기, 파라미터 communityNo={}", communityNo);
		
		//아이디 세션 저장
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		logger.info("세션 저장 아이디, empVo={}", empVo);
		int empNo=empVo.getEmpNo();
		
		List<CommunityMemberVO> list = communityService.selectCommunity();
		
		//가입한 커뮤니티 확인
		List<CommunityMemberVO> communityList=communityService.selectCommunityByMember(empNo);
		model.addAttribute("communityList", communityList);
		
		List<CommunityMemberVO> memList=communityService.selectMember(communityNo);
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		List<C_boardVO> boardList= c_boardService.selectC_boardList(communityNo);
		logger.info("커뮤니티 게시판 목록 결과, list.size={}, Boardlist.size={}", 
				list.size(), boardList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("memList", memList);
		model.addAttribute("boardList", boardList);

		return "community/communityDetail";
	}
	
	@GetMapping("/communityOneMain")
	public String oneCommunity(HttpSession session, 
			@RequestParam(defaultValue = "0") int communityNo,Model model) {
		logger.info("개별 커뮤니티 페이지, 파라미터 communityNo={}", communityNo);
		
		//아이디 세션 저장
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		logger.info("세션 저장 아이디, empVo={}", empVo);
		int empNo=empVo.getEmpNo();
		
		//사이드 바 보기
		//가입한 커뮤니티 확인
		List<CommunityMemberVO> communityList=communityService.selectCommunityByMember(empNo);
		model.addAttribute("communityList", communityList);
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		List<C_boardVO> boardList= c_boardService.selectC_boardList(communityNo);
		List<CommunityMemberVO> memList=communityService.selectMember(communityNo);
		
		//커뮤니티 클 목록 보여주기
		List<C_boardClassicVO>classicList=c_boardService.selectC_boardClassicMain(communityNo);
		logger.info("classicList={}", classicList);
		
		List<C_boardFeedVO>feedList=c_boardService.selectC_boardFeedMain(communityNo);
		logger.info("개별 커뮤니티 처리결과, vo={}, communityList.size={}, boardList.size={}, classicList.size={}", 
				vo, communityList.size(), boardList.size(), classicList.size(), feedList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("memList", memList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("classicList", classicList);
		model.addAttribute("feedList", feedList);
		
		return "community/communityOneMain";
		
	}
	
	@RequestMapping("/communityBoard")
	public String oneCommunity(HttpSession session, @ModelAttribute C_boardVO vo) {
		logger.info("게시판 유형 분리, 파라미터 vo={}", vo);
		
		//아이디 세션 저장
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		logger.info("세션 저장 아이디, empVo={}", empVo);
		int empNo=empVo.getEmpNo();
		
		String url="";
		if(vo.getBoardType()==CommunityConstUtil.C_BOARDTYPE_CLASSIC) {
			url="redirect:/community/communityOneClassic?boardNo="+vo.getBoardNo()
				+"&communityNo="+vo.getCommunityNo();
		}else if(vo.getBoardType()==CommunityConstUtil.C_BOARDTYPE_FEED) {
			url="redirect:/community/communityOneFeed?boardNo="+vo.getBoardNo()
				+"&communityNo="+vo.getCommunityNo();
		}
		return url;
	}
	
	@RequestMapping("/communityOneClassic")
	public String classicCommunity(HttpSession session, 
			@ModelAttribute C_boardClassicVO classicVo,
			@ModelAttribute CommunitySearchVO searchVo, Model model) {
		logger.info("개별 커뮤니티 클래식, 파라미터 classicVo={},", classicVo);
		logger.info("searchVo.recordCountPage={}",searchVo.getRecordCountPerPage());
		
		//아이디 세션 저장
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		logger.info("세션 저장 아이디, empVo={}", empVo);
		int empNo=empVo.getEmpNo();
		String empName = empVo.getEmpName();
		logger.info("세션 저장 아이디, empNo={}, empName={}", empNo, empName);
		
		//페이징 처리
		//[1] PaginationInfo 객체 생성
		CommunutyPaginationInfo pagingInfo = new CommunutyPaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setBlockSize(CommunityConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(CommunityConstUtil.RECORD_COUNT);			
		
		//[2] SearchVo에 paging관련 변수값 셋팅
		searchVo.setBoardNo(classicVo.getBoardNo());
		searchVo.setContentNo(classicVo.getContentNo());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommunityConstUtil.RECORD_COUNT);
		logger.info("페이지번호 관련 셋팅 후 searchVo={}", searchVo);
		
		int totalRecord=c_boardService.selectTotalRecord(searchVo);
		logger.info("totalRecord="+totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
			
		//게시판 정보 처리하기
		C_boardVO cboardVo = c_boardService.selectC_boardByNo(classicVo.getBoardNo());
		
		//글 목록 처리
		List<C_boardClassicVO> classicList=c_boardService.searchC_boardClassic(searchVo);
		int writingCount=c_boardService.selectC_boardClassicCount(classicVo.getCommunityNo());
		cboardVo.setWritingCount(writingCount);
		logger.info("글 전체 조회 결과, classicList.size={}, cboardVo={}", classicList.size(), cboardVo);

		//사이드바 화면 보기
		CommunityVO vo= communityService.selectCommunityByNo(classicVo.getCommunityNo());
		List<C_boardVO> boardList= c_boardService.selectC_boardList(classicVo.getCommunityNo());
		List<CommunityMemberVO> memList=communityService.selectMember(classicVo.getCommunityNo());
		List<CommunityMemberVO> communityList=communityService.selectCommunityByMember(empNo);
		logger.info("개별 커뮤니티 처리결과, vo={}, list.size={}, boardList.size={}", 
				vo, communityList.size(), boardList.size());

		model.addAttribute("searchVo", searchVo);
		model.addAttribute("vo", vo);
		model.addAttribute("cboardVo", cboardVo);
		model.addAttribute("classicList", classicList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("memList", memList);
		model.addAttribute("communityList", communityList);

		return "community/communityOneClassic";
		
	}
	
	@RequestMapping("/countUpdate")
	public String countUpdate(HttpSession session, @ModelAttribute C_boardClassicVO classicVo, Model model) {
		logger.info("조회수 증가 페이지, 파라미터 classicVo={}", classicVo);
		//아이디 세션 저장
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		logger.info("세션 저장 아이디, empVo={}", empVo);
		
		int contentNo=classicVo.getContentNo();
		int communityNo=classicVo.getCommunityNo();
		int boardNo=classicVo.getBoardNo();
		
		if(contentNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/community/communityOneClassic?boardNo="+contentNo);

			return "common/message";
		}else {
			int cnt=c_boardService.updateClassicReadCount(contentNo);
			logger.info("조회수 증가 결과, cnt={}", cnt);			
		}
		
		return "redirect:/community/c_boardClassicDetail?boardNo="+boardNo+"&communityNo="+communityNo+"&contentNo="+contentNo;
		
	}
	
	@RequestMapping("/c_boardClassicDetail")
	public String classicDetailCommunity(HttpSession session, 
			@ModelAttribute C_boardClassicVO classicVo,
			@ModelAttribute CommunitySearchVO searchVo, Model model) {
		logger.info("클래식 글 디테일, 파라미터 classicVo={},", classicVo);
		logger.info("searchVo.recordCountPage={}",searchVo.getRecordCountPerPage());
		
		//아이디 세션 저장
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		logger.info("세션 저장 아이디, empVo={}", empVo);
		int empNo=empVo.getEmpNo();
		
		//페이징 처리
		//[1] PaginationInfo 객체 생성
		CommunutyPaginationInfo pagingInfo = new CommunutyPaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setBlockSize(CommunityConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(CommunityConstUtil.RECORD_COUNT);			
		
		//[2] SearchVo에 paging관련 변수값 셋팅
		searchVo.setBoardNo(classicVo.getBoardNo());
		searchVo.setContentNo(classicVo.getContentNo());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommunityConstUtil.RECORD_COUNT);
		logger.info("페이지번호 관련 셋팅 후 searchVo={}", searchVo);
		
		int totalRecord=c_boardService.selectTotalRecord(searchVo);
		logger.info("totalRecord="+totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//게시판 정보 처리하기
		C_boardVO cboardVo = c_boardService.selectC_boardByNo(classicVo.getBoardNo());
		
		//글 목록 처리
		List<C_boardClassicVO> classicList=c_boardService.searchC_boardClassic(searchVo);
		int writingCount=c_boardService.selectC_boardClassicCount(classicVo.getCommunityNo());
		cboardVo.setWritingCount(writingCount);
		logger.info("글 전체 조회 결과, classicList.size={}, cboardVo={}", classicList.size(), cboardVo);

		//사이드바 화면 보기
		CommunityVO vo= communityService.selectCommunityByNo(classicVo.getCommunityNo());
		List<C_boardVO> boardList= c_boardService.selectC_boardList(classicVo.getCommunityNo());
		List<CommunityMemberVO> memList=communityService.selectMember(classicVo.getCommunityNo());
		List<CommunityMemberVO> communityList=communityService.selectCommunityByMember(empNo);
		logger.info("개별 커뮤니티 처리결과, vo={}, list.size={}, boardList.size={}", 
				vo, communityList.size(), boardList.size());

		//글 디테일 보기
		classicVo = c_boardService.selectClassicDetail(classicVo.getContentNo());
		
		model.addAttribute("vo", vo);
		model.addAttribute("cboardVo", cboardVo);
		model.addAttribute("classicVo", classicVo);
		model.addAttribute("classicList", classicList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("memList", memList);
		model.addAttribute("communityList", communityList);

		return "community/board/c_boardClassicDetail";
		
	}
		
	@RequestMapping("/communityOneFeed")
	public String feedCommunity(HttpSession session,
			@ModelAttribute C_boardFeedVO feedVo, Model model) {
		logger.info("개별 커뮤니티 피드, 파라미터 FeedVo={}", feedVo);
		
		//아이디 세션 저장
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		logger.info("세션 저장 아이디, empVo={}", empVo);
		int empNo=empVo.getEmpNo();
		
		//사이드바 화면 보기
		CommunityVO vo= communityService.selectCommunityByNo(feedVo.getCommunityNo());
		//가입한 커뮤니티 확인
		List<CommunityMemberVO> communityList=communityService.selectCommunityByMember(empNo);
		List<CommunityMemberVO> memList=communityService.selectMember(feedVo.getCommunityNo());
		List<C_boardVO> boardList= c_boardService.selectC_boardList(feedVo.getCommunityNo());
		logger.info("개별 커뮤니티 처리결과, vo={}, list.size={}, boardList.size={}", 
				vo, communityList.size(), boardList.size());
		
		//2 글 전체보기 처리
		C_boardVO cboardVo = c_boardService.selectC_boardByNo(feedVo.getBoardNo());
		int writingCount=c_boardService.selectC_boardFeedCount(feedVo.getCommunityNo());
		cboardVo.setWritingCount(writingCount);
		
		List<C_boardReplyVO> replyList=c_boardService.selectC_boardReply(feedVo.getContentNo());
		List<C_boardFeedVO> feedList=c_boardService.selectFeed(feedVo);
		logger.info("글 전체 조회 결과, feedList.size={}, replyList.size={}, cboardVo={}", feedList.size(), replyList.size(), cboardVo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("empVo", empVo);
		model.addAttribute("cboardVo", cboardVo);

		model.addAttribute("communityList", communityList);
		model.addAttribute("feedList", feedList);
		model.addAttribute("replyList", replyList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("memList", memList);
		
		return "community/communityOneFeed";
	}
	
	@PostMapping("/communityOneFeed")
	public String feedCommunity_post(HttpSession session, 
			@ModelAttribute C_boardFeedVO feedVo, Model model) {
		logger.info("개별 커뮤니티 피드 작성, 파라미터 feedVo={}", feedVo);
	
		EmpVO empVo=(EmpVO)session.getAttribute("empVo");
		logger.info("empVo={}", empVo);
		
		feedVo.setEmpImg(empVo.getEmpImg());
		feedVo.setEmpName(empVo.getEmpName());
		feedVo.setPosNo(empVo.getPosNo());
		feedVo.setPosName(empVo.getPosName());
		
		int cnt=c_boardService.insertBoardFeed(feedVo);
		String msg="", url="";
		logger.info("피드 처리결과 cnt={}", cnt);
		
		if(cnt>0) {
			msg="커뮤니티 게시판 피드 글쓰기 성공";
			url="/community/communityOneFeed?communityNo="+feedVo.getCommunityNo()+"&boardNo="+feedVo.getBoardNo();
		}else {
			msg="커뮤니티 게시판 피드 글쓰기 실패!";
			url="/community/communityOneFeed?communityNo="+feedVo.getCommunityNo()+"&boardNo="+feedVo.getBoardNo();
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/feedDelete")
	public String deleteFeed(@RequestParam(defaultValue = "0") int contentNo,
			@RequestParam(defaultValue = "0") int communityNo, 
			@RequestParam(defaultValue = "0") int boardNo, 
			Model model) {
		logger.info("feed 글 삭제, 파라미터 contentNo={}", contentNo);
		
		int cnt = c_boardService.deleteC_boardFeed(contentNo);
		String msg="", url="";
		if(cnt>0) {
			msg="커뮤니티 게시판 삭제 성공";
			url="/community/communityOneFeed?communityNo="+communityNo+"&boardNo="+boardNo;
		}else {
			msg="커뮤니티 게시판 삭제 실패!";
			url="/community/communityOneFeed?communityNo="+communityNo+"&boardNo="+boardNo;
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@PostMapping("/communityOneReply")
	public String replyCommunity(HttpSession session,
			@ModelAttribute C_boardReplyVO replyVo, Model model) {
		logger.info("개별 커뮤니티 피드 작성, 파라미터 replyVo={}", replyVo);
		
		EmpVO empVo=(EmpVO)session.getAttribute("empVo");
		logger.info("empVo={}", empVo);
		
		replyVo.setEmpImg(empVo.getEmpImg());
		replyVo.setEmpName(empVo.getEmpName());
		replyVo.setPosNo(empVo.getPosNo());
		replyVo.setPosName(empVo.getPosName());
		
		int commmunityNo=replyVo.getCommunityNo();
		int boardNo=replyVo.getBoardNo();
		
		int cnt=c_boardService.insertReply(replyVo);
		String msg="", url="";
		logger.info("피드 처리결과 cnt={}", cnt);
		
		if(cnt>0) {
			msg="커뮤니티 게시판 피드 글쓰기 성공";
			url="/community/communityOneFeed?communityNo="+commmunityNo+"&boardNo="+boardNo;
		}else {
			msg="커뮤니티 게시판 피드 글쓰기 실패!";
			url="/community/communityOneFeed?communityNo="+commmunityNo+"&boardNo="+boardNo;
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@GetMapping("/replyDelete")
	public String replyDelete(@RequestParam(defaultValue = "0")int replyNo,
			@RequestParam(defaultValue = "0") int communityNo, 
			@RequestParam(defaultValue = "0") int boardNo, 
			Model model) {
		logger.info("피드 게시판 댓글 삭제요청, 파라미터 replyNo={}", replyNo);
		
		int cnt = c_boardService.deleteReply(replyNo);
		String msg="", url="";
		logger.info("피드 처리결과 cnt={}", cnt);
		
		if(cnt>0) {
			msg="커뮤니티 게시판 피드 글쓰기 성공";
			url="/community/communityOneFeed?communityNo="+communityNo+"&boardNo="+boardNo;
		}else {
			msg="커뮤니티 게시판 피드 글쓰기 실패!";
			url="/community/communityOneFeed?communityNo="+communityNo+"&boardNo="+boardNo;
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@GetMapping("/c_boardWrite")
	public String writeBoard(@RequestParam(defaultValue = "0") int communityNo, 
			HttpSession session, Model model) {
		logger.info("커뮤니티 게시판 글쓰기 페이지, 파라미터 communityNo={}", communityNo);
		
		//아이디 세션 확인
		EmpVO empVo=(EmpVO)session.getAttribute("empVo");
		logger.info("empVo={}", empVo);
		int empNo=empVo.getEmpNo();
		
		//화면 보여주기 데이터
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		//가입한 커뮤니티 확인
		List<CommunityMemberVO> communityList=communityService.selectCommunityByMember(empNo);
		model.addAttribute("communityList", communityList);
		List<CommunityMemberVO> memList=communityService.selectMember(communityNo);
		List<C_boardVO> boardList= c_boardService.selectC_boardList(communityNo);
		
		logger.info("커뮤니티 게시판 목록 결과, vo={}, list.size={}, boardList.size={}, memList.size={}", 
				vo, communityList.size(), boardList.size(), memList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("memList", memList);
		model.addAttribute("boardList", boardList);
		
		return "community/board/c_boardWrite";
	}
	
	@PostMapping("/c_boardWrite")
	public String writeBoard_post(@ModelAttribute C_boardClassicVO classicVo,
			HttpServletRequest request, HttpSession session, Model model) {
		logger.info("커뮤니티 게시판 글쓰기 처리, 파라미터 classicVo={}",classicVo);
		
		//아이디 세션 가져오기
		EmpVO empVo=(EmpVO)session.getAttribute("empVo");
		logger.info("empVo={}", empVo);
		
		//글쓴이 정보 vo에 저장
		classicVo.setEmpName(empVo.getEmpName());
		classicVo.setEmpNo(empVo.getEmpNo());
		classicVo.setEmpImg(empVo.getEmpImg());
		classicVo.setPosNo(empVo.getPosNo());
		classicVo.setPosName(empVo.getPosName());
				
		//파일 업로드 처리
		String fileName="", originFileName="";
		long fileSize=0;
		try {
			List<Map<String, Object>> list
				= fileUploadUtil.fileUpload(request,CommunityConstUtil.UPLOAD_FILE_FLAG);
				for(int i=0; i<list.size(); i++) {
					Map<String, Object> map=list.get(i);
					fileName=(String)map.get("fileName");
					originFileName=(String)map.get("originalFileName");
					fileSize=(Long)map.get("fileSize");
				}
					logger.info("파일 업로드 성공, fileName={}, fileSize={}", fileName, fileSize);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		classicVo.setFileName(fileName);
		classicVo.setFileSize(fileSize);
		classicVo.setOriginalFileName(originFileName);
				
				
		String msg="", url="";
		int cnt = c_boardService.insertBoardClassic(classicVo);
		logger.info("커뮤니티 게시판 처리결과 cnt={}", cnt);
		
		if(cnt>0) {
			msg="커뮤니티 게시판 글쓰기 성공";
			url="/community/communityOneMain?communityNo="+classicVo.getCommunityNo();
		}else {
			msg="커뮤니티 게시판 글쓰기 실패!";
			url="/community/board/c_boardWrite";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@GetMapping("/c_boardNew")
	public String newBoard(@RequestParam(defaultValue = "0") int communityNo, 
			HttpSession session, Model model) {
		logger.info("커뮤니티 게시판 개설 페이지 보기");
		
		//아이디 세션 확인
		EmpVO empVo=(EmpVO)session.getAttribute("empVo");
		logger.info("empVo={}", empVo);
		int empNo=empVo.getEmpNo();

		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		//가입한 커뮤니티 확인
		List<CommunityMemberVO> communityList=communityService.selectCommunityByMember(empNo);
		model.addAttribute("communityList", communityList);
		
		List<C_boardVO> boardList= c_boardService.selectC_boardList(communityNo);
		List<CommunityMemberVO> memList=communityService.selectMember(communityNo);
		logger.info("커뮤니티 게시판 개설 화면 결과, vo={}, list.size={}, boardList.size={}, memList.size={}", 
				vo, communityList.size(), boardList.size(), memList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("memList", memList);
		model.addAttribute("boardList", boardList);
		
		return "community/board/c_boardNew";
		
	}
	
	@PostMapping("/c_boardNew")
	public String newBoard_post(@ModelAttribute C_boardVO vo, HttpSession session,
			@RequestParam(defaultValue = "0") int c_boardType, Model model) {
		logger.info("커뮤니티 게시판 개설 처리, 파라미터 c_boardVo={}, c_boardType={}", vo, c_boardType);
		
		//아이디 세션 가져오기
		EmpVO empVo=(EmpVO)session.getAttribute("empVo");
		logger.info("empVo={}", empVo);
		
		int cnt = c_boardService.insertC_board(vo);
		logger.info("커뮤니티 게시판 개설 결과, cnt={}", cnt);
		
		String msg="커뮤니티 게시판 개설 실패!", url="/community/board/c_boardNew";
		if(cnt>0) {
			if(c_boardType==CommunityConstUtil.C_BOARDTYPE_CLASSIC) {
				msg="커뮤니티 게시판이 유형 클래식으로 개설되었습니다.";
				url="/community/communityOneClassic?communityNo="+vo.getCommunityNo();				
			}else if(c_boardType==CommunityConstUtil.C_BOARDTYPE_FEED) {
				msg="커뮤니티 게시판이 유형 피드로 개설되었습니다.";
				url="/community/communityOneFeed?communityNo="+vo.getCommunityNo();
			}	
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
}
