package com.it.ez.community.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommunityLevelVO extends CommunityVO {
	private int communityNo;
	private int communityMember;
	private int communityLevel;
	private String empName;
	private String posName;
	private String empImg;
}
