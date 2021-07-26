package com.it.ez.community.common;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/community")
public interface CommunityConstUtil {
	//페이징 처리 관련 상수
	int BLOCK_SIZE=10;  //블럭 크기
	int RECORD_COUNT=20; //한 페이지에 보여줄 레코드 개수
	
	//파일 업로드 처리 관련 상수
	String FILE_UPLOAD_TYPE="c_board";
	//String FILE_UPLOAD_TYPE="deploy";
	
	//커뮤니티 게시판 파일 저장 경로
	String C_BOARD_FILE_UPLOAD_PATH="c_board_upload";
	String C_BOARD_FILE_UPLOAD_PATH_TEST="G:\\아이티윌 자바 120기\\lecture\\4) Project\\210705_3차 프로젝트\\git\\EZWorks\\EZWorks\\src\\main\\webapp\\WEB-INF\\views\\community\\c_board_upload";
	
	//커뮤니티 댓글 파일 저장 경로
	String C_COMMENT_FILE_UPLOAD_PATH="c_board_upload";
	String C_COMMENT_FILE_UPLOAD_PATH_TEST="G:\\아이티윌 자바 120기\\lecture\\4) Project\\210705_3차 프로젝트\\git\\EZWorks\\EZWorks\\src\\main\\webapp\\WEB-INF\\views\\community\\c_board_upload";
	
	//커뮤니티 게시판 이미지 저장 경로
	String C_BOARD_IMAGE_FILE_UPLOAD_PATH="c_board_image";
	String C_BOARD_IMAGE_FILE_UPLOAD_PATH_TEST="G:\\아이티윌 자바 120기\\lecture\\4) Project\\210705_3차 프로젝트\\git\\EZWorks\\EZWorks\\src\\main\\webapp\\WEB-INF\\views\\community\\c_board_image";
	
	//파일 업로드인지, 이미지 업로드인지 구분값
	int UPLOAD_FILE_FLAG=1; //파일 업로드
	int UPLOAD_IMAGE_FLAG=2; //이미지 업로드
		
}
