create database rest;
use rest;
create table user(fname varchar(20), lname varchar(20), uname varchar(20) primary key, pass varchar(20));
select * from user;
delete from user where fname="Pooja";
SET SQL_SAFE_UPDATES=0;
alter table user add primary key(uname);
select * from user;
create table hygiene(uname varchar(20), restaurant varchar(100), food int, water int, sanitation int, personalh int, rodents int, openkitchen int, miscellaneous varchar(50), stamp_updated timestamp default now() on update now());
select * from hygiene;
select miscellaneous from hygiene where uname = 'Jayanthi';
select uname,restaurant from hygiene;
delete from hygiene where restaurant='The Arabian Plate Adambakkam Chennai';
update hygiene set food=2,water=3,sanitation=2,personalh=2,rodents=2,openkitchen=2,miscellaneous='Bad' where uname='pooja' and restaurant='The Arabian Plate Adambakkam Chennai';
select food,water,sanitation,personalh,rodents,openkitchen from hygiene where restaurant='The Arabian Plate Adambakkam Chennai';
drop table hygiene;