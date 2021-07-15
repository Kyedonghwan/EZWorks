package com.it.ez.archivefolder.model;

import java.util.List;

public interface ArchiveFolderService {
	public List<ArchiveFolderVO> selectByEmpNo(int empno);
}
