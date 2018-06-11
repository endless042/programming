Drop table orderhistory PURGE;


CREATE table orderhistory (
onum int primary key,
dnum int references drinks(dnum) on delete cascade,
userid varchar2(30),
regdate Date default sysdate,
temp varchar2(10),
addopt varchar2(10),
milk varchar2(20),
count int,
drinksize varchar2(15),
price int,
state int
);

select * from orderhistory;

create sequence orderhistory_seq
  start with 0
  increment by 1
  MINVALUE 0
  NOMAXVALUE
  NOCYCLE ;