--drop table message;
--drop SEQUENCE message_seq;

CREATE TABLE message ( 
no		    number		primary key,   
name		varchar2(20)    not null, 
pwd			varchar2(20)    not null, 
content		varchar2(4000)	null, 		
regdate		date		default  sysdate 
);

create sequence message_seq
increment by 1
start with 1
nocache;

select * from message;

CREATE TABLE send ( 
no		    number		primary key,   
name		varchar2(20)    not null, 
content		varchar2(4000)	null, 		
regdate		date		default  sysdate 
);

drop table send;
drop sequence send_seq;


create sequence send_seq
increment by 1
start with 1
nocache;

create sequence schedule_seq
increment by 1
start with 1
nocache;

insert into send(no, name, content, regdate)
values(send_seq.nextval, '김길수' , '테스트용 답변입니다','2021-07-26');

select * from send;

commit;

