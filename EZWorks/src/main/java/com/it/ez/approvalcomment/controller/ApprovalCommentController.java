package com.it.ez.approvalcomment.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.approvalcomment.model.ApprovalCommentService;
import com.it.ez.approvalcomment.model.ApprovalCommentVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/approvalComment")
@RequiredArgsConstructor
public class ApprovalCommentController {
	private final ApprovalCommentService service;
	
	@ResponseBody
	@PostMapping("/write")
	public int write(@ModelAttribute ApprovalCommentVO vo) {
		vo.setEmpNo(1);
		return service.insertAC(vo);
	}
	
	@ResponseBody
	@GetMapping("/showAll")
	public List<Map<String,Object>> showAll(@RequestParam int approvalNo){
		return service.showAll(approvalNo);
	}
}
