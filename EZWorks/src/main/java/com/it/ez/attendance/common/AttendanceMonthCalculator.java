package com.it.ez.attendance.common;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Component;

@Component
public class AttendanceMonthCalculator {
	private final int monthdays[] = {31,29,31,30,31,30,31,31,30,31,30,31};
	/*
	 * public calculateMonth(int year, int month) { Calendar calendar =
	 * Calendar.getInstance(Locale.KOREA); calendar.set(year, month-1);
	 * calendar.set(Calendar.DAY_OF_MONTH, month); }
	 */
	/*
	 * public String getFirstDay(int month, int year) { Calendar calendar =
	 * Calendar.getInstance(Locale.KOREA); calendar.set(year, month-1, 1);
	 * calendar.setFirstDayOfWeek(Calendar.MONDAY); int day =
	 * calendar.get(Calendar.DAY_OF_WEEK); if(day==2) { return month+"-1"; }else {
	 * 
	 * } }
	 */
	
	public int getTotalWeeks(int year, int month) {
		Calendar calendar = Calendar.getInstance(Locale.KOREA);
		calendar.set(year, month-1, 1);
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		int day = calendar.get(Calendar.DAY_OF_WEEK);
		int maxday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		int weeks = (int) Math.ceil(((day-1)+maxday)/7.0);
		return weeks;
	}
	
	public int getStartingDay(int year, int month) {
		Calendar calendar = Calendar.getInstance(Locale.KOREA);
		calendar.set(year, month-1, 1);
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		int day = calendar.get(Calendar.DAY_OF_WEEK);
		List<Calendar> calendarList = new ArrayList<>();
	}
}
