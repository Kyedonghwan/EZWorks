package com.it.ez.archivefolder.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.archivefolder.model.ArchiveFolderService;
import com.it.ez.archivefolder.model.ArchiveFolderVO;

import lombok.RequiredArgsConstructor;

@RequestMapping("/archiveFolder")
@RequiredArgsConstructor
@Controller
public class ArchiveFolderController {
	private final ArchiveFolderService archiveFolderService;
	private final Logger logger = LoggerFactory.getLogger(ArchiveFolderController.class);
	
	@ResponseBody
	@GetMapping("/detailList")
	public List<ArchiveFolderVO> detailList(@RequestParam int no){
		List<ArchiveFolderVO> list = archiveFolderService.selectChildren(no);
		return list;
	}
	
	@ResponseBody
	@PostMapping("/insert")
	public int insert(@ModelAttribute ArchiveFolderVO vo) {
		vo.setEmpNo(1);
		
		int cnt = archiveFolderService.insertArchiveFolder(vo);
		
		return vo.getNo();
	}
	
	@ResponseBody
	@GetMapping("/showParentFolder")
	public ArchiveFolderVO showParentFolder(@RequestParam int no) {
		ArchiveFolderVO vo = archiveFolderService.showParent(no);
		return vo;
	}


}
