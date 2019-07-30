drop table member;
drop table sale;
drop table fileup;
drop table charge_opt;
drop table charge;
drop table download;
drop table req_board;
drop table room;
drop table text;
delete from FILEUP
select * from freeboard;
select * from emp;
create table member (
  mem_id varchar2(20) primary key, mem_passwd varchar2(20) not null,
  mem_name varchar2(20) not null, mem_email varchar2(20) not null,
  mem_tel varchar2(20) not null, mem_addr varchar2(20) not null,
  mem_birth varchar2(20) not null, mem_reg_date date not null,
  mem_update_date date not null, mem_point number(10) not null,
  mem_del varchar2(5) not null, mem_vip varchar2(5) default 'n',
  mem_vip_app varchar2(5) default 'n',
  room_num number(2) references room(room_num)
);


create table fileup (
  file_num number(10) primary key, file_name varchar2(500) not null,
  category varchar2(20) not null, mem_id varchar2(20) references member (mem_id),
  file_desc varchar2(100), file_shot varchar2(50), file_upload varchar2(50),
  file_size number(10) not null, 
  file_point number(10) not null, file_date date not null,
  file_del varchar2(5) not null,
  file_down number(10) default '0'
);

create table download (
  down_num number(15) primary key, file_num number(10) not null references fileup(file_num),
  down_date date not null, down_id varchar2(20) not null references member(mem_id)
);

create table charge_opt (charge_option number(2) not null primary key,
  charge_point number(10) not null,
  charge_money number(10) not null
);
insert into charge_opt values(1,4000,5000);
insert into charge_opt values(2,10000,10000);
insert into charge_opt values(3,25000,20000);
insert into charge_opt values(4,80000,50000);
insert into charge_opt values(5,200000,100000);

create table charge (charge_num number(15) not null primary key,
  mem_id varchar2(20) not null references member(mem_id),
  charge_date date not null,
  charge_option number(2) not null references charge_opt(charge_option),
  charge_account varchar2(20)
);

create table req_board(
  board_num number(10) not null primary key,
  mem_id varchar2(20) not null,
  board_subject varchar2(50) not null,
  board_content varchar2(500) not null,
  board_readcount number(10) not null,
  board_ref number(10) null,
  board_re_step number(10) not null,
  board_re_level number(10) not null,
  board_re_date date not null,
  board_del varchar2(5) not null,
  category varchar2(20) not null
);
create table manager(
  managerid varchar2(10) ,
  managerpasswd varchar2(10)
);


create table room(
  room_num number(2) default '0' primary key,
  room_subject varchar2(50),
  room_people number(3),
  room_mem_id varchar2(20),
  people_count number(1)
);
create table text(
  text_room_num number(2),
  texts varchar2(30),
  text_mem_id varchar(20),
  text_date date
);
create table FreeBoard (
num number primary key, -- key
mem_id varchar2(20) not null,
subject varchar2(50) not null, -- 제목
content varchar2(500) not null, -- 본문
readcount number default 0, -- 읽은 횟수
ref number not null, -- 답변글끼리 그룹
re_step number not null, -- ref내의 순서
re_level number not null, -- 들여쓰기
ip varchar2(20) not null, -- 작성자 ip
reg_date date not null, -- 작성일
del char(1)
);

create table repBoard (
rno number primary key,
bno number not null references FreeBoard(num),
replytext varchar2(500) not null,
replyer varchar2(50) not null,
regdate date not null,
updatedate date not null,
del char(1)
);

  text_room_num number(2) references room(room_num),
  text_mem_id varchar(20) references member(mem_id)
  room_mem_id varchar2(20) references member(mem_id),
  alter table room add (room_mem_id varchar2(20));
  alter table text add (text_mem_id varchar2(20));
  alter table text add (text_room_num varchar2(20));
alter table room drop(mem_id);
alter table text drop(text_room_num);
alter table text drop(mem_id);
		insert into room values (#{room_num},#{room_subject},#{room_people},#{room_mem_id},0)

insert into room values(8,'반갑습니다',4,'형이야',1);
insert into room values(9,'채팅하실분',5,'삼촌이야',3);
insert into room values(10,'자는중',2,'길동이',2);
insert into room values(11,'어서오세요',4,'둘리',1);
insert into room values(12,'초과정원시 입장불가',3,'자신이 있던 방은 입장가능',1);
insert into room values(13,'중복방 입장시',4,'방장님',4);
insert into room values(14,'알림과 함께',5,'채팅',3);
insert into room values(15,'자동적으로 원래방으로 이동됩니다',2,'중복입장은 불가능',1);
insert into manager values('master','1');

select * from member;
select * from fileup;
select * from charge_opt;
select * from charge;
select * from download;
select * from req_board;
select * from manager;
select * from room;
select * from text;

DELETE FROM 테이블명 WHERE 필드명 = '조건'
delete from text;
delete from member where mem_id = 'qwe'
alter table member add (room_num number(2) references room(room_num));이거아님
alter table room add (mem_id varchar2(20) references member(mem_id));
alter table member add (room_num number(2)  default 0);
alter table text add (room_num number(2) references room(room_num));
alter table member add (mem_vip_app varchar2(5) default 'n');
alter table member drop (room_num);
alter table download rename column mem_id to down_id;
alter table fileup add (file_down number(10) default '0')
update room set people_count=people_count+1 where room_num=2 
update fileup set file_upload = '이미지파일.jpg' where file_name like '%왕좌의 게임%'
commit;


desc room;
