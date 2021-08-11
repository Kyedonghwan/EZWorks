package com.it.ez.communityBoard.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class C_boardClassicVO {
	private int communityNo;
	private String communityName;
	private int contentNo;
	private int boardNo;
	private String boardName;
	private String boardMaster;
	private int empNo;
	private String empName;
	private String empImg;
	private int posNo;
	private String posName;
    private String title;
    private String text;
    private Timestamp regdate;
    private int readCounts;
    private int currentStats;
    
    // 파일 업로드 추가
    private int groupNo;
    private String images;
    private String fileName;
    private long fileSize;
    private String originalFileName;
    private int downCounts;
}
