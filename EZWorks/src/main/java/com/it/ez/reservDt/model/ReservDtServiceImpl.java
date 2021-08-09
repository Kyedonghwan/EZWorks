package com.it.ez.reservDt.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReservDtServiceImpl implements ReservDtService{
	private final ReservDtDAO reservDtDao;

	@Override
	public List<ReservDtVO> selectReservDtById(int rvdCate) {
		return reservDtDao.selectReservDtById(rvdCate);
	}

	@Override
	public ReservDtVO showReservDt(int rvdNo) {
		return reservDtDao.showReservDt(rvdNo);
	}
}
