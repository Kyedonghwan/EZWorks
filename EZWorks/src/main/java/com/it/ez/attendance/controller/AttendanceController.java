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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.attendance.common.AttendanceMonthCalculator;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/attendance")
@RequiredArgsConstructor
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	private final AttendanceMonthCalculator attendanceMonthCalculator;
	
	@RequestMapping("/attendanceMain")
	public String attendanceMain(Model model, @RequestParam(required = false) Integer year, @RequestParam(required = false) Integer month, @RequestParam(required = false) Integer date)  {
		
		//주 반복을 위한
		if(year==null) {
			LocalDate now = LocalDate.now();
			year = now.getYear();
			month = now.getMonthValue();
			date = now.getDayOfMonth();
		}
		model.addAttribute("year", year);
		logger.info("nowYear={}", year);
		logger.info("nowMonth={}", month);
		logger.info("nowdayofMonth={}", date);
		model.addAttribute("month", month);
		model.addAttribute("date", date);
		int weeks = attendanceMonthCalculator.getTotalWeeks(year, month);
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
		
		List<List<Date>> daysList = attendanceMonthCalculator.getDaysList(year, month);
		model.addAttribute("daysList", daysList);
		logger.info("daysList.size={}", daysList.size());
		logger.info("daysList={}", daysList);
		
		return "attendance/attendanceMain";
	}
}
