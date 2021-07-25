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

create sequence send_seq
increment by 1
start with 1
nocache;

select * from send;

commit;

