package com.it.ez.archive.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.ez.approval.model.BrowseVO;
import com.it.ez.approval.model.ReceptionVO;
import com.it.ez.approval.model.ReferenceVO;

@Mapper
public interface ArchiveDAO {
	int fileUpload(ArchiveVO vo);
	List<ArchiveVO> detailList(int folderNo);
	int deleteArchive(int no);
	int updateDownCount(int no);
	ArchiveVO selectArchive(int no);
	int moveArchive(Map<String,Object> map);
}
