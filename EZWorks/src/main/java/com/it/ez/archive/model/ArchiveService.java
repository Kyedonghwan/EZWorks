package com.it.ez.archive.model;

import java.util.List;

public interface ArchiveService {
	int fileUpload(List<ArchiveVO> archiveList);
	List<ArchiveVO> detailList(int folderNo);
	int deleteArchive(int no);
	int updateDownCount(int no);
}
