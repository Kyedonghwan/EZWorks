package com.it.ez.attendance.common;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.it.ez.attendance.model.AttendanceMainViewVO;

@Component
public class AttendanceMonthCalculator {
	private final int monthdays[] = {31,29,31,30,31,30,31,31,30,31,30,31};
	private static final int newDays[] = {0, 6, 0, 1, 2, 3, 4, 5};
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private static final Logger logger = LoggerFactory.getLogger(AttendanceMonthCalculator.class);
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
	
	/**
	 * 각 달마다 반복되는 주차의 수
	 * @param year
	 * @param month
	 * @return
	 */
	public int getTotalWeeks(int year, int month) {
		Calendar calendar = Calendar.getInstance(Locale.KOREA);
		calendar.set(year, month-1, 1);
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		int day = newDays[calendar.get(Calendar.DAY_OF_WEEK)];
		int maxday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		int weeks = (int) Math.ceil(((day-1)+maxday)/7.0);
		return weeks;
	}
	
	/**
	 * 각 달마다 시작날짜
	 * @param year
	 * @param month
	 * @return
	 */
	public String getStartingyyyyMMdd(int year, int month) {
		Calendar calendar = Calendar.getInstance(Locale.KOREA);
		calendar.set(year, month-1, 1);
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		int day = calendar.get(Calendar.DAY_OF_WEEK);
		calendar.add(Calendar.DATE, -newDays[day]);
		String date = sdf.format(calendar.getTime());
		return date;
	}
	
	/**
	 * 각 달마다 마지막 날짜
	 * @param year
	 * @param month
	 * @return {@link String} date
	 */
	public String getEndingyyyyMMdd(int year, int month) {
		String startingDate = getStartingyyyyMMdd(year, month);
		String splitDate[] = startingDate.split("-");
		int startYear = Integer.parseInt(splitDate[0]);
		int startMonth = Integer.parseInt(splitDate[1]);
		int startDate = Integer.parseInt(splitDate[2]);
		Calendar calendar = Calendar.getInstance(Locale.KOREA);
		calendar.set(startYear, startMonth-1, startDate);
		int totalWeeks = getTotalWeeks(year, month);
		calendar.add(Calendar.DATE, (totalWeeks * 7));
		String date = sdf.format(calendar.getTime());
		return date;
	}
	
	/**
	 * 달마다 모든 날짜의 list. List<Date>은 7일간의 데이터가 담겨있고 List<List<Date>>은 7일간데이터 담긴 list를 주차 수만큼의 list
	 * @param year
	 * @param month
	 * @return 
	 */
	public List<List<Date>> getDaysList(int year, int month){
		logger.info("year={}, month={}", year, month);
		String date = getStartingyyyyMMdd(year, month);
		String splitDate[] = date.split("-");
		int nYear = Integer.parseInt(splitDate[0]);
		logger.info("nYear={}", nYear);
		int nMonth = Integer.parseInt(splitDate[1]);
		logger.info("nMonth={}", nMonth);
		int nDate = Integer.parseInt(splitDate[2]);
		logger.info("nDate={}", nDate);
		Calendar calendar = Calendar.getInstance(Locale.KOREA);
		calendar.set(nYear, nMonth-1, nDate);
		List<List<Date>> monthList = new ArrayList<>();
		Date d = new Date();
		int weeks = getTotalWeeks(year, month);
		for(int i=0;i<weeks;i++) {
			List<Date> weekList = new ArrayList<>();
			for(int j=0;j<7;j++) {
				d= new Date(calendar.getTimeInMillis());
				weekList.add(d);
				calendar.add(Calendar.DATE, 1);
				if(weekList.size()==7) {
					monthList.add(weekList);
				}
			}
		}
		return monthList;
		
	}
	
	/**
	 * 이번주 잔여 시간 계산
	 */
	public String getThisWeektotalHours(Date start, Date end) {
		
		
	}
}
