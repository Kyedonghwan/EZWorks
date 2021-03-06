CREATE TABLE EMP (
   EMP_NO NUMBER NOT NULL, /* 사원번호 */
   EMP_NAME VARCHAR2(50) NOT NULL, /* 사원이름 */
   EMP_ENAME VARCHAR2(50) NOT NULL, /* 사원영어이름 */
   EMP_PWD VARCHAR2(100) NOT NULL, /* 비밀번호 */
   EMP_TEL VARCHAR2(50) NOT NULL, /* 전화번호 */
   EMP_SSN VARCHAR2(50) NOT NULL, /* 주민번호 */
   EMP_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
   EMP_ZIPCODE VARCHAR2(50) NOT NULL, /* 우편번호 */
   EMP_ADDR VARCHAR2(200) NOT NULL, /* 주소 */
   EMP_ADDR2 VARCHAR2(200) NOT NULL, /* 상세주소 */
   EMP_HIREDATE TIMESTAMP NOT NULL, /* 입사일 */
   EMP_OUTDATE TIMESTAMP, /* 퇴사일 */
   EMP_IMG VARCHAR2(100), /* 사원사진 */
   DEPT_NO NUMBER NOT NULL, /* 부서코드 */
   POS_NO NUMBER NOT NULL /* 직급번호 */
);

CREATE UNIQUE INDEX PK_EMP
   ON EMP (
      EMP_NO ASC
   );

ALTER TABLE EMP
   ADD
      CONSTRAINT PK_EMP
      PRIMARY KEY (
         EMP_NO
      );

alter table emp
add constraint fk_emp_dept
foreign key(dept_no)
references dept(dept_no);

alter table emp
add constraint fk_emp_position
foreign key(pos_no)
references position(pos_no);

INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_IMG, EMP_HIREDATE, DEPT_NO, POS_NO)
values(1,'김상후','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','1.jpg','20/10/01', 101, 1);
INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_IMG, EMP_HIREDATE, DEPT_NO, POS_NO)
values(2,'구정모','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','2.jpg','20/10/01',101, 2);
INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2,EMP_IMG, EMP_HIREDATE, DEPT_NO, POS_NO)
values(3,'이재오','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','3.jpg','20/10/01',101, 3);

INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_IMG, EMP_HIREDATE, DEPT_NO, POS_NO)
values(4,'마장웅','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','4.jpg','20/10/01', 201, 4);
INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_IMG,EMP_HIREDATE, DEPT_NO, POS_NO)
values(5,'허각','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','5.jpg','20/10/01',201, 5);
INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_IMG,EMP_HIREDATE, DEPT_NO, POS_NO)
values(6,'김다우','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','6.jpg','20/10/01', 201, 6);
INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_IMG,EMP_HIREDATE, DEPT_NO, POS_NO)
values(7,'김지연','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','7.jpg','20/10/01', 301, 7);
INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_IMG,EMP_HIREDATE, DEPT_NO, POS_NO)
values(8,'김윤경','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','8.jpg','20/10/01',301, 8);
INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_IMG,EMP_HIREDATE, DEPT_NO, POS_NO)
values(9,'백운봉','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','1.jpg','20/10/01',301, 10);
INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_IMG,EMP_HIREDATE, DEPT_NO, POS_NO)
values(10,'권재혁','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','2.jpg','20/10/01', 302, 7);
INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_IMG,EMP_HIREDATE, DEPT_NO, POS_NO)
values(11,'이민호','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','3.jpg','20/10/01', 302, 8);
INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_IMG,EMP_HIREDATE, DEPT_NO, POS_NO)
values(12,'조아라','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','4.jpg','20/10/01', 302, 10);

INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_HIREDATE, DEPT_NO, POS_NO)
values(13,'한성준','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','20/10/01', 202, 4);
INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_HIREDATE, DEPT_NO, POS_NO)
values(14,'유수연','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','20/10/01', 202, 5);
INSERT INTO EMP(EMP_NO, EMP_NAME, EMP_ENAME, EMP_PWD, EMP_TEL, EMP_SSN, EMP_EMAIL, EMP_ZIPCODE, EMP_ADDR, EMP_ADDR2, EMP_HIREDATE, DEPT_NO, POS_NO)
values(15,'전병헌','KIMDEMO',1,'010-1111-2222','900101-2234567','KIMDEMO@DODEMO.COM',05555,'주소1','주소2','20/10/01', 202, 6);

      