package com.it.ez.addrbook.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.it.ez.addrbook.common.AddrConstUtil;
import com.it.ez.addrbook.common.AddrFileUploadUtil;
import com.it.ez.addrbook.common.AddrPaginationInfo;
import com.it.ez.addrbook.model.AddrBookService;
import com.it.ez.addrbook.model.AddrBookVO;
import com.it.ez.addrbook.model.CoAddrBookService;
import com.it.ez.addrbook.model.CoEmpVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AddrBookController {
	private static final Logger logger = LoggerFactory.getLogger(AddrBookController.class);

	private final AddrBookService addrService;
	private final CoAddrBookService coAddrService;
	private final AddrFileUploadUtil fileUploadUtil;

	@RequestMapping("/addrbook/testDetail")
	public void showmainsample() {

	}

	@GetMapping("/addrbook/addrWrite")
	public void write() {
		logger.info("주소록 등록 화면처리");
	}

	@PostMapping("/addrbook/addrWrite")
	public String write_post(@ModelAttribute AddrBookVO vo, MultipartHttpServletRequest request, Model model) {
		logger.info("파라미터 vo={}", vo);


		//파일 업로드 처리 
		String photoName="", orPhotoName="";
		long fileSize=0;
		
		List<Map<String, Object>> list;
		try { 
		
			list=fileUploadUtil.fileUpload(request, AddrConstUtil.UPLOAD_IMAGE_FLAG);
	
			for(Map<String, Object> map : list) { 
				photoName=(String)map.get("fileName");
				fileSize=(Long)map.get("fileSize");
				orPhotoName=(String)map.get("originalFileName");
				
			}
		} catch (IllegalStateException e) { 
			e.printStackTrace(); 
		} catch(IOException e) { 
			e.printStackTrace(); 
		}

		vo.setPhotoName(photoName);
		vo.setFileSize(fileSize);
		vo.setOrPhotoName(orPhotoName);


		int cnt = addrService.insertBook(vo);
		logger.info("주소록 등록 cnt={}", cnt);

		String msg = "주소록 등록 실패", url = "/addrbook/addrWrite";
		if (cnt > 0) {
			msg = "주소록 등록 성공";
			url = "/addrbook/addrbook";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
}

@RequestMapping("/addrbook/testcho")
public void write2() {

}

@GetMapping("/addrbook/testMain")
public void write3() {

}

@PostMapping("/addrbook/testMain")
public ModelAndView coAddrList(HttpServletRequest request, ModelAndView mav) {

	/////////////////////////////////////////////////////////////////////////////////////

	String contactInput = request.getParameter("contactInput");

	String range = request.getParameter("range");
	String range1 = request.getParameter("range1");
	String range2 = request.getParameter("range2");

	String data = request.getParameter("data");
	String sort = request.getParameter("sort");

	if (data == null || data.trim().isEmpty()) {
		data = "emp_name";
	}

	if (sort == null || sort.trim().isEmpty()) {
		sort = "asc";
	}

	String str_currentShowPageNo = request.getParameter("currentShowPageNo");
	String str_sizePerPage = request.getParameter("sizePerPage");

	if (contactInput == null || contactInput.trim().isEmpty()) {
		contactInput = "";
	} // end of if(searchWord == null || searchWord.trim().isEmpty())
	// {}---------------------

	if (range == null) {
		range = "전체";
	} // end of if(range == null) {}-------------------

	if (range1 == null) {
		range1 = "";
	} // end of if(range1 == null) {}-------------------

	if (range2 == null) {
		range2 = "";
	} // end of if(range2 == null) {}-------------------

	Map<String, String> paraMap = new HashMap<String, String>();
	paraMap.put("contactInput", contactInput);
	paraMap.put("range1", range1);
	paraMap.put("range2", range2);
	paraMap.put("data", data);
	paraMap.put("sort", sort);

	int sizePerPage = 0; // 한 페이지에 보일 주소록 수
	int currentShowPageNo = 0; // 현재 페이지 번호로, 초기치는 1페이지로 설정
	int totalPage = 0; // 총 페이지 수

	int startRno = 0; // 시작 행번호
	int endRno = 0; // 끝 행번호

	if (str_sizePerPage == null) {
		// 게시판 목록보기에 들어갔을 때의 초기화면인 경우
		sizePerPage = 20;
	} else {

		try {
			// GET 방식으로 잘못된 값이 넘어오는 것을 막는다.
			sizePerPage = Integer.parseInt(str_sizePerPage);

			if (sizePerPage != 20 && sizePerPage != 40 && sizePerPage != 60 && sizePerPage != 80) {
				sizePerPage = 20;
			} // end of if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {}
		} catch (NumberFormatException e) {
			sizePerPage = 20;
		}

	} // end of if(str_sizePerPage == null) {}----------------------

	if (str_currentShowPageNo == null) {
		// 게시판 목록보기에 들어갔을 때의 초기화면인 경우
		currentShowPageNo = 1;
	} else {

		try {
			// GET 방식으로 잘못된 값이 넘어오는 것을 막는다.
			currentShowPageNo = Integer.parseInt(str_currentShowPageNo);

			if (currentShowPageNo < 1 || currentShowPageNo > totalPage) {
				currentShowPageNo = 1;
			} // end of if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {}
		} catch (NumberFormatException e) {
			currentShowPageNo = 1;
		}

	} // end of if(str_currentShowPageNo == null) {}----------------------

	// 가져올 주소록의 범위
	startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
	endRno = startRno + sizePerPage - 1;

	paraMap.put("startRno", String.valueOf(startRno));
	paraMap.put("endRno", String.valueOf(endRno));

	// 사원 수 count
	// int count = service.empNumber(paraMap);

	// totalPage = (int)Math.ceil((double)count / sizePerPage);

	// 사원 목록
	// List<EmployeeVO> empList = service.empList(paraMap);

	String pageBar = "<ul style='list-style: none;'>";

	int blockSize = 5;
	int loop = 1;

	int pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;

	String url = "addrbook";

	// [처음][이전] 만들기
	if (pageNo != 1) {
		pageBar += "<li style='display:inline-block; width:25px; font-size:12pt; margin: 7px; background-color: #dadada; border-radius: 50%;'><a href='"
				+ url + "?contactInput=" + contactInput
				+ "&currentShowPageNo=1'><i class='fa fa-angle-double-left'></i></a></li>";
		pageBar += "<li style='display:inline-block; width:25px; font-size:12pt; margin: 7px; background-color: #dadada; border-radius: 50%;'><a href='"
				+ url + "?contactInput=" + contactInput + "&currentShowPageNo=" + (pageNo - 1)
				+ "'><i class='fa fa-angle-left'></i></a></li>";
	}

	while (!(loop > blockSize || pageNo > totalPage)) {

		if (pageNo == currentShowPageNo) {
			pageBar += "<li style='display:inline-block; width:25px; font-size:12pt; margin: 7px; color: #e6e6e6; background-color: #6666ff; border-radius: 50%;'>"
					+ pageNo + "</li>";
		} else {
			pageBar += "<li style='display:inline-block; width:25px; font-size:12pt; margin: 7px; background-color: #dadada; border-radius: 50%;'><a href='"
					+ url + "?contactInput=" + contactInput + "&currentShowPageNo=" + pageNo + "'>" + pageNo
					+ "</a></li>";
		}

		loop++;
		pageNo++;

	} // end of while(!(loop > blockSize || pageNo > totalPage))
	// {}----------------------------

	// [다음][마지막] 만들기
	if (!(pageNo > totalPage)) {
		pageBar += "<li style='display:inline-block; width:25px; font-size:12pt; margin: 7px; background-color: #dadada; border-radius: 50%;'><a href='"
				+ url + "?contactInput=" + contactInput + "&currentShowPageNo=" + pageNo
				+ "'><i class='fa fa-angle-right'></i></a></li>";
		pageBar += "<li style='display:inline-block; width:25px; font-size:12pt; margin: 7px; background-color: #dadada; border-radius: 50%;'><a href='"
				+ url + "?contactInput=" + contactInput + "&currentShowPageNo=" + totalPage
				+ "'><i class='fa fa-angle-double-right'></i></a></li>";
	}

	pageBar += "</ul>";

	mav.addObject("pageBar", pageBar);

	// String goBackURL = MyUtil.getCurrentURL(request);

	// mav.addObject("goBackURL", goBackURL);

	/////////////////////////////////////////////////////////////////////////////////////
	// Controller
	// 필드 설정 보내기
	String[] fieldtype = request.getParameterValues("fieldtype");

	if (fieldtype == null) {
		// 필드 설정 없이 첫 화면 진입 시 모든 필드를 선택한 것으로 초기화
		String[] initArr = { "empName", "posName", "hp", "email", "deptName", "company", "corp_phone",
		"basicAddress" };
		fieldtype = initArr;
	} // end of if(fieldtype == null) {}---------------------
	mav.addObject("fieldtype", fieldtype);

	// mav.addObject("count", count);
	// mav.addObject("empList", empList);

	mav.addObject("sizePerPage", sizePerPage); // view 단에서 선택한 필드 설정 값을 유지하기 위해 다시 view 단으로 보낸다.
	mav.addObject("range", range);

	mav.addObject("data", data);
	mav.addObject("sort", sort);

	// 전체 주소록 목록과 검색 결과 목록의 경우를 나눠 다른 view 단을 호출한다.
	if (contactInput == "") {
		mav.setViewName("addrbook/testAddr");
	} else {
		mav.addObject("contactInput", contactInput);
		mav.setViewName("addrbook/addressbookSearch");
	}

	return mav;
}// end of public ModelAndView addressbook(ModelAndView mav)
// {}-----------------------

@RequestMapping("/addrbook/addrDetail")
public String detail(@RequestParam(defaultValue = "0") int bookNo, HttpServletRequest request, Model model) {
	// 1
	logger.info("주소록 상세보기, 파라미터 no={}", bookNo);
	if (bookNo == 0) {
		model.addAttribute("msg", "잘못된 url!");
		model.addAttribute("url", "/addrbook/addrbook");

		return "common/message";
	}

	// 2
	AddrBookVO vo = addrService.selectByNo(bookNo);
	logger.info("상세보기 결과, vo={}", vo);

	// String fileInfo
	// =Utility.getFileInfo(vo.getOriginalFileName(), vo.getFileSize(),
	// request);

	// 3
	model.addAttribute("vo", vo);
	// model.addAttribute("fileInfo", fileInfo);

	return "addrbook/addrDetail";
}

@GetMapping("/addrbook/addrEdit")
public String edit(@RequestParam int bookNo, Model model) { // userid 가져오려면 session

	// String userid=(String) session.getAttribute("userid");
	logger.info("회원 수정 화면"); // 파라미터 userid={},userid

	/*
	 * if(userid == null || userid.isEmpty()) { model.addAttribute("msg",
	 * "먼저 로그인하세요"); model.addAttribute("url", "/login/login"); return
	 * "common/message"; }
	 */

	AddrBookVO vo = addrService.selectByNo(bookNo);
	logger.info("주소록 수정 화면, 조회 결과 vo={}", vo);

	model.addAttribute("vo", vo);

	return "addrbook/addrEdit";

}

@PostMapping("/addrbook/addrEdit")
public String edit_post(@ModelAttribute AddrBookVO vo, Model model) {
	// String userid=(String) session.getAttribute("userid");
	// vo.setUserid(userid);
	logger.info("회원수정 처리, 파라미터 vo={}", vo);

	String msg = "비밀번호 체크 실패", url = "/addrBook/addrEdit";
	// int result=memberService.loginProc(userid, vo.getPwd());
	// logger.info("회원수정 처리, 비밀번호 체크 결과, result={}", result);
	// if(result==MemberService.LOGIN_OK) {
	// hp
	/*
	 * String hp2=vo.getHp2(); String hp3=vo.getHp3(); if(hp2==null || hp2.isEmpty()
	 * || hp3==null || hp3.isEmpty()) { vo.setHp1(""); vo.setHp2(""); vo.setHp3("");
	 * }
	 * 
	 * //email String email1=vo.getEmail1(); String email2=vo.getEmail2();
	 * if(email1==null || email1.isEmpty()) { email1=""; email2=""; }else {
	 * if(email2.equals("etc")) { if(email3!=null && !email3.isEmpty()) {
	 * email2=email3; }else { email1=""; email2=""; } } } vo.setEmail1(email1);
	 * vo.setEmail2(email2);
	 */
	int cnt = addrService.updateBook(vo);
	logger.info("회원수정 결과, cnt={}", cnt);

	if (cnt > 0) {
		msg = "주소록 정보 수정되었습니다.";
		url="/addrbook/addrbook";
	} else {
		msg = "주소록 정보 수정 실패!";
		url="/addrbook/addrbook";
	}
	// }else if(result==MemberService.PWD_DISAGREE) {
	// msg="비밀번호가 일치하지 않습니다.";
	// }

	model.addAttribute("msg", msg);
	model.addAttribute("url", url);

	return "common/message";
}

@RequestMapping("/addrbook/testEdit")
public void testedit() {

}

@RequestMapping("/addrbook/addrbook")
public String addrList(@ModelAttribute AddrBookVO searchVo, Model model) {
	logger.info("list, 파라미터 searchVo={}", searchVo);

	// 페이징 처리 관련
	// [1] PaginationInfo
	AddrPaginationInfo pagingInfo = new AddrPaginationInfo();
	pagingInfo.setBlockSize(AddrConstUtil.BLOCK_SIZE);
	pagingInfo.setCurrentPage(searchVo.getCurrentPage());
	pagingInfo.setRecordCountPerPage(AddrConstUtil.RECORD_COUNT);

	// [2] searchVo
	searchVo.setRecordCountPerPage(AddrConstUtil.RECORD_COUNT);
	searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	logger.info("셋팅 후 searchVo={}", searchVo);

	List<AddrBookVO> list = addrService.selectAll(searchVo);
	logger.info("list 조회 결과, list.size={}", list.size());

	int totalRecord = addrService.selectTotalRecord(searchVo);
	logger.info("list, totalRecord={}", totalRecord);

	pagingInfo.setTotalRecord(totalRecord);

	model.addAttribute("list", list);
	model.addAttribute("pagingInfo", pagingInfo);

	return "addrbook/addrbook";

}

@GetMapping("/addrbook/addrDelete") 
public String delete(int bookNo ,Model model) {
	int cnt=addrService.deleteBook(bookNo);
	
	String msg = "잘못된 접근", url = "/addrBook/addrDetail";
	if (cnt > 0) {
		msg = "삭제되었습니다.";
		url="/addrbook/addrbook";
	} else {
		msg = "주소록 정보 삭제 실패!";
		url="/addrbook/addrbook";
	}
	model.addAttribute("msg", msg);
	model.addAttribute("url", url);
	
	return "common/message";
}

@RequestMapping("/addrbook/coAddrbook")
public String coAddrList( HttpServletRequest request, Model model) {

	//		// 페이징 처리 관련
	//				// [1] PaginationInfo
	//				AddrPaginationInfo pagingInfo = new AddrPaginationInfo();
	//				pagingInfo.setBlockSize(AddrConstUtil.BLOCK_SIZE);
	//				pagingInfo.setCurrentPage(searchVo.getCurrentPage());
	//				pagingInfo.setRecordCountPerPage(AddrConstUtil.RECORD_COUNT);
	//
	//				// [2] searchVo
	//				searchVo.setRecordCountPerPage(AddrConstUtil.RECORD_COUNT);
	//				searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	//				logger.info("셋팅 후 searchVo={}", searchVo);

	String range = request.getParameter("range");
	String range1 = request.getParameter("range1");
	String range2 = request.getParameter("range2");

	if (range == null) {
		range = "전체";
	} // end of if(range == null) {}-------------------

	if (range1 == null) {
		range1 = "";
	} // end of if(range1 == null) {}-------------------

	if (range2 == null) {
		range2 = "";
	} // end of if(range2 == null) {}-------------------

	Map<String, String> paraMap = new HashMap<String, String>();

	paraMap.put("range1", range1);
	paraMap.put("range2", range2);

	List<CoEmpVO> list = coAddrService.selectAll(paraMap);
	logger.info("list 조회 결과, list.size={},list={}", list.size(), list);

	logger.info("list.get{}", list.get(2));

	//		  int totalRecord=coAddrService.selectTotalRecord(searchVo);
	//		  logger.info("list, totalRecord={}", totalRecord);
	//		  
	//		  pagingInfo.setTotalRecord(totalRecord);
	//		 

	model.addAttribute("list", list);
	//		model.addAttribute("pagingInfo", pagingInfo);

	return "addrbook/coAddrbook";

}

@RequestMapping(value = "/json", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
@ResponseBody
public String json(Locale locale, Model model) {    
    String[] array = {"김치 볶음밥", "신라면", "진라면", "라볶이", "팥빙수","너구리","삼양라면","안성탕면","불닭볶음면","짜왕","라면사리"};
    
        Gson gson = new Gson();

    return gson.toJson(array);//["김치 볶음밥","신라면","진라면","라볶이","팥빙수","너구리","삼양라면","안성탕면","불닭볶음면","짜왕","라면사리"]
}

}
