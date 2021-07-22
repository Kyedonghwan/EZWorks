package com.it.ez.posting.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PostingVO {
	private int postingNo; /* 게시글번호 */
	private int boardNo; /* 게시판번호 */
	private String postingTitle; /* 게시글제목 */
	private String postingContent; /* 내용 */
	private int postingIsPublic;/* 공개설정 */
	private int postingIsNotice; /* 공지로등록 */
	private int postingIsTemp;/* 임시여부 */
	private int postingLikes; /* 좋아요 */
	private Timestamp postingRegdate; /* 등록일 */
}
