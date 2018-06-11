Drop table cafeuser PURGE;

CREATE table cafeuser (
num int,
userid varchar2(30) primary key,
passwd varchar2(30) not null,
email varchar2(100),
grade int default 1,
regdate Date default sysdate
);

create sequence cafeuser_seq
  start with 0
  increment by 1
  MINVALUE 0
  NOMAXVALUE
  NOCYCLE ;
  

select * from cafeuser;