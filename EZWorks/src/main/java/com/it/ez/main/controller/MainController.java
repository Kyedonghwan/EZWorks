package com.it.ez.main.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.it.ez.attendance.model.AttendanceService;
import com.it.ez.attendance.model.AttendanceVO;
import com.it.ez.emp.model.EmpVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	private final AttendanceService attendanceService;
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
		
		return "index";
	}
}
