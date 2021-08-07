package com.it.ez.archive.model;

import java.util.List;
import java.util.Map;

public interface ArchiveService {
	int fileUpload(List<ArchiveVO> archiveList);
	List<ArchiveVO> detailList(int folderNo);
	int deleteArchive(int no);
	int updateDownCount(int no);
	ArchiveVO selectArchive(int no);
	int moveArchive(Map<String,Object> map);
	
}
