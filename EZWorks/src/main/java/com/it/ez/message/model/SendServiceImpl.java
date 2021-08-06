package com.it.ez.message.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.it.ez.message.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SendServiceImpl implements SendService{
	private final SendDAO sendDao;

	@Override
	public int insertMessage(SendVO vo) {
		return sendDao.insertMessage(vo);
	}

	@Override
	public List<MessageVO> selectAll(SearchVO searchVo) {
		return sendDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sendDao.selectTotalRecord(searchVo);
	}

	@Override
	public SendVO selectByNo(int no) {
		return sendDao.selectByNo(no);
	}
	

	@Override
	public int updateMessage(SendVO vo) {
		return sendDao.updateMessage(vo);
	}

	
	
}	
