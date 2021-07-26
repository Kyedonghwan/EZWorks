package com.it.ez.addrbook.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class GroupVO {
	private int groupNo;		// 그룹 primary key
	private String groupName;	// 그룹명
	private int memberNo;		// 작성자 번호
	
	// ?
	private String empNo;
	private String memberName;	// 작성자 명
}
