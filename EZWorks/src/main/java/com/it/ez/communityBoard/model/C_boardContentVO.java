package com.it.ez.communityBoard.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class C_boardContentVO {
	private int no;
    private String writer;
    private String title;
    private String content;
    private Timestamp regdate;
    private int readCount;
    
    // 파일 업로드 추가
    private int groupNo;
    private int step;
    private int sortNo;
    private String img;
    private String fileName;
    private int fileSize;
    private String originalFileName;
    private int downCount;
}
