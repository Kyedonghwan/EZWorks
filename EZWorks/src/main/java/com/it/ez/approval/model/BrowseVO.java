package com.it.ez.approval.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BrowseVO {
	private int browseNo;
	private int empNo;
	private int approvalNo;
}
