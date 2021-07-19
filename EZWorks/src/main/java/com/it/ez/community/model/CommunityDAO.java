package com.it.ez.community.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommunityDAO {
	
	int insertCommunity(CommunityVO vo);
}
