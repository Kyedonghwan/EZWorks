package com.it.ez.position.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PositionServiceImpl implements PositionService{
	private final PositionDAO positionDao;

	@Override
	public String selectByPosNo(int posNo) {
		return positionDao.selectByPosNo(posNo);
	}
	
	
}
