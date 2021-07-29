package com.it.ez.myapprovalline.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.myapprovalline.model.MyApprovalLineService;
import com.it.ez.myapprovalline.model.MyApprovalLineVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/mal")
@RequiredArgsConstructor
public class MyApprovalLineController {
	private final MyApprovalLineService malService;
	
	@ResponseBody
	@PostMapping("/insert")
	public String insertMal(@RequestBody List<MyApprovalLineVO> malList) {
		for(MyApprovalLineVO vo:malList) {
			vo.setEmpNo(1);
		}
		return malService.insertMal(malList);
	}
	
	@ResponseBody
	@GetMapping("/load")
	public List<String> loadMal(){
		return malService.loadMal(1);
	}
	
	@ResponseBody
	@PostMapping("/load2")
	public List<Map<String,Object>> loadMals(@RequestParam String malName){
		MyApprovalLineVO vo = new MyApprovalLineVO();
		vo.setMalName(malName);
		vo.setEmpNo(1);
		return malService.loadMals(vo);
	}
}
