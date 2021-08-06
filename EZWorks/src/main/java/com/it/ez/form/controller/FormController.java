package com.it.ez.form.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.form.model.FormService;
import com.it.ez.form.model.FormVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/form")
public class FormController {
	private final FormService formService;
	
	@ResponseBody
	@GetMapping("showForm")
	public List<FormVO> showForm() {
		return formService.selectForm();
	}
	
	@ResponseBody
	@GetMapping("showFormFolder")
	public List<String> showFormFolder() {
		return formService.selectFormFolder();
	}
	
	@ResponseBody
	@GetMapping("insertUsedForm")
	public int insertUsedForm(@RequestParam int formNo) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("empNo",1);
		map.put("formNo", formNo);
		return formService.insertUsedForm(map);
	}
	
	@ResponseBody
	@GetMapping("showUsedForm")
	public List<Map<String,Object>> showUsedForm(){
		return formService.showUsedForm(1);
	}
	
	@GetMapping("/3")
	public String form3(Model model,HttpSession session) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String today = sdf.format(d);
		sdf = new SimpleDateFormat("yyyyMMddssSSS");
		String approvalStringNo = sdf.format(d);
		approvalStringNo="EZ그룹 - "+approvalStringNo;
		model.addAttribute("today",today);
		model.addAttribute("approvalStringNo",approvalStringNo);
		model.addAttribute("deptName",(String)session.getAttribute("deptName"));
		model.addAttribute("posName",(String)session.getAttribute("posName"));
		return "approval/form3";
	}
	
	@GetMapping("/20")
	public String form20(Model model,HttpSession session) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String today = sdf.format(d);
		sdf = new SimpleDateFormat("yyyyMMddssSSS");
		String approvalStringNo = sdf.format(d);
		approvalStringNo="EZ그룹 - "+approvalStringNo;
		model.addAttribute("today",today);
		model.addAttribute("approvalStringNo",approvalStringNo);
		model.addAttribute("deptName",(String)session.getAttribute("deptName"));
		model.addAttribute("empName",(String)session.getAttribute("empName"));
		model.addAttribute("posName",(String)session.getAttribute("posName"));
		return "approval/form20";
	}
	
}
