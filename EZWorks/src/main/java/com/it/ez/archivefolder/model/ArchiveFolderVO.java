package com.it.ez.archivefolder.model;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Setter
@Getter
@ToString
public class ArchiveFolderVO {
	private int no;
	private int parentNo;
	private String name;
	private int empNo;
	private int step;
	private String hasChild;
	
}
