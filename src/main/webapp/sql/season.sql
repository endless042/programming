Drop table season PURGE;

CREATE table season (
dnum int references drinks(dnum),
sdate Date not null,
edate Date
);

select * from season;