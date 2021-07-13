package com.it.ez.archive.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.ez.archivefolder.model.ArchiveFolderService;
import com.it.ez.archivefolder.model.ArchiveFolderVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/archive")
public class ArchiveController {
	
	private final ArchiveFolderService archiveFolderService;
	
	@RequestMapping("/list")
	public String list(@RequestParam(defaultValue = "0") int empNo,Model model) {
		if(empNo==0) {
			model.addAttribute("msg","유효하지않은 접근입니다.");
			model.addAttribute("url","/");
			return "common/message";
		}
		
		List<ArchiveFolderVO> archiveFolderList = archiveFolderService.selectByEmpNo(1);
		model.addAttribute("archiveFolderList",archiveFolderList);		
		return "archive/list";
	}
}
