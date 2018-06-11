Drop table milk PURGE;

CREATE table milk (
dnum int references drinks(dnum) on delete cascade,
lowfat int,
soymilk int,
lactofree int

);

select * from milk;
