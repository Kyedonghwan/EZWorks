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
		EmpVO empVo = empService.selectEmpByEmpNo(3);
		session.setAttribute("empVo", empVo);
		int empNo=empVo.getEmpNo();
		String empName = empVo.getEmpName();
		logger.info("세션 저장 아이디, empNo={}, empName={}", empNo, empName);
		
		//전체 커뮤니티 보여주기
		List<CommunityMemberVO> list = communityService.selectCommunity();
		logger.info("전체 커뮤니티 리스트, list.size={}", list.size());
		
		for(int i=0; i<list.size(); i++) {
			CommunityMemberVO vo = list.get(i);
			int communityNo=vo.getCommunityNo();
			int writingCount=c_boardService.selectC_boardCount(communityNo);
			String communityMaster=communityService.selectCommunityMaster(communityNo);
			logger.info("communityNo={}, writingCount={}, communityMaster={}", communityNo, writingCount, communityMaster);

			//vo에 전체 글 수, 마스터 저장
			vo.setWritingCount(writingCount);
			vo.setCommunityMaster(communityMaster);

		}
		logger.info("전체 커뮤니티 리스트, list={}", list);
		
		//가입한 커뮤니티 확인
		List<CommunityMemberVO> communityList=communityService.selectCommunityByMember(empNo);
		logger.info("가입한 커뮤니티 리스트 사이즈, communityList.size={}", communityList.size());
		
		for(CommunityMemberVO vo2: communityList) {
			int communityNo=vo2.getCommunityNo();
			int writingCount=c_boardService.selectC_boardCount(communityNo);
			String communityMaster=communityService.selectCommunityMaster(communityNo);
			logger.info("communityNo={}, writingCount={}, communityMaster={}", communityNo, writingCount, communityMaster);
			
			//vo에 전체 글 수, 마스터 저장
			vo2.setWritingCount(writingCount);
			vo2.setCommunityMaster(communityMaster);
			
		}
		logger.info("가입한 커뮤니티 리스트, communityList={}", communityList);
		
		// 피드 글 목록 보여주기
		List<C_boardFeedVO> feedList= c_boardService.selectC_boardFeedAll();
		for(C_boardFeedVO vo3 : feedList) {
			String before = vo3.getText();
			String after = before.replace("<([^>]+)>", "");
			vo3.setText(after);
		}
		logger.info("Feed 게시판 리스트, feedList.size={}", feedList.size());
		logger.info("Feed 게시판 리스트, feedList={}", feedList);
		
		// 클래식 글 목록 보여주기
		List<C_boardClassicVO>classicList=c_boardService.selectC_boardClassicAll();
		for(C_boardClassicVO vo4 : classicList) {
			String before = vo4.getText();
			String after = before.replace("<([^>]+)>", "");
			vo4.setText(after);
		}
		logger.info("Classic 게시판 리스트, classicList.size={}", classicList.size());
		
		//가입 여부 확인하기
		model.addAttribute("list", list);
		model.addAttribute("communityList", communityList);
		model.addAttribute("classicList", classicList);
		model.addAttribute("feedList", feedList);	
		
		return "community/communityMain";
	}
	@RequestMapping("/communityEnroll")
	public String Enroll(HttpSession session, 
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
	public String newCommunity(Model model) {
		logger.info("커뮤니티 개설 페이지");
		
		List<CommunityMemberVO> list=communityService.selectCommunity();
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
		
		List<CommunityMemberVO> list = communityService.selectCommunity();
		List<CommunityMemberVO> memList=communityService.selectMember(communityNo);
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		List<C_boardVO> boardList= c_boardService.selectC_boardByNo(communityNo);
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
		
		//사이드 바 보기
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		List<CommunityMemberVO> list = communityService.selectCommunity();
		List<C_boardVO> boardList= c_boardService.selectC_boardByNo(communityNo);
		List<CommunityMemberVO> memList=communityService.selectMember(communityNo);
		
		//커뮤니티 클 목록 보여주기
		List<C_boardClassicVO>classicList=c_boardService.selectC_boardClassicMain(communityNo);
		logger.info("classicList={}", classicList);
		
		List<C_boardFeedVO>feedList=c_boardService.selectC_boardFeedMain(communityNo);
		logger.info("개별 커뮤니티 처리결과, vo={}, list.size={}, boardList.size={}, classicList.size={}", 
				vo, list.size(), boardList.size(), classicList.size(), feedList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("memList", memList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("classicList", classicList);
		model.addAttribute("feedList", feedList);
		
		return "community/communityOneMain";
		
	}
	
	@RequestMapping("/communityBoard")
	public String oneCommunity(HttpSession session, @ModelAttribute C_boardVO vo) {
		logger.info("게시판 유형 분리, 파라미터 vo={}", vo);
		
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
	public String oneCommunity(HttpSession session, 
			@ModelAttribute C_boardClassicVO classicVo,
			@ModelAttribute CommunitySearchVO searchVo, Model model) {
		logger.info("개별 커뮤니티 페이지, 파라미터 classicVo={}, searchVo={}", 
				classicVo, searchVo.getRecordCountPerPage());
		
		//페이징 처리
		//[1] PaginationInfo 객체 생성
		CommunutyPaginationInfo pagingInfo = new CommunutyPaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo에 paging관련 변수값 셋팅
		pagingInfo.setBlockSize(CommunityConstUtil.BLOCK_SIZE);
		if(searchVo.getRecordCountPerPage()!=0) {
			pagingInfo.setRecordCountPerPage(searchVo.getRecordCountPerPage());
			logger.info("레코드 New={}", searchVo.getRecordCountPerPage());
		}else {
			pagingInfo.setRecordCountPerPage(CommunityConstUtil.RECORD_COUNT);			
		}
		searchVo.setBoardNo(classicVo.getBoardNo());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		if(searchVo.getRecordCountPerPage()!=0) {
			searchVo.setRecordCountPerPage(searchVo.getRecordCountPerPage());
			logger.info("레코드 카운트={}", searchVo.getRecordCountPerPage());
		}else {
			searchVo.setRecordCountPerPage(CommunityConstUtil.RECORD_COUNT);
		}
		logger.info("페이지번호 관련 셋팅 후 searchVo={}", searchVo);
		
		int totalRecord=c_boardService.selectTotalRecord(searchVo);
		logger.info("totalRecord="+totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//2
		List<C_boardClassicVO> classicList=c_boardService.searchC_boardClassic(searchVo);
		logger.info("글 전체 조회 결과, classicList.size={}", classicList.size());

		//사이드바 화면 보기
		CommunityVO vo= communityService.selectCommunityByNo(classicVo.getCommunityNo());
		List<CommunityMemberVO> list = communityService.selectCommunity();
		List<CommunityMemberVO> memList=communityService.selectMember(classicVo.getCommunityNo());
		List<C_boardVO> boardList= c_boardService.selectC_boardByNo(classicVo.getCommunityNo());
		logger.info("개별 커뮤니티 처리결과, vo={}, list.size={}, boardList.size={}", 
				vo, list.size(), boardList.size());
		
		model.addAttribute("classicList", classicList);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("memList", memList);
		model.addAttribute("boardList", boardList);

		return "community/communityOneClassic";
		
	}
	
	@GetMapping("/c_boardWrite")
	public String writeCommunity(@RequestParam(defaultValue = "0") int communityNo, 
			HttpSession session, Model model) {
		logger.info("커뮤니티 게시판 글쓰기 페이지, 파라미터 communityNo={}", communityNo);
		
		//아이디 세션 확인
		EmpVO empVo = empService.selectEmpInfo(3);
		session.setAttribute("empVo", empVo);
		logger.info("empVo={}", empVo);
		
		//화면 보여주기 데이터
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		List<CommunityMemberVO> list = communityService.selectCommunity();
		List<CommunityMemberVO> memList=communityService.selectMember(communityNo);
		List<C_boardVO> boardList= c_boardService.selectC_boardByNo(communityNo);
		logger.info("커뮤니티 게시판 목록 결과, vo={}, list.size={}, boardList.size={}, memList.size={}", 
				vo, list.size(), boardList.size(), memList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("memList", memList);
		model.addAttribute("boardList", boardList);
		
		return "community/board/c_boardWrite";
	}
	
	@PostMapping("/c_boardWrite")
	public String writeCommunity_post(@ModelAttribute C_boardClassicVO classicVo,
			HttpServletRequest request, HttpSession session, Model model) {
		logger.info("커뮤니티 게시판 글쓰기 처리, 파라미터 classicVo={}",classicVo);
		
		//아이디 세션 저장
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
			url="redirect:/community/communityOneMain?communityNo="+classicVo.getCommunityNo();
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
		List<CommunityMemberVO> list = communityService.selectCommunity();
		List<C_boardVO> boardList= c_boardService.selectC_boardByNo(communityNo);
		List<CommunityMemberVO> memList=communityService.selectMember(communityNo);
		logger.info("커뮤니티 게시판 개설 화면 결과, vo={}, list.size={}, boardList.size={}, memList.size={}", 
				vo, list.size(), boardList.size(), memList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("memList", memList);
		model.addAttribute("boardList", boardList);
		
		return "community/board/c_boardNew";
		
	}
	
	@PostMapping("/c_boardNew")
	public String newBoard_post(@ModelAttribute C_boardVO vo, 
			@RequestParam(defaultValue = "0") int c_boardType, Model model) {
		logger.info("커뮤니티 게시판 개설 처리, 파라미터 c_boardVo={}, c_boardType={}", vo, c_boardType);
		
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
