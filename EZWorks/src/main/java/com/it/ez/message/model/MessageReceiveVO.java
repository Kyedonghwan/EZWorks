package com.it.ez.message.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MessageReceiveVO {
	private int messageNo; 
	private String messageTitle; 
	private String messageContent; 
	private Timestamp messageRegdate; 
}
