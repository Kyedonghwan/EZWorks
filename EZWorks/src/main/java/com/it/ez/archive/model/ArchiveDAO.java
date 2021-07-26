package com.it.ez.archive.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ArchiveDAO {
	int fileUpload(ArchiveVO vo);
	List<ArchiveVO> detailList(int folderNo);
	int deleteArchive(int no);
	int updateDownCount(int no);
	ArchiveVO selectArchive(int no);
	int moveArchive(Map<String,Object> map);
}
