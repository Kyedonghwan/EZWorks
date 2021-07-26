package com.it.ez.schcate.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		logger.info("list.size()={}",list.size());
		
		return list;
	}
	
	@GetMapping("/calendar/calRegister")
	public String listCate(Model model) {
		List<SchCateVO> list = schCateService.showAllCate(1);
		model.addAttribute("list", list);
		
		return "calendar/calRegister";
	}
	
	@GetMapping("/calendar/writeModal")
	public String listModal(Model model) {
		List<SchCateVO> list = schCateService.showAllCate(1);
		model.addAttribute("list", list);
		
		return "calendar/writeModal";
	}
}
