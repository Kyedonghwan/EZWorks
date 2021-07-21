package com.it.ez.archivefolder.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.ez.archive.model.ArchiveDAO;
import com.it.ez.archive.model.ArchiveVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ArchiveFolderServiceImpl implements ArchiveFolderService{

	private final ArchiveFolderDAO dao;
	private final ArchiveDAO archiveDao;
	
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

	@Override
	@Transactional
	public int deleteArchiveFolder(List<String> checkArray,List<Integer> delArray,int parentNo) {
		int cnt=0;
		for(int i=0;i<delArray.size();i++) {
			if(checkArray.get(i).equals("archive")) {
				cnt=archiveDao.deleteArchive(delArray.get(i));
			}else {
				cnt=dao.deleteArchiveFolder(delArray.get(i));
				int count=dao.selectChildrenCount(parentNo);
				if(count==0)
					cnt=dao.updateParent2(parentNo);
			}
		}
		return cnt;
	}

	@Override
	public int editArchiveFolder(ArchiveFolderVO vo) {
		return dao.editArchiveFolder(vo);
	}


	
}
