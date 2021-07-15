package com.it.ez.archivefolder.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ArchiveFolderDAO {
	public List<ArchiveFolderVO> selectByEmpNo(int empno);
}
