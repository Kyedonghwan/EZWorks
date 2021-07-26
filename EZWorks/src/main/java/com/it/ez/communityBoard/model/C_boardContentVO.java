package com.it.ez.communityBoard.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class C_boardContentVO {
	private int contentNo;
	private int boardNo;
    private String name;
    private String title;
    private String text;
    private Timestamp regdate;
    private int readCounts;
    
    // 파일 업로드 추가
    private int groupNo;
    private int steps;
    private int sortNo;
    private String images;
    private String fileName;
    private long fileSize;
    private String originalFileName;
    private int downCounts;
}
