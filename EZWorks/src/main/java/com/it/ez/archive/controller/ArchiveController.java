 package com.it.ez.archive.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.it.ez.archive.common.ConstUtil;
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
	public String list(Model model) {
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
	
	@RequestMapping("/download")
	public ModelAndView download(@ModelAttribute ArchiveVO vo,HttpServletRequest request) {
		
		int cnt = archiveService.updateDownCount(vo.getNo());
		
		Map<String,Object> map =new HashMap<>();
		
		String uploadPath  =  request.getSession().getServletContext().getRealPath(ConstUtil.FILE_UPLOAD_PATH);
		File file = new File(uploadPath,vo.getFileName());
		map.put("file", file);
		map.put("originalFileName",vo.getOriginalFileName());
		
		ModelAndView mav = new ModelAndView("ArchiveDownloadView",map);
		
		return mav;
		
	}
	
	@RequestMapping("/downloadZip")
	public void CompressZIP(@RequestParam List<ArchiveVO> archiveVoList, HttpServletRequest request, HttpServletResponse response, Object handler) {
		List<String> fileNames= new ArrayList<String>();
		List<String> originalFileNames= new ArrayList<String>();
		
		for(ArchiveVO vo:archiveVoList) {
			fileNames.add(vo.getFileName());
			originalFileNames.add(vo.getOriginalFileName());
		}
		
		Date d= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddssSSS");

		String zipName=sdf.format(d);
		
		response.setContentType("application/zip");
		response.addHeader("Content-Disposition", "attachment;filename=" + zipName);
		
		
		ZipOutputStream zout;
		try {
			zout = new ZipOutputStream(response.getOutputStream());
		
		zout.setLevel(8);
		
		
		String tempPath=request.getSession().getServletContext().getRealPath(ConstUtil.FILE_UPLOAD_PATH);
		
		byte[] buffer = new byte[1024];

		FileInputStream in =null;
		
		for(int i=0;i<fileNames.size();i++) {
			in = new FileInputStream(new File(tempPath,fileNames.get(i))); //압축 대상 파일
			zout.putNextEntry(new ZipEntry(originalFileNames.get(i))); //압축파일에 저장될 파일명
			
			int len;
			while((len = in.read(buffer)) > 0)
			{ zout.write(buffer, 0, len); }//읽은 파일을 ZipOutputStream에 Write 

			zout.closeEntry();
			in.close();
		}
		zout.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
