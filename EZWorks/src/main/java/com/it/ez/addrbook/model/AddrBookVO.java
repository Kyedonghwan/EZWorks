package com.it.ez.addrbook.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddrBookVO extends AddrSearchVO{
		
		private int bookNo;  			// 주소록 번호
		private int fk_emp_no;  		// 주소록을 소유한 사원번호
		private int fk_book_part_no;  	// 주소록 구분번호(어떤 사원의 어떤 주소록인지 구분)
		private String deptName;  		// 부서명
		private String posName;   // 직급명
		private String name;  			// 이름
		private String corp_phone;  	// 회사 전화번호
		private String zipcode;  		// 우편번호
		private String address;  		// 주소
		private String addressDetail;  // 상세주소
		private String hp;  		// 휴대폰
		private String email;  			// 이메일
		private String photo_route;  	// 사진경로
		private String photo_name;  	// 사진명(실제 파일명)
		private String company_name;  	// 회사명
		private String memo;  
}