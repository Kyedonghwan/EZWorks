package com.it.ez.board.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private int boardNo;
	private String boardType; //"전사게시판", "부서게시판" => "enterprise", "department"
	private String boardName; 
	private String boardDescription;
	private String boardShowType; //"classic", "feed"
	private int boardIsShare;
	private int boardIsPrivate;
	private int boardIsAnonymous;
	private int boardUseHeader;
	private int boardUseMail;
	private int boardTitleShow;
	private int replyAllowed;
	private int boardGroupNo;
	private int boardIsFolder;
	private int boardIsLine;
	private int deptNo;
}
