package com.it.ez.community.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommunityVO{
	private int communityNo;
    private String communityName;
    private int memberCount;
    private int writingCount;
    private String communityMaster;
    private String intro;
    private String publicSet;
    private Timestamp regdate;
}
