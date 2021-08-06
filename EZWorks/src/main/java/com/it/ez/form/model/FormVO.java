package com.it.ez.form.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class FormVO {
	private int formNo;
	private String formName;
	private int formTypeNo;
	private int formLife;
	private String formSecu;
	private String formFolder;
}
