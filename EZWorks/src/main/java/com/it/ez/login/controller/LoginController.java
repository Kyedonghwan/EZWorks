package com.it.ez.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.ez.emp.model.EmpService;
import com.it.ez.emp.model.EmpVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class LoginController {
	private static final Logger logger
	=LoggerFactory.getLogger(LoginController.class);
	
	private final EmpService empService;
	
	@GetMapping("/mainLogin")
	public void login() {
		logger.info("로그인 화면보여주기");
	}
	
	@PostMapping("/mainLogin")
	public String login_post(@RequestParam int empNo, @RequestParam String pwd ,@RequestParam(required = false) String chkSave, HttpServletRequest request,HttpServletResponse response,Model model) {
		
	//1
		logger.info("로그인 empNo={}, pwd={}, chkSave={},",empNo, pwd, chkSave);
		

		//2
		int result=empService.loginProc(empNo, pwd);
		logger.info("로그인 처리, 결과 result={}", result);
		
		String msg="로그인 처리 실패", url="/mainLogin";
		if(result==EmpService.LOGIN_OK) {
			EmpVO vo=empService.selectEmpByEmpNo(empNo);
			logger.info("로그인 처리, 사원조회 결과 vo={}", vo);
			String posName = empService.selectPosName(empNo);
			vo.setPosName(posName);
			
			//session 
			HttpSession session=request.getSession();
			session.setAttribute("empNo", empNo); //사원번호(아이디)
			session.setAttribute("empName", vo.getEmpName()); //사원 이름
			session.setAttribute("empVo", vo);
			
//			//쿠키
//			Cookie ck = new Cookie("ck_empno", empNo);
//			ck.setPath("/");			
//			if(chkSave !=null && !chkSave.isEmpty()) {
//				ck.setMaxAge(1000*24*60*60);
//			}else {
//				ck.setMaxAge(0);
//			}
//			response.addCookie(ck);
			
			msg=vo.getEmpName() + "님 로그인되었습니다.";
			url="/";
		}else if(result==EmpService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==EmpService.ID_NONE) {
			msg="해당 사원번호가 존재하지 않습니다.";			
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/mainLogin";
	}
}


