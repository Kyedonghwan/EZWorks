package com.it.ez.reservDt.model;

import java.util.List;

public interface ReservDtService {
	List<ReservDtVO> selectReservDtAll();
	List<ReservDtVO> selectReservDtById(int rvdCate);
	ReservDtVO showReservDt(int rvdNo);
	int updateReservDt(ReservDtVO vo);
}
