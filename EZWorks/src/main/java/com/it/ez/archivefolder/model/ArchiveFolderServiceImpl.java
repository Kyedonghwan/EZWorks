package com.it.ez.archivefolder.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ArchiveFolderServiceImpl implements ArchiveFolderService{

	private final ArchiveFolderDAO dao;
	
	@Override
	public List<ArchiveFolderVO> selectByEmpNo(int empno) {
		return dao.selectByEmpNo(empno);
	}

}
