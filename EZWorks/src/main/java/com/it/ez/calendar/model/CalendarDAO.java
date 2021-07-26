package com.it.ez.calendar.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CalendarDAO {
	public List<CalendarVO> selectAll();
	int insertSch(CalendarVO vo);
	int insertModal(CalendarVO vo);
	int insertColor();
	int updateCal(CalendarVO vo);
	CalendarVO selectBySchNo(int schNo);
	int delCal(int schNo);
}
