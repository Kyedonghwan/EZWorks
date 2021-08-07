package com.it.ez.position.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PositionDAO {
	public String selectByPosNo(int posNo);
}
