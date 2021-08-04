package com.it.ez.archive.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadUtil {
	public List<Map<String, Object>> fileUpload(HttpServletRequest request,String select) throws IllegalStateException, IOException{
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<MultipartFile> mfList = multiRequest.getFiles("file");
		
		
		for(MultipartFile mf:mfList) {
			System.out.println(mfList.size());
			if(!mf.isEmpty()) {
				System.out.println(mfList.size());
				long fileSize=mf.getSize();
				String originalFileName = mf.getOriginalFilename();
				int idx=originalFileName.lastIndexOf(".");
				String ext=originalFileName.substring(idx+1);
				String fileName = getUniqueFileName(originalFileName);
				String uploadPath="";
				if(select.equals("archive"))
					uploadPath=request.getSession().getServletContext().getRealPath(ConstUtil.FILE_UPLOAD_PATH);
				//또는 String uploadPath=ConstUtil.FILE_UPLOAD_PATH_TEST;
				else if(select.equals("approvalFile"))
					uploadPath=request.getSession().getServletContext().getRealPath(ConstUtil.FILE_UPLOAD_PATH_APPROVALFILE);
				
				System.out.println(uploadPath);
				File file = new File(uploadPath,fileName);
				mf.transferTo(file);
				
				Map<String,Object> map = new HashMap<>();
				map.put("fileName",fileName);
				map.put("fileSize",fileSize);
				map.put("originalFileName",originalFileName);
				map.put("ext",ext);
				
				list.add(map);
			}
		}
		return list;
	}
	
	
	public String getUniqueFileName(String originalFileName) {
		int idx=originalFileName.lastIndexOf(".");
		String fName=originalFileName.substring(0,idx);
		String ext=originalFileName.substring(idx);
		String result = fName+"_"+getTimeStamp()+ext;
		return result;
	}
	
	public String getTimeStamp() {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String str=sdf.format(d);
		
		return str;
	}
	
	
}
