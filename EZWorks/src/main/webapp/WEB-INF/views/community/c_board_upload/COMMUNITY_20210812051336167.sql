--커뮤니티
--drop table community cascade constraint;
CREATE TABLE COMMUNITY(
    COMMUNITY_NO NUMBER NOT NULL UNIQUE,
    COMMUNITY_NAME VARCHAR2(100) NOT NULL,
    MEMBER_COUNT NUMBER DEFAULT 0 NULL,
    INTRO varchar2(200), 
    PUBLICSET varchar2(20) DEFAULT 'Y' NULL,
    REGDATE DATE DEFAULT SYSDATE
);

--drop sequence COMMUNITY_SEQ;
CREATE SEQUENCE COMMUNITY_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

insert into community(community_No, community_Name, intro, REGDATE)
values(community_seq.nextval, 'YOLO EZ', 'EZ yolo들 Come on!!','2021-07-29');
insert into community(community_No, community_Name, intro, REGDATE)
values(community_seq.nextval, '아이디어 공유', '새 프로젝트 아이디어 공유를 위한 창입니다.', '2021-07-28');
insert into community(community_No, community_Name, intro, REGDATE)
values(community_seq.nextval, '맛집 탐방', '회사 근처 맛집 탐방하자!!','2021-07-26');
insert into community(community_No, community_Name, intro, REGDATE)
values(community_seq.nextval, '영업TEAM', '영업팀 친목을 위한 창! :) 모여모여!','2021-07-29');

UPDATE COMMUNITY
SET MEMBER_COUNT=2
WHERE COMMUNITY_NO=1;

--drop table COMMUNITY_MEMBER cascade constraint;
CREATE TABLE COMMUNITY_MEMBER(
    COMMUNITY_NO NUMBER NOT NULL,
    MEMBER_NO NUMBER NOT NULL,--> EMP_NO,
    COMMUNITY_LEVEL NUMBER DEFAULT 1,
    REGDATE DATE DEFAULT SYSDATE,
    CONSTRAINT CK_CHECK_MEMBER check(COMMUNITY_LEVEL>0)
);

/*
1=회원
2=부마스터
3=마스터
*/

insert into COMMUNITY_MEMBER(COMMUNITY_NO,MEMBER_NO,COMMUNITY_LEVEL)
values(1,1,3);
insert into COMMUNITY_MEMBER(COMMUNITY_NO,MEMBER_NO,COMMUNITY_LEVEL)
values(2,2,3);
insert into COMMUNITY_MEMBER(COMMUNITY_NO,MEMBER_NO,COMMUNITY_LEVEL)
values(3,3,3);
insert into COMMUNITY_MEMBER(COMMUNITY_NO,MEMBER_NO,COMMUNITY_LEVEL)
values(4,4,3);
insert into COMMUNITY_MEMBER(COMMUNITY_NO,MEMBER_NO,COMMUNITY_LEVEL)
values(1,3,1);

--커뮤니티 view
CREATE OR REPLACE VIEW COMMUNITYMEMBERVIEW
AS
SELECT c.*, B.MEMBER_NO, B.EMP_IMG, B.EMP_NAME ||' '|| B.POS_NAME as MEMBER_NAME , 
B.COMMUNITY_LEVEL, B.REGDATE AS MEMBER_REGDATE FROM
(
        SELECT L.*, A.EMP_NAME, A.EMP_IMG, A.POS_NAME FROM
        (
            SELECT P.POS_NAME, E.*
            FROM POSITION P RIGHT JOIN EMP E
            ON P.POS_NO = E.POS_NO
        )A RIGHT JOIN COMMUNITY_MEMBER L
        ON L.MEMBER_NO=A.EMP_NO
)B right JOIN COMMUNITY C
ON B.COMMUNITY_NO = C.COMMUNITY_NO
ORDER BY C.COMMUNITY_NO;

--관리자 select sql
SELECT MEMBER_NAME FROM COMMUNITYMEMBERVIEW
WHERE COMMUNITY_LEVEL=3;

--커뮤니티 게시판
--drop table c_board cascade constraint;
CREATE TABLE C_BOARD(
    COMMUNITY_NO NUMBER NOT NULL,
    BOARD_NO NUMBER NOT NULL UNIQUE,
    BOARD_NAME VARCHAR2(200) NOT NULL,
    BOARD_MASTER NUMBER NOT NULL,
    BOARD_TYPE NUMBER DEFAULT 1 NOT NULL, /* 유형 1 클래식, 2 피드*/
    INTRO VARCHAR2(300),
    PUBLICSET VARCHAR2(20) DEFAULT 'Y' NULL
);
--drop sequence c_board_seq;
CREATE SEQUENCE C_BOARD_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

insert into c_board(community_No, board_No, board_Name, board_Master, board_type, intro)
values(1, c_board_seq.nextval, 'Wish list 적고 가세요!', 1, 2,'하고싶은 것 있나요? 예를 들면 맛집탐방, 여행, 영화보기 등등 하고 싶은 취미 적어주시면 함께 해요^^');
insert into c_board(community_No, board_No, board_Name, board_Master, board_type, intro)
values(1, c_board_seq.nextval, '암벽클라이밍 동호회', 2, 1,'토요일마다 암벽클라이밍 수업 같이 들으실 분 환영합니다! ');

--drop sequence c_boardContent_seq;
CREATE SEQUENCE C_BOARDCONTENT_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

--drop table c_boardClassic cascade constraint;
CREATE TABLE C_BOARDCLASSIC(
    COMMUNITY_NO NUMBER NOT NULL,
    CONTENT_NO NUMBER NOT NULL,
    BOARD_NO NUMBER NOT NULL,
    EMP_NO NUMBER NOT NULL,
    EMP_NAME VARCHAR2(50) NOT NULL,
    EMP_IMG VARCHAR2(100),
    POS_NO NUMBER NOT NULL,
    POS_NAME VARCHAR2(50) NOT NULL,
    TITLE VARCHAR2(200) NOT NULL,
    TEXT CLOB NULL,
    REGDATE DATE DEFAULT SYSDATE,
    READCOUNTS NUMBER DEFAULT 0,
    GROUP_NO NUMBER DEFAULT 0,
    FILENAME VARCHAR2(50) NULL,
    FILESIZE NUMBER DEFAULT 0,
    ORIGINALFILENAME VARCHAR2(50) NULL,
    DOWNCOUNTS NUMBER DEFAULT 0
);

--drop table c_boardFeed cascade constraint;
CREATE TABLE C_BOARDFEED(
    COMMUNITY_NO NUMBER NOT NULL,
    CONTENT_NO NUMBER NOT NULL,
    BOARD_NO NUMBER NOT NULL,
    EMP_NO NUMBER NOT NULL,
    EMP_NAME VARCHAR2(50) NOT NULL,
    EMP_IMG VARCHAR2(100),
    POS_NO NUMBER NOT NULL,
    POS_NAME VARCHAR2(50) NOT NULL,
    TEXT CLOB NULL,
    REGDATE DATE DEFAULT SYSDATE,
    REPLYCOUNTS NUMBER DEFAULT 0
);

--classic 내용
insert into c_boardClassic(COMMUNITY_NO, content_No, board_No, EMP_NO, EMP_NAME, EMP_IMG, POS_NO, POS_NAME, title, text, group_No)
values(1, c_boardContent_seq.nextval, 2, 1,'김상후','1.jpg', 1, '대표이사', '암벽등반 일정 조정', '암벽등반 일정을 재조율할 예정입니다. 일시 : 7/30일 오후 5시 관악산 예정!', 1);
insert into c_boardClassic(COMMUNITY_NO, content_No, board_No, EMP_NO, EMP_NAME, EMP_IMG, POS_NO, POS_NAME, title, text, group_No)
values(1, c_boardContent_seq.nextval, 2, 2,'구정모', '2.jpg',2, '사장', '암벽등반 참석 원하시는 분', '암벽등반 일정이 재조율되서, 참석인원 다시 정리합니다~', 2);
insert into c_boardClassic(COMMUNITY_NO, content_No, board_No, EMP_NO, EMP_NAME, EMP_IMG, POS_NO, POS_NAME, title, text, group_No)
values(1, c_boardContent_seq.nextval, 2, 3,'이재오', '3.jpg',3, '전무', '암벽등반 야유회', '야유회 날짜 추천받습니다! :)', 3);

--feed 내용
insert into c_boardFeed(COMMUNITY_NO, content_No, board_No, EMP_NO, EMP_NAME,EMP_IMG, POS_NO, POS_NAME, text)
values(1, c_boardContent_seq.nextval, 1, 1,'김상후', '1.jpg', 1, '대표이사','신촌 맛집 투어 예정! 모두 모여라');
insert into c_boardFeed(COMMUNITY_NO, content_No, board_No, EMP_NO, EMP_NAME,EMP_IMG, POS_NO, POS_NAME, text)
values(1, c_boardContent_seq.nextval, 1, 2,'구정모', '2.jpg', 2, '사장', '지겨운 점심메뉴 선택은 저리가라 룰렛고고!! :)');

--drop table C_BOARDREPLY cascade constraint;
CREATE TABLE C_BOARDREPLY(
    COMMUNITY_NO NUMBER NOT NULL,
    BOARD_NO NUMBER NOT NULL,
    REPLY_NO NUMBER NOT NULL,
    EMP_NO NUMBER NOT NULL,
    GROUP_NO NUMBER NOT NULL,
    TEXT CLOB,
    REGDATE DATE DEFAULT SYSDATE
);

--drop sequence C_REPLY_SEQ;
CREATE SEQUENCE C_REPLY_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

INSERT INTO C_BOARDREPLY(COMMUNITY_NO, BOARD_NO, REPLY_NO, EMP_NO,GROUP_NO, TEXT)
VALUES(1,2,REPLY_SEQ.NEXTVAL,3,17,'신촌 어디로 가면 되나요!? :)');

--댓글 view
create or replace view c_boardReplyView
as
select r.*, b.emp_name, b.emp_img, b.pos_No, b.pos_Name from
(
    select a.emp_No, a.emp_name, a.emp_img, a.pos_No, p.pos_Name from 
    emp a left join position p
    on a.pos_No=p.pos_No

)B right join c_boardReply r
on r.emp_NO=b.emp_NO
order by reply_NO desc;

--게시판 view
CREATE OR REPLACE VIEW C_BOARDCLASSICVIEW
AS
SELECT C.COMMUNITY_NAME, B.BOARD_NAME, D.*
FROM COMMUNITY C, C_BOARD B, C_BOARDCLASSIC D
WHERE C.COMMUNITY_NO(+)=B.COMMUNITY_NO
AND B.BOARD_NO(+)=D.BOARD_NO;

CREATE OR REPLACE VIEW C_BOARDFEEDVIEW
AS
SELECT C.COMMUNITY_NAME, B.BOARD_NAME, D.*
FROM COMMUNITY C, C_BOARD B, C_BOARDFEED D
WHERE C.COMMUNITY_NO(+)=B.COMMUNITY_NO
AND B.BOARD_NO(+)=D.BOARD_NO;

create or replace view empView
as
select e.*, p.pos_Name 
from emp e left join position p
on e.POS_NO = p.POS_NO;  

create or replace view c_BoardView
as
select c.COMMUNITY_NAME, b.* from  
(    
    select b.*, A.Master_Name 
    from
    (
        select e.emp_No, e.emp_Name || ' ' || p.pos_Name as Master_Name
        from emp e left join position p
        on e.POS_NO = p.POS_NO
    )A right join c_board b
    on A.EMP_NO=b.BOARD_MASTER
)B left join community c 
on c.COMMUNITY_NO = b.COMMUNITY_NO
order by board_NO;

select * from user_sequences;

--TABLE
SELECT * FROM COMMUNITY;
SELECT * FROM COMMUNITY_MEMBER;
SELECT * FROM C_BOARD;
SELECT * FROM C_BOARDCLASSIC;
SELECT * FROM C_BOARDFEED;
SELECT * FROM C_BOARDREPLY;
select * from emp;
select * from position;

--VIEW
SELECT * FROM C_BOARDVIEW;
SELECT * FROM C_BOARDCLASSICVIEW;
SELECT * FROM C_BOARDFEEDVIEW;
SELECT * FROM C_BOARDREPLYVIEW;
SELECT * FROM EMPVIEW;
SELECT * FROM COMMUNITYMEMBERVIEW;

COMMIT;