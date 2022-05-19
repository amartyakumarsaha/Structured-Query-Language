
###############################################################################
################## Types of Partitions ####################################
######## 1) Hash 2)Range 3)List 4)Key
############### Important Links #############################################
### https://www.w3resource.com/mysql/mysql-partition.php
### https://www.youtube.com/watch?v=iUjoPB27-iA
###############################################################################

use amartya_db;
create table PlayerInfo(name varchar(50),country varchar(15),c_code char(3));

insert into PlayerInfo values 
('Virat Kohli','India', 'IND'),
('Sakib Al Hasan','Bangladesh','BNG'),
('Rohit Sharma','India', 'IND'),
('Babar Azam','Pakistan','PAK'),
('Steve Smith','Austrailia','AUS'),
('Mashrafe Mortaza','Bangladesh','BNG'),
('David Warner','Austrailia','AUS'),
('Kane Williamson','New Zealand','NZ'),
('Mohammad Rizwan','Pakistan','PAK'),
('Trent Boult','New Zealand','NZ');

select * from PlayerInfo;

explain select * from PlayerInfo where c_code='AUS';

alter table PlayerInfo partition by list columns(c_code)(
partition p0 values in ('IND'),
partition p1 values in ('AUS'),
partition p2 values in ('PAK'),
partition p3 values in ('NZ'),
partition p4 values in ('BNG'));

SELECT PARTITION_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME='PlayerInfo';

select * from PlayerInfo where c_code='AUS';

explain select * from PlayerInfo where c_code='AUS';

create table student(roll_no int,name varchar(30),class int,section char(1),ph_no bigint);
insert into student values(1,'Ramesh sharma',6,'A',9801231578),
(27,'Mrinal Rastogi',9,'B',7123451892),
(64,'Krutika Sharma',7,'A',7604852147),
(13,'Rahul Varma',4,'C',6789457895),
(55,'Satya Jha',7,'A',9432587946),
(48,'Zeshan Alam',6,'C',7878451272),
(36,'Manjeet Kaur',10,'B',8465984785),
(8,'Sunidhi Chuhan',4,'C',7165478892);

select  * from student;

select * from student where class=6;

alter table student partition by hash(class) partitions 10;
SELECT PARTITION_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME='student';

select * from student where class=6;

explain select * from student where class=6;



