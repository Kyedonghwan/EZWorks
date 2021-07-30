package com.it.ez.communityBoard.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class C_boardFeedVO {
	private int communityNo;
	private String communityName;
	private int contentNo;
	private int boardNo;
	private String boardName;
	private int EmpNo;
	private String EmpName;
	private String EmpImg;
	private int PosNO;
	private String PosName;
    private String title;
    private String text;
    private Timestamp regdate;
    private int readCounts;
}
