package com.it.ez.approvalcomment.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ApprovalCommentVO {
	private int acNo;
	private int empNo;
	private Timestamp acRegdate;
	private String acContent;
	private int approvalNo;
}
