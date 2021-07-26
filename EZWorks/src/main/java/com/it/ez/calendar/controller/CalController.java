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
		logger.info("Ķ���� ȭ�� �����ֱ�");
	}
	
	@GetMapping("/calDetail")
	public void detailView(@RequestParam(defaultValue = "0")int schNo, Model model) {
		logger.info("�� ȭ�� �����ֱ�, �Ķ���� schNo={}",schNo);
		
		CalendarVO vo=calendarService.selectBySchNo(schNo);
		logger.info("��ȭ��-��ȸ,��� vo={}", vo);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("/calRegister")
	public String insertSch(@ModelAttribute CalendarVO vo) {
		logger.info("���� �Է½� �Ķ����, vo={}",vo);
		
		int cnt=calendarService.insertSch(vo);
		logger.info("���� �Է� ó�� ���, cnt={}",cnt);
		/*
		 * if(cnt>0) { int color=calendarService.insertColor();
		 * logger.info("�� �Է� ó�� ���, color={}",color); }
		 */
		
		return "redirect:/calendar/calendarMain";
	}
	
	@GetMapping("/calEdit")
	public void editView(@RequestParam(defaultValue = "0")int schNo, Model model) {
		logger.info("���� ȭ�� �����ֱ�, �Ķ���� schNo={}",schNo);
		
		CalendarVO vo=calendarService.selectBySchNo(schNo);
		logger.info("����ȭ��-��ȸ,��� vo={}", vo);
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/calEdit")
	public String editSch(@ModelAttribute CalendarVO vo) {
		logger.info("���� ������ �Ķ����, vo={}",vo);
		
		int cnt=calendarService.updateCal(vo);
		logger.info("���� ���� ó�� ���, cnt={}",cnt);
		
		return "redirect:/calendar/calendarMain";
	}
	
	
	@ResponseBody
	@RequestMapping("/writeSchModal")
	public void insertModal(@ModelAttribute CalendarVO vo) {
		logger.info("modal���� �����Է�, �Ķ���� vo={}",vo);

		int cnt=calendarService.insertModal(vo);
		logger.info("modal�����Է� ���, cnt={}",cnt);
		
	}
	
	@ResponseBody
	@GetMapping("/showCal")
	public List<CalendarVO> showCal() {
		logger.info("���� ��ü �����ֱ�");
		
		List<CalendarVO> list = calendarService.selectAll();
		logger.info("���������ֱ� list.size()={}",list.size());
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/deleteCal")
	public void delCal(@RequestParam(defaultValue = "0")int schNo) {
		logger.info("삭제처리 schNo={}",schNo);
		
		int result=calendarService.delCal(schNo);
		logger.info("삭제처리 결과, result={}",result);
	}
}
