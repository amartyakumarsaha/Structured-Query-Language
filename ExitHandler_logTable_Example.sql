use Amartya_DB;

###################################################################################################
##					DESCRIPTION	ABOUT THIS WORKS                         ##
###################################################################################################
##       Table 1= 'employee'									 ##
##       Table 2= 'logs'								         ##
##       proedure 1= 'insert_into_employee'                                                      ##
##       procedure 2= 'log_procedure'                                                            ##
##       PURPOSE = Every time 'insert_into_employee' is called the status of that                ##
##				call status will be stored into logs table. An exit handler is   ##
##				declared to avoid duplicate data insertion in 'employee' table.  ##
##												 ##
###################################################################################################


create table employee(emp_id int primary key,name char(20),role varchar(20),joining_date datetime);
desc employee;

create table logs(action varchar(100),time datetime,status varchar(30));
desc logs;

################# log procedure insert ##############################
delimiter //
create procedure log_procedure(in msg char(100),in action_time datetime,in state int)
begin
	declare flag varchar(20);
	if(state=1) then
		set flag='Success';
	else
		set flag='Fail';
	end if;
    insert into logs(action,time,status) values(msg,action_time,flag);    
end //
delimiter ;


######### Procedure to insert data in employee table #############
delimiter //
create procedure insert_into_employee(in empid int,in name char(20),in position varchar(20),in join_date datetime)
begin
	declare lmsg varchar(100);
    declare status int default 1;
	declare exit handler for sqlexception
    begin
		set status=0;
        set lmsg ="Insertion into Employee table";
		select "DUPLICATE VALUE" as mesage;
        call log_procedure(lmsg,current_timestamp(),status);
    end;
    insert into employee(emp_id,name,role,joining_date) values(empid,name,position,join_date);
    set lmsg ="Insertion into Employee table";
    set status=1;
	call log_procedure(lmsg,current_timestamp(),status);
end //
delimiter ;



call insert_into_employee(11176,'Suraj Singh','SDE','2012-08-29 09:00:00');
call insert_into_employee(11258,'Atul Rana','PM','2019-02-10 12:02:12');




/*show tables;
select count(*) from employee;
drop table employee;
drop table logs;
select * from logs;
select * from employee;
drop procedure log_procedure;
drop procedure insert_into_employee;*/
