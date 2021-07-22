package com.it.ez.archive.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ArchiveListVO {
	private List<ArchiveVO> multipleFileList;
}
