

CREATE TABLE ROOM ( 
roomNumber		    number		primary key,   
roomName		varchar2(20)    not null
);

create sequence room_seq
increment by 1
start with 1
nocache;