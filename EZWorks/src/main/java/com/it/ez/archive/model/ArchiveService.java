package com.it.ez.archive.model;

import java.util.List;

public interface ArchiveService {
	int fileUpload(ArchiveVO vo);
	List<ArchiveVO> detailList(int folderNo);
}
