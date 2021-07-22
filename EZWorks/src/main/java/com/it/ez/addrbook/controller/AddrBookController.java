package com.it.ez.addrbook.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.ModelAndView;

import com.it.ez.addrbook.model.AddrBookService;
import com.it.ez.addrbook.model.AddrBookVO;
import com.it.ez.addrbook.model.EmployeeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AddrBookController {
	private static final Logger logger
	=LoggerFactory.getLogger(AddrBookController.class);
	
	private final AddrBookService addrService;
	
	@RequestMapping("/addrbook/addrbook")
	public void showmain() {
		
	}
	
	@RequestMapping("/addrbook/testaddr")
	public void showmainsample() {
		
	}
	
	@GetMapping("/addrbook/addrWrite")
	public void write() {
		logger.info("주소록 등록 화면처리");
	}
	
	@PostMapping("/addrbook/addrWrite")
	public String write_post(@ModelAttribute AddrBookVO vo , Model model) {
		logger.info("파라미터 vo={}",vo);
		
		int cnt=addrService.insertBook(vo);
		logger.info("주소록 등록 cnt={}",cnt);
		
		String msg="주소록 등록 실패" , url="addrbook/addrWrite";
		if(cnt>0) {
			msg="주소록 등록 성공" ;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/addrbook/testWrite")
	public void write2() {
		
	}
	@GetMapping("/addrbook/testMain")
	public void write3() {
	
	}
	@PostMapping("/addrbook/testMain")
    public ModelAndView  coAddrList(HttpServletRequest request, ModelAndView mav) {
		      
		      /////////////////////////////////////////////////////////////////////////////////////
		      
		      String contactInput = request.getParameter("contactInput");
		      
		      String range = request.getParameter("range");
		      String range1 = request.getParameter("range1");
		      String range2 = request.getParameter("range2");
		      
		      String data = request.getParameter("data");
		      String sort = request.getParameter("sort");
		      
		      if(data == null || data.trim().isEmpty()) {
		         data = "emp_name";
		      }
		      
		      if(sort == null || sort.trim().isEmpty()) {
		         sort = "asc";
		      }
		      
		      String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		      String str_sizePerPage = request.getParameter("sizePerPage");
		      
		      if(contactInput == null || contactInput.trim().isEmpty()) {
		         contactInput = "";
		      }// end of if(searchWord == null || searchWord.trim().isEmpty()) {}---------------------
		      
		      if(range == null) {
		         range = "전체";
		      }// end of if(range == null) {}-------------------
		      
		      if(range1 == null) {
		         range1 = "";
		      }// end of if(range1 == null) {}-------------------
		      
		      if(range2 == null) {
		         range2 = "";
		      }// end of if(range2 == null) {}-------------------
		      
		      Map<String, String> paraMap = new HashMap<String, String>();
		      paraMap.put("contactInput", contactInput);
		      paraMap.put("range1", range1);
		      paraMap.put("range2", range2);
		      paraMap.put("data", data);
		      paraMap.put("sort", sort);
		      
		      int sizePerPage = 0;       // 한 페이지에 보일 주소록 수
		      int currentShowPageNo = 0;  // 현재 페이지 번호로, 초기치는 1페이지로 설정
		      int totalPage = 0;          // 총 페이지 수
		      
		      int startRno = 0;           // 시작 행번호
		      int endRno = 0;             // 끝 행번호
		      
		      if(str_sizePerPage == null) {
		         // 게시판 목록보기에 들어갔을 때의 초기화면인 경우
		         sizePerPage = 20;
		      } else {
		         
		         try {
		            // GET 방식으로 잘못된 값이 넘어오는 것을 막는다.
		            sizePerPage = Integer.parseInt(str_sizePerPage);
		            
		            if(sizePerPage != 20 && sizePerPage != 40 && sizePerPage != 60 && sizePerPage != 80) {
		               sizePerPage = 20;
		            }// end of if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {}
		         } catch (NumberFormatException e) {
		            sizePerPage = 20;
		         }
		         
		      }// end of if(str_sizePerPage == null) {}----------------------
		      
		      if(str_currentShowPageNo == null) {
		         // 게시판 목록보기에 들어갔을 때의 초기화면인 경우
		         currentShowPageNo = 1;
		      } else {
		         
		         try {
		            // GET 방식으로 잘못된 값이 넘어오는 것을 막는다.
		            currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
		            
		            if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
		               currentShowPageNo = 1;
		            }// end of if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {}
		         } catch (NumberFormatException e) {
		            currentShowPageNo = 1;
		         }
		         
		      }// end of if(str_currentShowPageNo == null) {}----------------------
		      
		      // 가져올 주소록의 범위 
		      startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
		      endRno = startRno + sizePerPage - 1;
		      
		      paraMap.put("startRno", String.valueOf(startRno));
		      paraMap.put("endRno", String.valueOf(endRno));
		      
		      // 사원 수 count
		//      int count = service.empNumber(paraMap);
		      
		//      totalPage = (int)Math.ceil((double)count / sizePerPage);
		      
		      // 사원 목록
		//      List<EmployeeVO> empList = service.empList(paraMap);
		      
		      String pageBar = "<ul style='list-style: none;'>";
		      
		      int blockSize = 5;
		      int loop = 1;
		      
		      int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		       
		      String url = "addrbook";
		         
		      // [처음][이전] 만들기 
		      if(pageNo != 1) {
		         pageBar += "<li style='display:inline-block; width:25px; font-size:12pt; margin: 7px; background-color: #dadada; border-radius: 50%;'><a href='"+url+"?contactInput="+contactInput+"&currentShowPageNo=1'><i class='fa fa-angle-double-left'></i></a></li>";
		         pageBar += "<li style='display:inline-block; width:25px; font-size:12pt; margin: 7px; background-color: #dadada; border-radius: 50%;'><a href='"+url+"?contactInput="+contactInput+"&currentShowPageNo="+(pageNo-1)+"'><i class='fa fa-angle-left'></i></a></li>";
		      }
		      
		      while(!(loop > blockSize || pageNo > totalPage)) {
		           
		         if(pageNo == currentShowPageNo) {
		            pageBar += "<li style='display:inline-block; width:25px; font-size:12pt; margin: 7px; color: #e6e6e6; background-color: #6666ff; border-radius: 50%;'>"+pageNo+"</li>";
		         } else {
		            pageBar += "<li style='display:inline-block; width:25px; font-size:12pt; margin: 7px; background-color: #dadada; border-radius: 50%;'><a href='"+url+"?contactInput="+contactInput+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
		         }
		              
		         loop++;
		         pageNo++;
		           
		      }// end of while(!(loop > blockSize || pageNo > totalPage)) {}----------------------------
		        
		      // [다음][마지막] 만들기
		      if(!(pageNo > totalPage)) {
		         pageBar += "<li style='display:inline-block; width:25px; font-size:12pt; margin: 7px; background-color: #dadada; border-radius: 50%;'><a href='"+url+"?contactInput="+contactInput+"&currentShowPageNo="+pageNo+"'><i class='fa fa-angle-right'></i></a></li>";
		         pageBar += "<li style='display:inline-block; width:25px; font-size:12pt; margin: 7px; background-color: #dadada; border-radius: 50%;'><a href='"+url+"?contactInput="+contactInput+"&currentShowPageNo="+totalPage+"'><i class='fa fa-angle-double-right'></i></a></li>";
		      }

		      pageBar += "</ul>";
		      
		      mav.addObject("pageBar", pageBar);
		      
		     // String goBackURL = MyUtil.getCurrentURL(request);
		      
		    //  mav.addObject("goBackURL", goBackURL);
		      
		      /////////////////////////////////////////////////////////////////////////////////////
		      // Controller
		      // 필드 설정 보내기
		      String[] fieldtype = request.getParameterValues("fieldtype");
		      
		      if(fieldtype == null) {
		         // 필드 설정 없이 첫 화면 진입 시 모든 필드를 선택한 것으로 초기화
		         String[] initArr = {"empName", "posName", "hp", "email", "deptName", "company", "corp_phone", "basicAddress"};
		         fieldtype = initArr;
		      }// end of if(fieldtype == null) {}---------------------
		      mav.addObject("fieldtype", fieldtype);
		      
		 //     mav.addObject("count", count);
		 //     mav.addObject("empList", empList);
		      
		      mav.addObject("sizePerPage", sizePerPage);  // view 단에서 선택한 필드 설정 값을 유지하기 위해 다시 view 단으로 보낸다.
		      mav.addObject("range", range);
		      
		      mav.addObject("data", data);
		      mav.addObject("sort", sort);
		      
		      // 전체 주소록 목록과 검색 결과 목록의 경우를 나눠 다른 view 단을 호출한다.
		      if(contactInput == "") {
		         mav.setViewName("addrbook/testAddr");
		      } else {
		         mav.addObject("contactInput", contactInput);
		         mav.setViewName("addrbook/addressbookSearch");
		      }
		      
		      return mav;
		   }// end of public ModelAndView addressbook(ModelAndView mav) {}-----------------------
		   
	
	
	
	
	@RequestMapping("/addrbook/addrDetail")
	public void detail() {
		
	}
	
}
