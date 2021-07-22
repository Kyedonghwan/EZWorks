package com.it.ez.calendar.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.calendar.model.CalendarService;
import com.it.ez.calendar.model.CalendarVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/calendar")
public class CalController {
	private static final Logger logger = LoggerFactory.getLogger(CalController.class);
	
	private final CalendarService calendarService;
	
	@RequestMapping("/calendarMain")
	public void Calendar() {
		logger.info("캘린더 화면 보여주기");
		
	}
	
	@RequestMapping("/calRegister")
	public void Register() {
		logger.info("일정 등록 화면 보여주기");
	}
	
	@PostMapping("/calRegister")
	public List<CalendarVO> searchAll() {
		
		List<CalendarVO> list = new ArrayList<>();
		CalendarVO vo = new CalendarVO();
		for(int i=0;i<list.size();i++) {
			vo.setSchTitle("schTitle");
			vo.setSchStart("schStart");
			vo.setSchEnd("schEnd");
		}
		
		list.add(vo);
		
		return list;
	}
	
	@PostMapping("/calRegister")
	public String insertSch(@ModelAttribute CalendarVO vo) {
		logger.info("일정 입력시 파라미터, vo={}",vo);
		
		int cnt=calendarService.insertSch(vo);
		logger.info("일정 입력 처리 결과, cnt={}",cnt);
		
		return "redirect:/calendar/calendarMain";
	}
}
