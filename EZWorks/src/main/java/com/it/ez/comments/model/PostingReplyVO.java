package com.it.ez.comments.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PostingReplyVO {
	private int replyNo;
	private int empNo;
	private int postingNo;
	private String replyText;
	private Timestamp replyRegdate;
}
