package com.it.ez.archive.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class ArchiveVO {
	private int no;
	private String fileName;
	private long fileSize;
	private int downCount;
	private int folderNo;
	private Timestamp regdate;
	private String originalFileName;
	private String ext;
}
