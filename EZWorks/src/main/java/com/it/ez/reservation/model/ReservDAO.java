package com.it.ez.reservation.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.ez.reservDt.model.ReservDtVO;

@Mapper
public interface ReservDAO {
	ReservVO selectResrvById(int rvNo);
	int insertReserv(ReservationVO vo);
	List<ReservDtVO> showReservCate(int rvdCate);
	List<ReservationVO> showReservList();
	List<reservViewVO> selectResrvAll();
	int deleteResev(int no);
	ReservationVO selectReservationById(int no);
	reservViewVO selectResrvViewById(int no);
	int updateReservation(ReservationVO vo);
	int updateReserv(ReservVO vo);
}
