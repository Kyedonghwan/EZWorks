package com.it.ez.archive.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ArchiveDAO {
	int fileUpload(ArchiveVO vo);
}
