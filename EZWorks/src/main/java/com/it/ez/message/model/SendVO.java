package com.it.ez.message.model;

import java.sql.Timestamp;

import lombok.ToString;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
@ToString
public class SendVO {
	private int no;
	private String name;
	private String content;
	private Timestamp regdate;
}
