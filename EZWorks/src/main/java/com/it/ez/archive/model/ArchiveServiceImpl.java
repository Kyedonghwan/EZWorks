package com.it.ez.archive.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ArchiveServiceImpl implements ArchiveService{
	private final ArchiveDAO dao;

	

	@Override
	public List<ArchiveVO> detailList(int folderNo) {
		return dao.detailList(folderNo);
	}


	@Transactional
	@Override
	public int fileUpload(List<ArchiveVO> archiveList) {
		int cnt=0;
		for(ArchiveVO vo:archiveList) {
			cnt = dao.fileUpload(vo);
		}
		return cnt;
	}


	@Override
	public int deleteArchive(int no) {
		return dao.deleteArchive(no);
	}


	@Override
	public int updateDownCount(int no) {
		return dao.updateDownCount(no);
	}
	
	
}
