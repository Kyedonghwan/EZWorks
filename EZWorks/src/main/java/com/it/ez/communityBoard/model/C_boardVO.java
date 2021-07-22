package com.it.ez.communityBoard.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class C_boardVO {
	private int boardNo;
    private String boardName;
    private String boardMaster;
    private String intro;
    private String publicSet;
    private int communityNo;
}
