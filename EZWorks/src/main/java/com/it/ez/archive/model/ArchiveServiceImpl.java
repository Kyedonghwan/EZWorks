package com.it.ez.archive.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ArchiveServiceImpl implements ArchiveService{
	private final ArchiveDAO dao;

	@Override
	public int fileUpload(ArchiveVO vo) {
		return dao.fileUpload(vo);
	}

	@Override
	public List<ArchiveVO> detailList(int folderNo) {
		return dao.detailList(folderNo);
	}
	
	
}
