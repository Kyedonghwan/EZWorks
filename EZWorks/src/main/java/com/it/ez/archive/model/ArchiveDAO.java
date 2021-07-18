package com.it.ez.archive.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ArchiveDAO {
	int fileUpload(ArchiveVO vo);
	List<ArchiveVO> detailList(int folderNo);
}
