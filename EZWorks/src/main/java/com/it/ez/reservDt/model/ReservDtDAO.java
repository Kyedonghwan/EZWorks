package com.it.ez.reservDt.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservDtDAO {
	List<ReservDtVO> selectReservDtAll();
	List<ReservDtVO> selectReservDtById(int rvdCate);
	ReservDtVO showReservDt(int rvdNo);
	int updateReservDt(ReservDtVO vo);
}
