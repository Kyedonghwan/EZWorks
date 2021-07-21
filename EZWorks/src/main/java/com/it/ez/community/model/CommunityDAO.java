package com.it.ez.community.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.ez.communityBoard.model.C_boardContentVO;
import com.it.ez.communityBoard.model.C_boardVO;

@Mapper
public interface CommunityDAO {
	int insertCommunity(CommunityVO vo);
	List<CommunityVO> selectCommunity();
	CommunityVO selectCommunityByNo(int communityNo);
} 
