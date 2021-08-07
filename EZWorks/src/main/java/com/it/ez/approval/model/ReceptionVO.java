package com.it.ez.approval.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ReceptionVO {
	private int receptionNo;
	private int empNo;
	private int approvalNo;
	private String isRecepted;
}
