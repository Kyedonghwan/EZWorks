package com.it.ez.communityBoard.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class C_boardReplyVO {
	private int communityNo;
	private int boardNo;
	private int replyNo;
	private int empNo;
	private String empName;
	private String empImg;
	private int posNo;
	private String posName;
	private int groupNo;
	private String text;
	private Timestamp regdate;
	
}
