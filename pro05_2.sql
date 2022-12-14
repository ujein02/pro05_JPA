-- 데이터베이스 생성
create database shop;
commit;

-- 데이터베이스 선택
use shop;

create table board(bno int primary key auto_increment, title varchar(200) not null,
	content varchar(1000) not null, author varchar(20) not null, resDate datetime default now()
    );
    
desc board;

insert into board(title, content, author) values ("테스트 제목 1", "테스트1 내용입니다.", "admin");
insert into board(title, content, author) values ("테스트 제목 2", "테스트2 내용입니다.", "admin");

create table sample(id varchar(100) not null, pw varchar(1000) not null);

insert into sample(id, pw) values("test", "1234");

select * from sample;

create table member(id varchar(200) primary key, email varchar(200) not null,
	password varchar(500) not null, createdDate varchar(100) , modifiedDate varchar(100)
    );
    
insert into memeber(id, email, password) values("admin","email@email.com","1234");

commit;
select * from sample;

select * from board;

create table board(
	id bigint not null auto_increment comment 'PK',
    title varchar(100) not null comment '제목',
    content text not null comment '내용',
    writer varchar(20) not null comment '작성자',
    hits int not null comment '조회수',
    delete_yn enum('Y','N') not null comment '삭제 여부',
    created_date datetime not null comment '생성일',
    modified_date datetime comment '수정일',
    primary key (id)
) comment '게시판';

drop table board;

drop table member;


desc board;

commit;

create table member (
    id bigint not null auto_increment comment 'PK',
    email varchar(50) not null comment '이메일',
    password varchar(300) not null comment '비밀번호',
    role enum('ROLE_MEMBER', 'ROLE_ADMIN') not null comment '등급',
    created_date datetime default now() comment '가입일',
    modified_date datetime default now() comment '수정일',
    primary key (id)
) comment '회원';

select * from member;

update member set role="ROLE_ADMIN" where id=3;
commit;

delete from member where id=2;