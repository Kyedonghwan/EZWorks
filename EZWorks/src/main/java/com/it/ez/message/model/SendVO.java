package com.it.ez.message.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SendVO {
	private int no;
	private String name;
	private String content;
	private Timestamp regdate;
}
