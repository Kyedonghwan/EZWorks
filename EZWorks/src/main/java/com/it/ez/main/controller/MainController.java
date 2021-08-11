package com.it.ez.main.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.ez.attendance.model.AttendanceService;
import com.it.ez.attendance.model.AttendanceVO;
import com.it.ez.emp.model.EmpService;
import com.it.ez.emp.model.EmpVO;
import com.it.ez.posting.model.BoardClassicPostingVO;
import com.it.ez.posting.model.PostingService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	private final AttendanceService attendanceService;
	private final EmpService empService;
	private final PostingService postingService;
	
	@RequestMapping("/")
	public String main(HttpSession session, Model model, @RequestParam(required = false) Integer year, @RequestParam(required = false) Integer month, @RequestParam(required = false) Integer date) {
		EmpVO empVo = (EmpVO) session.getAttribute("empVo"); 
		int empNo = empVo.getEmpNo();

		//주 반복을 위한
		if(year==null) {
			LocalDate now = LocalDate.now();
			year = now.getYear();
			month = now.getMonthValue();
			date = now.getDayOfMonth();
			
		}
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("date", date);
		logger.info("nowYear={} nowMonth={} nowdayofMonth={}", year, month, date);

		String startingDate = year+"-"+month+"-"+date;
		String endingDate = year+"-"+month+"-"+(date+1);
		logger.info("startingDate = {}, endingDate={}", startingDate, endingDate);
		int isAttended = attendanceService.isAttended(startingDate, endingDate, empNo);
		logger.info("여기 들어와야함");
		logger.info("isAttended={}", isAttended);
		model.addAttribute("isAttended", isAttended);
		int isEnded = attendanceService.isEnded(startingDate, endingDate, empNo);
		AttendanceVO attendedTime = attendanceService.todayAttendTime(startingDate, endingDate, empNo);
		AttendanceVO endedTime = attendanceService.todayEndTime(startingDate, endingDate, empNo);
		logger.info("attendanceVo = {}", attendedTime);
		model.addAttribute("attendedTime", attendedTime);
		model.addAttribute("endedTime", endedTime);
		int posNo = empVo.getPosNo();
		String posName = empService.selectPosName(posNo);
		model.addAttribute("posName", posName);
		
		List<BoardClassicPostingVO> seminarList = postingService.selectForMain(9);
		List<BoardClassicPostingVO> noticeList = postingService.selectForMain(1);
		List<BoardClassicPostingVO> dfacList = postingService.selectForMain(2);
		List<BoardClassicPostingVO> eznewsList = postingService.selectForMain(5);
		List<BoardClassicPostingVO> itnewsList = postingService.selectForMain(4);
		
		model.addAttribute("seminarList", seminarList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("dfacList", dfacList);
		model.addAttribute("eznewsList", eznewsList);
		model.addAttribute("itnewsList", itnewsList);
		
		
		
		return "index";
	}
}
