package com.it.ez.approval.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class ApprovalFileVO {
	private int afNo;
	private String afFilename;
	private String afOriginalfilename;
	private long afFilesize;
	private int approvalNo;
}
