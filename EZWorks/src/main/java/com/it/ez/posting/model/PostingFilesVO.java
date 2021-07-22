package com.it.ez.posting.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PostingFilesVO {
	private int postingNo;
	private String pfPath;
	private long pfFileSize;
	private String pfFileName;
	private String pfOFileName;
}
