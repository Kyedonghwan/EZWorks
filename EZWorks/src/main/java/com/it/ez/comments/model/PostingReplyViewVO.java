package com.it.ez.comments.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PostingReplyViewVO {
	private int replyNo;
	private int empNo;
	private int postingNo;
	private String replyText;
	private Timestamp replyRegdate;
	private int posNo;
	private String empName;
	private String empImg;
	private String posName;
	
	private int initTotalCount;
	private String brandnewdate;
}
