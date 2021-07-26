package com.it.ez.emp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.dept.model.DeptService;
import com.it.ez.dept.model.DeptVO;
import com.it.ez.emp.model.EmpService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/emp")
public class EmpController {
	
	private final EmpService empService;
	private final DeptService deptService;
	
	@ResponseBody
	@GetMapping("/showOrganization")
	public List<DeptVO> selectOrganization(){
		List<DeptVO> list = deptService.selectDept();
		return list;
	}
	
	@ResponseBody
	@GetMapping("/showOrganization2")
	public List<Map<String,Object>> selectOrganization2(){
		List<Map<String,Object>> list = empService.selectOrganization();
		return list;
	}
}
