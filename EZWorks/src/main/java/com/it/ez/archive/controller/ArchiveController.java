 package com.it.ez.archive.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.archive.common.FileUploadUtil;
import com.it.ez.archive.model.ArchiveService;
import com.it.ez.archive.model.ArchiveVO;
import com.it.ez.archivefolder.model.ArchiveFolderService;
import com.it.ez.archivefolder.model.ArchiveFolderVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/archive")
public class ArchiveController {
	
	private final ArchiveFolderService archiveFolderService;
	private final ArchiveService archiveService;
	private final FileUploadUtil fileUploadUtil;
	
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
	
	@ResponseBody
	@RequestMapping("/upload")
	public List<ArchiveVO> upload(HttpServletRequest request,@RequestParam int folderNo, Model model) {

		
		String fileName="";
		long fileSize=0;
		String originalFileName="";
		String ext="";
		
		List<ArchiveVO> archiveList = new ArrayList<ArchiveVO>();
		try {
			List<Map<String,Object>> list = fileUploadUtil.fileUpload(request);
			
			for(Map<String,Object>map:list) {
				
				fileName=(String)map.get("fileName");
				fileSize=(long)map.get("fileSize");
				originalFileName=(String)map.get("originalFileName");
				ext=(String)map.get("ext");
				ArchiveVO vo = new ArchiveVO();
				vo.setFolderNo(folderNo);
				vo.setWriter("김길동");
				vo.setFileName(fileName);
				vo.setOriginalFileName(originalFileName);
				vo.setFileSize(fileSize);
				vo.setExt(ext);
				System.out.println(vo);
				archiveList.add(vo);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int cnt = archiveService.fileUpload(archiveList);
		
		return archiveList;
	}
	
	@ResponseBody
	@RequestMapping("/detailList")
	public List<ArchiveVO> detailList(@RequestParam int folderNo){
		
		List<ArchiveVO> list = archiveService.detailList(folderNo);
		return list;
	}
}
