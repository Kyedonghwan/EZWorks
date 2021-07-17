package com.it.ez.message.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MessageVo extends UserVo{
	private String senderemployeeNo;
	private String receiverEmail;
	private String message;
	private String receiverEmployeeNo;
	private String senderEmployeeNo;
	private String messageContent;
	private String writeDate;
	private String sender;
	private String messageId;
	
	
	
	
}
