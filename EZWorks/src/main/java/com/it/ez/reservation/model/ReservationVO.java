package com.it.ez.reservation.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationVO {
	private int no;
    private String startDate;
    private String endDate;
    private String startTime;
    private String endTime;
    private String subscriber;
    private String purpose;
    private String cateNo;
}
