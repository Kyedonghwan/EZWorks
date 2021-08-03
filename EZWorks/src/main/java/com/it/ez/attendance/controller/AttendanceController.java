package com.it.ez.attendance.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.ez.attendance.common.AttendanceMonthCalculator;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/attendance")
@RequiredArgsConstructor
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	private final AttendanceMonthCalculator attendanceMonthCalculator;
	
	@RequestMapping("/attendanceMain")
	public String attendanceMain(Model model) {
		
		//주 반복을 위한
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int monthValue = now.getMonthValue();
		int dayOfMonth = now.getDayOfMonth();
		model.addAttribute("year", year);
		model.addAttribute("month", monthValue);
		model.addAttribute("date", dayOfMonth);
		int weeks = attendanceMonthCalculator.getTotalWeeks(year, monthValue);
		model.addAttribute("weeks", weeks);
		logger.info("weeks={}",weeks);
		
		List<Date> datelist = new ArrayList<Date>();
		
		Calendar calendar = Calendar.getInstance();
		
		calendar.set(2021, 7, 1);
		for(int i=0;i<10;i++) {
			Date d = new Date(calendar.getTimeInMillis());
			datelist.add(d);
			calendar.add(Calendar.DATE, 1);
		}
		model.addAttribute("datelist", datelist);
		
		return "attendance/attendanceMain";
	}
}
