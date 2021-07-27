package com.it.ez.community.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommunityVO {
	private int communityNo;
    private String communityName;
    private int communityCount;
    private String intro;
    private String publicSet;
}
