package com.it.ez.community.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommunityMemberVO extends CommunityVO{
	private int communityNo;
	private int MemberNo;
	private int communityLevel;
	private Timestamp memberRegdate;
	
	//db에서 가져오는 가입 멤버용
	private String empImg;
	private String memberName;
	private int currentStats;
}
