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
	private int empNo;
	private String empName;
	private String empImg;
	private int posNo;
	private String posName;
    private String text;
    private Timestamp regdate;
    private int replyCounts;
}
