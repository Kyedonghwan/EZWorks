package com.it.ez.schcate.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.schcate.model.SchCateService;
import com.it.ez.schcate.model.SchCateVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SchCateController {
	private static final Logger logger 
		= LoggerFactory.getLogger(SchCateController.class);
	
	private final SchCateService schCateService;

	@ResponseBody
	@GetMapping("/listCategory")
	public List<SchCateVO> listSchCate(){
		
		List<SchCateVO> list = schCateService.showAllCate(1);
		logger.info("sidebar2 list.size()={}",list.size());
		
		return list;
	}
	
	@GetMapping("/calendar/calRegister")
	public void listCate(Model model) {
		List<SchCateVO> list = schCateService.showAllCate(1);
		model.addAttribute("list", list);
	}
	
	@PostMapping("/calendar/cateModal")
	public String insertCate(@ModelAttribute SchCateVO vo) {
		logger.info("내 캘린더 추가 vo={}",vo);
		
		int cnt=schCateService.insertCate(vo);
		logger.info("내 캘린더 추가, cnt={}",cnt);
		
		return "redirect:/calendar/calendarMain";
	}
	
	@ResponseBody
	@RequestMapping("/addColor")
	public void addColor() {
		logger.info("일정 카테고리 색 변경");
		
		int result=schCateService.updateColor(36);
		logger.debug("색 변경 결과, result={}",result);
	}

}
