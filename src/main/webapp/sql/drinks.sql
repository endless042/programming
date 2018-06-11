Drop table drinks purge;

CREATE table drinks (
dnum int primary key,
name varchar2(50) not null,
hot int,
ice int,
small int default 0,
regular int default 0,
large int default 0,
category varchar2(10) not null,
shot int,
whip int,
milk int,
content varchar2(500),
regdate Date default sysdate,
filename varchar2(100),
filesize int
);

select * from drinks;
select nvl(max(dnum),0) from drinks;
create sequence drinks_seq
  start with 0
  increment by 1
  MINVALUE 0
  NOMAXVALUE
  NOCYCLE ;