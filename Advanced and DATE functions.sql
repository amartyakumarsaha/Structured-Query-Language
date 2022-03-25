#ref link= https://www.w3schools.com/sql/func_mysql_time_format.asp

use Amartya_DB;
select cast('-1' as signed);
select cast('1' as unsigned);
select cast('22.03.25' as date);
select cast('22.03.25 11:46:50' as datetime) Timestamp;

drop table t1;
create table t1(col1 int);
insert into t1 values(10);
insert into t1 values();
insert into t1 values(15);
insert into t1 values(10);
insert into t1 values(10);
insert into t1 values(20);
insert into t1 values(30);
select count(*) from t1;
select * from t1;

select coalesce(col1,'#') from t1;

#################### ADVANCED FUNCTIONS ########################################
select connection_id(); #returns connection id
select current_user(); #returns current user
select database(); #returns database name
select last_insert_id(); #
select session_user(); #returns session username
select system_user(); #returns system user name
select user(); #returns name of user
select version(); #returns version of mysql
select bin(5); #covert a decimal number into binary

################################# DATE FUNCTIONS ##########################################
select current_date(); #returns current date
select curdate(); #returns current date
select current_time(); #returns current time
select curtime(); #returns current time
select current_timestamp(); #returns data and time YYYY.MM.DD HH:MM:SS
select date(current_timestamp()); #returns the current date
select day(current_timestamp()); #returns day number of the month
select dayname(current_timestamp()); #return day name
select dayofmonth(current_timestamp());
select dayofweek(current_timestamp()); #return day number of week
select dayofyear(current_timestamp()); #returns day number of the year
select time(current_timestamp()); #returns time
select hour(current_timestamp()); #returns hour
select minute(current_timestamp()); #returns minute
select second(current_timestamp()); #returns second 
select week(current_timestamp());  #returns the week number of this date
select weekday(current_timestamp()); #return the day number of week (starts with 0=sunday)
select weekofyear(current_timestamp()); #return week number of the year in which this date lies
select year(current_timestamp()); #returns the year
select month(current_timestamp()); #returns the month 
select monthname(current_timestamp()); #returns month naame
select now();
select quarter(current_timestamp()); #returns the quarter in which the date lies
SELECT DATE_FORMAT(current_date(), "%M %d, %Y"); 