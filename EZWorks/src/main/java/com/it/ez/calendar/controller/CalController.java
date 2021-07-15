package com.it.ez.calendar.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.calendar.model.CalendarService;
import com.it.ez.calendar.model.CalendarVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CalController {
	private static final Logger logger = LoggerFactory.getLogger(CalController.class);
	
	private final CalendarService calendarService;
	
	@RequestMapping("/calendar/calendarMain")
	public void Calendar() {
		logger.info("캘린더 화면 보여주기");
		
	}
	
	@ResponseBody
	@RequestMapping("/list")
	public List<CalendarVO> searchAll() {
		logger.info("ajax이용 일정 처리");
		
		List<CalendarVO> list = new ArrayList<>();
		CalendarVO vo = new CalendarVO();
		for(int i=0;i<list.size();i++) {
			vo.setSchTitle("title");
		}
		
		list.add(vo);
		
		return list;
	}
}
