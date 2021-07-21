package com.it.ez.archivefolder.model;

import java.util.List;

import com.it.ez.archive.model.ArchiveVO;

public interface ArchiveFolderService {
	public List<ArchiveFolderVO> selectByEmpNo(int empno);
	public List<ArchiveFolderVO> selectChildren(int no);
	public int insertArchiveFolder(ArchiveFolderVO vo);
	ArchiveFolderVO showParent(int no);
	int deleteArchiveFolder(List<String> checkArray,List<Integer> delArray,int parentNo);
	int editArchiveFolder(ArchiveFolderVO vo);
}
