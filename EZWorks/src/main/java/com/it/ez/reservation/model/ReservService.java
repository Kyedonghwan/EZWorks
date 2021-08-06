package com.it.ez.reservation.model;

import java.util.List;

import com.it.ez.reservDt.model.ReservDtVO;

public interface ReservService {
	ReservVO selectResrvById(int rvNo);
	int insertReserv(ReservationVO vo);
	List<ReservDtVO> showReservCate(int rvdCate);
	List<ReservationVO> showReservList(String cateNo);
}
