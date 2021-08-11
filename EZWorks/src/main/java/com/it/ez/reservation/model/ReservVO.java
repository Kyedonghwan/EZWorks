package com.it.ez.reservation.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservVO {
	private int rvNo;
	private String rvName;
	private String rvDesc;
	
	private String fileName;
    private long fileSize; 
    private int downCount;
    private String originalFileName;
}
