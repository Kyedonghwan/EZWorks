package com.it.ez.todo.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class TodoVO {

	private String todo_no;		// 할일번호
	private String fk_emp_no;	// 사원번호
	private String subject;		// 제목
	private String content;		// 내용
	private String bookmark;	// 즐겨찾기
	
	///////////////////////////////////////////////////////
	
	public TodoVO() {	}

	///////////////////////////////////////////////////////
	
	
	
	
	
}