package com.it.ez.community.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component("downloadView")
//컴퍼넌트 상속/ 빈 자동 생성, 지정 이름은 "downloadView"
public class CommunityDownloadView extends AbstractView {
	private static final Logger logger 
		= LoggerFactory.getLogger(CommunityDownloadView.class);

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		File file = (File) model.get("file");
		String originalFileName = (String) model.get("originalFileName");
		String fileName=file.getName();
		
		logger.info("파일명:{}, 변경전 파일명:{}", file);

		if(file==null ||  !file.exists() || !file.canRead()) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('파일이 존재하지 않거나 손상되었습니다.');");
			out.print("history.back();");
			out.print("</script>");
			
			return;
		}
		
		response.setContentType("application/octet-stream");
		
		originalFileName 
			= new String(originalFileName.getBytes("euc-kr"), "8859_1");
		response.setHeader("Content-disposition", "attachment; filename="
				+originalFileName); //사용자가 다운받을 시 보이는 원본 파일명(한글 인코딩 포함)
		
		OutputStream os=response.getOutputStream(); //파일 내려보내는것
		FileInputStream fis=null;
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, os);
		}finally {
			if(fis!=null)fis.close();
		}
	}

}
