package com.it.ez.calendar.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@GetMapping("/calDetail")
	public void detailView(@RequestParam(defaultValue = "0")int schNo, Model model) {
		logger.info("상세 화면 보여주기, 파라미터 schNo={}",schNo);
		
		CalendarVO vo=calendarService.selectBySchNo(schNo);
		logger.info("상세화면-조회,결과 vo={}", vo);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("/calRegister")
	public String insertSch(@ModelAttribute CalendarVO vo) {
		logger.info("일정 입력시 파라미터, vo={}",vo);
		
		int cnt=calendarService.insertSch(vo);
		logger.info("일정 입력 처리 결과, cnt={}",cnt);
		/*
		 * if(cnt>0) { int color=calendarService.insertColor();
		 * logger.info("색 입력 처리 결과, color={}",color); }
		 */
		
		return "redirect:/calendar/calendarMain";
	}
	
	@GetMapping("/calEdit")
	public void editView(@RequestParam(defaultValue = "0")int schNo, Model model) {
		logger.info("수정 화면 보여주기, 파라미터 schNo={}",schNo);
		
		CalendarVO vo=calendarService.selectBySchNo(schNo);
		logger.info("수정화면-조회,결과 vo={}", vo);
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/calEdit")
	public String editSch(@ModelAttribute CalendarVO vo) {
		logger.info("일정 수정시 파라미터, vo={}",vo);
		
		int cnt=calendarService.updateCal(vo);
		logger.info("일정 수정 처리 결과, cnt={}",cnt);
		
		return "redirect:/calendar/calendarMain";
	}
	
	
	@ResponseBody
	@RequestMapping("/writeSchModal")
	public void insertModal(@ModelAttribute CalendarVO vo) {
		logger.info("modal에서 일정입력, 파라미터 vo={}",vo);

		int cnt=calendarService.insertModal(vo);
		logger.info("modal일정입력 결과, cnt={}",cnt);
		
	}
	
	@ResponseBody
	@GetMapping("/showCal")
	public List<CalendarVO> showCal() {
		logger.info("일정 정체 보여주기");
		
		List<CalendarVO> list = calendarService.selectAll();
		logger.info("일정보여주기 list.size()={}",list.size());
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/deleteCal")
	public void delCal(@RequestParam(defaultValue = "0")int schNo) {
		logger.info("일정 삭제하기");
		
		int result=calendarService.delCal(schNo);
		logger.info("일정 삭제 결과, result={}",result);
	}
}
