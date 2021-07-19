package com.it.ez.archivefolder.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.ez.archive.model.ArchiveVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ArchiveFolderServiceImpl implements ArchiveFolderService{

	private final ArchiveFolderDAO dao;
	
	@Override
	public List<ArchiveFolderVO> selectByEmpNo(int empno) {
		return dao.selectByEmpNo(empno);
	}

	@Override
	public List<ArchiveFolderVO> selectChildren(int no) {
		return dao.selectChildren(no);
	}

	@Override
	@Transactional
	public int insertArchiveFolder(ArchiveFolderVO vo) {
		int cnt=dao.insertArchiveFolder(vo);
		cnt=dao.updateParent(vo.getParentNo());
		return cnt;
	}

	@Override
	public ArchiveFolderVO showParent(int no) {
		return dao.showParent(no);
	}


	
}
