/* 회원 테이블 */

create table MEMBERS(
    MEMBER_ID number(6,0) constraint MEMBERS_PK primary key,
    EMAIL varchar2(30) constraint EMAIL_UK unique constraint EMAIL_NN not null,
    PASSWORD varchar2(30) constraint PASSWORD_NN not null,
    NICKNAME varchar2(20) constraint NICKNAME_UK unique constraint NICKNAME_NN not null,
    PROFILE_PIC varchar2(30),
    GENDER varchar2(10) constraint GENDER_CK check(GENDER in ('male','female')),
    AGE number(3,0),
    CONTACT varchar2(30),
    ADDRESS varchar2(50),
    GAME_TYPE varchar2(10) constraint GAME_TYPE_CK check(GAME_TYPE in ('field','screen')),
    SCORE_FIELD number(3,0),
    SCORE_SCREEN number(3,0),
    RATINGS_CNT number(6,0) default 0,
    RATINGS_TOTAL number(7,0) default 0
);

/* 그룹 테이블 */

create table GROUPS(
	GROUP_ID number(6,0) constraint GROUPS_PK primary key,
	GAME_ID number(6,0) constraint GAME_ID_FK foreign key(GAME_ID) references GAMES(GAME_ID) on delete cascade,
	MEMBER_ID number(6,0) constraint MEMBER_ID_FK foreign key(MEMBER_ID) references MEMBERS(MEMBER_ID) on delete cascade
);

/* 게임 정보 테이블 */

create table GAMES(
	GAME_ID number(6,0) constraint GAMES_PK primary key,
	GAME_NAME varchar2(50) constraint GAME_NAME_NN not null,
	GAME_TYPE varchar2(10) constraint GAME_TYPE_CK check(GAME_TYPE in ('field','screen')),
	LOCATION_ID number(6,0) constraint LOCATION_ID_NN not null,
	GAME_FEE number(6,0),
	GAME_DATE date constraint GAME_DATE_NN not null,
	GAME_LENGTH varchar2(10) constraint GAME_LENGTH_CK check(GAME_LENGTH in ('9 holes','18 holes'),
	TOTAL_MEMBER number(1,0) constraint TOTAL_MEMBER_NN not null constraint TOTAL_MEMBER_CK check(TOTAL_MEMBER between 1 and 4)
);

/* 메세지 테이블 */

create table MESSAGES(
	MESSAGE_ID number(6,0) constraint MESSAGE_PK primary key,
	SENDER_ID number(6,0) constraint SENDER_ID_NN not null, 
	constraint SENDER_ID_FK foreign key(SENDER_ID) references MEMBERS(MEMBER_ID) on delete cascade,
	RECEIVER_ID number(6,0) constraint RECEIVER_ID_NN not null,  
	constraint RECEIVER_ID_FK foreign key(RECEIVER_ID) references MEMBERS(MEMBER_ID) on delete cascade,
	MESSAGE varchar2(300) constraint MESSAGE_NN not null,
	MESSAFGE_DATE date
);

/* 팔로우 테이블 */

create table FOLLOW(
	FOLLOW_ID number(6,0) constraint FOLLOW_PK primary key,
	FOLLOWER_ID number(6,0) constraint FOLLOWER_ID_NN not null, 
	constraint FOLLOWER_ID_FK foreign key(FOLLOWER_ID) references MEMBERS(MEMBER_ID) on delete cascade,
	FOLLOWING_ID number(6,0) constraint FOLLOWING_ID_NN not null, 
	constraint FOLLOWING_ID_FK foreign key(FOLLOWING_ID) references MEMBERS(MEMBER_ID) on delete cascade
);

/* 필드 테이블 */

create table FIELD(
	FIELD_ID number(6,0) constraint FIELD_PK primary key,
	NAME varchar2(50) constraint FIELD_NAME_NN not null,
	MEMBERSHIP varchar(10) constraint MEMBERSHIP_NN not null constraint MEMBERSHIP_CK check(MEMBERSHIP in ('yes','no')),
	HOLE number(2,0) constraint HOLE_NN not null,
	ADDRESS varchar2(50) constraint FIELD_ADDRESS_NN not null constraint FIELD_ADDRESS_UK unique,
	TEL varchar2(20),
	CADDYFEE number(6,0)
	CARTFEE number(6,0)
	WEEKFEE number(6,0) constraint WEEKFEE_NN not null,
	WEEKENDFEE number(6,0) constraint WEEKENDFEE_NN not null,
	SITELINK varchar2(30)
);

/* 스크린 테이블 */

create table SCREEN(
	SCREEN_ID number(6,0) constraint SCREEN_PK primary key,
	NAME varchar2(50) constraint SCREEN_NAME_NN not null,
	ADDRESS varchar2(50) constraint SCREEN_ADDRESS_NN not null,
	TEL varchar2(20),
	COMPANY varchar2(30)
);

/* 시퀀스 */

create sequence MEMBERS_SEQ
increment by 1
start with 1
minvalue 1
maxvalue 999999;

create sequence GROUPS_SEQ
increment by 1
start with 1
minvalue 1
maxvalue 999999;

create sequence GAMES_SEQ
increment by 1
start with 1
minvalue 1
maxvalue 999999;

create sequence FOLLOW_SEQ
increment by 1
start with 1
minvalue 1
maxvalue 999999;

create sequence MESSAGES_SEQ
increment by 1
start with 1
minvalue 1
maxvalue 999999;