select * from MEMBER2;


create table board (
	num number primary key, -- key
	writer varchar2(20) not null, -- 작성자
	subject varchar2(50) not null, -- 제목
	content varchar2(500) not null, -- 본문
	email varchar2(30) , -- 이메일
	readcount number default 0, -- 읽은 횟수
	passwd varchar2(12) not null, -- 암호
	ref number not null, -- 답변글끼리 그룹
	re_step number not null, -- ref내의 순서
	re_level number not null, -- 들여쓰기
	ip varchar2(20) not null, -- 작성자 ip
	reg_date date not null -- 작성일
);
select * from board_1;


create table board33 (
	num number primary key, -- key
	writer varchar2(20) not null, -- 작성자
	subject varchar2(50) not null, -- 제목
	content varchar2(500) not null, -- 본문
	email varchar2(30) , -- 이메일
	phote blob, -- 사진
	reg_date date not null -- 작성일
);

create table board_1 (
bo_num number primary key,    -- 번호
bo_writer varchar2(12) not null,  -- 작성자
bo_password varchar2(12) not null,   -- 암호
bo_brand varchar2(50) not null,  -- 상품명/제목
bo_price varchar2(30) not null,  -- 가격
bo_capacity varchar2(20) not null,  -- 용량
bo_place varchar2(30) not null,   -- 구매장소
bo_grade varchar2(20) not null,  -- 평점
bo_pros varchar2(500) not null,  -- 장점
bo_cons varchar2(500) not null,  -- 단점
bo_reco varchar2(500) not null,  -- 추천
bo_image varchar2(30) default 'nothing.jpg',   -- 사진
bo_readcount number default 0,    -- 조회수
bo_likecount number default 0 ,   -- 좋아요수
reg_date date not null -- 작성일
);



select * from BOARD_1;
drop table board;
select * from manager;

create table board (
	num number primary key, -- key
	writer varchar2(20) not null, -- 작성자
	subject varchar2(50) not null, -- 제목
	content varchar2(500) not null, -- 본문
	email varchar2(30) , -- 이메일
	readcount number default 0, -- 읽은 횟수
	passwd varchar2(12) not null, -- 암호
	ref number not null, -- 답변글끼리 그룹
	re_step number not null, -- ref내의 순서
	re_level number not null, -- 들여쓰기
	ip varchar2(20) not null, -- 작성자 ip
	reg_date date not null, -- 작성일
	del_yn char(1) default 'n',
	image varchar2(30) default 'nothing.jpg'
);

create table sale (
	s_num number primary key,  -- key
	s_brand varchar2(50) not null, -- 브랜드명
	s_salename varchar2(50) not null, -- 세일명
	s_store varchar2(20) not null, -- 세일매장
	s_term varchar2(30) not null, -- 세일기간
	s_image varchar2(30) default 'nothing.jpg'-- 사진
);

create sequence sale_seq start with 1 
	increment by 1 nocycle nocache;

select * from sale;

create table board (
	num number primary key, -- key
	writer varchar2(20) not null, -- 작성자
	subject varchar2(50) not null, -- 제목
	content varchar2(500) not null, -- 본문
	email varchar2(30), -- 이메일
	readcount number default 0, -- 읽은 횟수
	passwd varchar2(12) not null, -- 암호
	ref number not null, -- 답변글끼리 그룹
	re_step number not null, -- ref내의 순서
	re_level number not null, -- 들여쓰기
	ip varchar2(20) not null, -- 작성자 ip
	reg_date date not null, -- 작성일
	del_yn char(1) default 'n',
	image varchar2(30) default 'nothing.jpg'
);

alter table sale add(s_link varchar2(100));