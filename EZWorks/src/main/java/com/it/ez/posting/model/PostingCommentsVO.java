package com.it.ez.posting.model;

import java.sql.Timestamp;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter
@Setter
@ToString
public class PostingCommentsVO {
	private int pCommentsNo;
	private int empNo;
	private int postingNo;
	private String pCommentsContents;
	private Timestamp pCommentsRegdate; 
}
