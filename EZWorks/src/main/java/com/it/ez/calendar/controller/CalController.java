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
import com.it.ez.schcate.model.SchCateService;
import com.it.ez.schcate.model.SchCateVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/calendar")
public class CalController {
	private static final Logger logger = LoggerFactory.getLogger(CalController.class);
	
	private final CalendarService calendarService;
	private final SchCateService schCateService;
	
	@RequestMapping("/calendarMain")
	public void Calendar(Model model) {
		logger.info("일정보여주기");
		
		List<SchCateVO> list = schCateService.showAllCate(1);
		model.addAttribute("list", list);
		logger.info("카테고리 list={}",list.size());
		
	}
	
	@GetMapping("/calDetail")
	public void detailView(@RequestParam(defaultValue = "0")int schNo, Model model) {
		logger.info("일정상세보기 schNo={}",schNo);
		
		CalendarVO vo=calendarService.selectBySchNo(schNo);
		logger.info("일정 상세보기 처리, vo={}", vo);
		
		SchCateVO vo2 = schCateService.showCateName(vo.getSchCate());
		logger.info("vo2={}",vo2);
		logger.info("분류 이름, cateName={},schCate={}",vo2.getSchCateName(),vo.getSchCate());
		model.addAttribute("vo", vo);
		model.addAttribute("vo2", vo2);
	}
	
	@RequestMapping("/calRegister")
	public String insertSch(@ModelAttribute CalendarVO vo) {
		logger.info("일정등록해주기, vo={}",vo);
		
		int cnt=calendarService.insertSch(vo);
		logger.info("일정등록, cnt={},schNo={}",cnt,vo.getSchNo());
		if(cnt>0) {
			int color=calendarService.insertColor(vo.getSchNo());
			logger.info("색넣기,color={}",color);
		}
		return "redirect:/calendar/calendarMain";
	}
	
	
	@GetMapping("/calEdit")
	public void editView(@RequestParam(defaultValue = "0")int schNo, Model model) {
		logger.info("일정 수정 처리, schNo={}",schNo);
		
		
		List<SchCateVO> list = schCateService.showAllCate(1);
		model.addAttribute("list", list);
		
		CalendarVO vo=calendarService.selectBySchNo(schNo);
		logger.info("일정 수정 보여주기, vo={}", vo);
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/calEdit")
	public String editSch(@ModelAttribute CalendarVO vo) {
		logger.info("일정 수정 처리, vo={}",vo);
		
		int cnt=calendarService.updateCal(vo);
		logger.info("일정 수정 결과, cnt={}",cnt);
		if(cnt>0) {
			int color=calendarService.insertColor(vo.getSchNo());
			logger.info("색넣기,color={}",color);
		}
		
		return "redirect:/calendar/calendarMain";
	}
	
	@PostMapping("/writeModal")
	public String insertModal(@ModelAttribute CalendarVO vo) {
		logger.info("modal에서 일정등록 vo={}",vo);
		
		int cnt=calendarService.insertModal(vo);
		logger.info("modal에서 일정등록 결과, cnt={}",cnt);
		if(cnt>0) {
			int color=calendarService.insertColor(vo.getSchNo());
			logger.info("색넣기,color={}",color);
		}
		
		return "redirect:/calendar/calendarMain";
	}
	
	@ResponseBody
	@GetMapping("/showCal")
	public List<CalendarVO> showCal() {
		logger.info("일정보여주기");
		
		List<CalendarVO> list = calendarService.selectAll();
		logger.info("일정보여주기 메인list.size()={}",list.size());
		
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
