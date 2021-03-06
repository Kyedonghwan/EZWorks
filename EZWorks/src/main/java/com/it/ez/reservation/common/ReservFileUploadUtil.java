package com.it.ez.reservation.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.it.ez.community.common.CommunityConstUtil;

@Component
public class ReservFileUploadUtil {
	private static final Logger logger
	=LoggerFactory.getLogger(ReservFileUploadUtil.class);

	public List<Map<String, Object>> fileUpload(HttpServletRequest request,
		int pathFlag) throws IllegalStateException, IOException {
	MultipartHttpServletRequest multiRequest 
		= (MultipartHttpServletRequest)request;
	
	//결과를 저장할 list
	List<Map<String, Object>> list = new ArrayList<>();
	List<MultipartFile> filepondList = multiRequest.getFiles("filepond");
	System.out.println("filepondList.size="+filepondList.size());
	
	if(filepondList!=null && !filepondList.isEmpty()) {
		for(MultipartFile mf : filepondList) {
			String originFileName =mf.getOriginalFilename();
			System.out.println("오리지날 파일 네임="+originFileName);
			
			//변경된 파일 이름
			String fileName=getUniqueFileName(originFileName);
			long fileSize=mf.getSize();
			
			//업로드 경로
			String uploadPath = getUploadPath(request, pathFlag);
			
			//업로드 처리하기 - 업로드 경로에 업로드 파일 저장
			File file = new File(uploadPath, fileName);
			mf.transferTo(file);
			
			Map<String, Object> map = new HashMap<>();
			map.put("fileName", fileName);
			map.put("fileSize", fileSize);
			map.put("originalFileName", originFileName);
			
			list.add(map);
		}
	}
	
	return list;
}

public String getUploadPath(HttpServletRequest request, int pathFlag) { 
	//매개변수로 application, config 들어갈 수 없다, session으로 실제 경로 구하기!
	
	String path="";
	if(CommunityConstUtil.FILE_UPLOAD_TYPE.equals("c_board")) {
		if(pathFlag==CommunityConstUtil.UPLOAD_FILE_FLAG) {
			path = request.getSession().getServletContext().getRealPath(CommunityConstUtil.C_BOARD_FILE_UPLOAD_PATH);				
		}else if(pathFlag==CommunityConstUtil.UPLOAD_IMAGE_FLAG) {
			path = request.getSession().getServletContext().getRealPath(CommunityConstUtil.C_BOARD_IMAGE_FILE_UPLOAD_PATH);
		}
	}else { //deploy
		if(pathFlag==CommunityConstUtil.UPLOAD_FILE_FLAG) {
			path = request.getSession().getServletContext().getRealPath(CommunityConstUtil.C_BOARD_FILE_UPLOAD_PATH);				
		}else if(pathFlag==CommunityConstUtil.UPLOAD_IMAGE_FLAG) {
			path = request.getSession().getServletContext().getRealPath(CommunityConstUtil.C_BOARD_IMAGE_FILE_UPLOAD_PATH);			
		}
		
		//실제 물리적인 경로 구하기
		path = request.getSession().getServletContext().getRealPath(path);
	}
	
	logger.info("업로드 경로 : {}", path);
	
	return path;
}

public String getUniqueFileName(String fileName) {
	//업로드한 파일명이 중복될 경우 파일명 변경하기 (현재시간(밀리초까지)추가
	//ab.txt => ab_20210630155820123.txt
	String result="";
	if(fileName!=null && !fileName.isEmpty()) {		
		//순수파일명만 구하기
		int idx = fileName.lastIndexOf(".");
		String fName=fileName.substring(0, idx); //ab
		
		//확장자 구하기
		String ext = fileName.substring(idx); //.txt
		
		result = fName + "_" + getTimeStamp() + ext;
		logger.info("변경된 파일명 : {}", result);
		
	}
	return result;
}

public String getTimeStamp() {
	Date d= new Date();
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
	String str=sdf.format(d);
	
	return str;
}

}
