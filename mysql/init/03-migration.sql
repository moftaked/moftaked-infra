create table districts ( district_id int not null auto_increment, district_name varchar(50) not null, primary key(district_id));
alter table persons add district_id int;
alter table persons add foreign key (district_id) references districts(district_id);
insert into districts(district_name) select distinct district from persons;
update persons join districts on persons.district = districts.district_name set persons.district_id = districts.district_id;
alter table persons drop column district;
alter table persons modify district_id int not null;
