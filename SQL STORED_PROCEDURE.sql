create database Amartya_DB;
use Amartya_DB;
show tables;
show procedure status; ---------- Used to show status of a table.
drop table customer;
drop procedure create_table_procedure_order; --------- Used to drop a procedure.
desc customer;
desc product;
desc orders;
-------------------------------------------------------------------------------------------------------
----------------- create table customer 
delimiter //
create procedure create_table_procedure_customer()
begin
create table customer(cid int,cname varchar(15),PhnNo bigint,email varchar(30));
end //
delimiter ;

call create_table_procedure_customer();
------------------------------------------------------------------------------------------------------
----------------- Insert into table customer 
delimiter //
create procedure Insert_into_table_procedure_customer(in c_id int, in c_name varchar(15), in ph_no bigint,email_id varchar(30))
begin
insert into customer(cid,cname,phnNo,email) values (c_id,c_name,ph_no,email_id);
end //
delimiter ;

call Insert_into_table_procedure_customer(1,'Lana',123456987,'lana@outlook.com');
call Insert_into_table_procedure_customer(2,'Jack',35864897,'jack@gmail.com');
call Insert_into_table_procedure_customer(3,'Haile',78985645,'haile@outlook.com');
call Insert_into_table_procedure_customer(4,'Roger',34587465,'roger@outlook.com');
call Insert_into_table_procedure_customer(5,'Luk',77325898,'luk@gmail.com');
call Insert_into_table_procedure_customer(6,'Salena',65423615,'salena@outlook.com');
call Insert_into_table_procedure_customer(7,'Onik',21325849,'onik@gmail.com');
call Insert_into_table_procedure_customer(8,'Kristi',14625878,'kristi@outlook.com');
-------------------------------------------------------------------------------------------------------------------
----------- select rows from customer
delimiter //
create procedure select_rows_procedure_customer()
begin
select * from customer;
end //
delimiter ;

call select_rows_procedure_customer();
-------------------------------------------------------------------------------------------------------
-- =======================================================================================================
-------------------------------------------------------------------------------------------------------
----------------- create table product
delimiter //
create procedure create_table_procedure_product()
begin
create table product(prodid int,prodname varchar(15), price int);
end //
delimiter ;

call create_table_procedure_product();
---------------------------------------------------------------------------------------------------------------
 -- =============================================================================================================
 ----------------- Insert into table product 
delimiter //
create procedure Insert_into_table_procedure_product(in prod_id int, in prod_name varchar(15), in pprice int)
begin
insert into product(prodid,prodname,price) values (prod_id,prod_name,pprice);
end //
delimiter ;

call Insert_into_table_procedure_product(1,'Iphone 11',1010);
call Insert_into_table_procedure_product(2,'Iphone 12',1200);
call Insert_into_table_procedure_product(3,'Iphone 13',1450);
call Insert_into_table_procedure_product(4,'Macbook Air',2500);
call Insert_into_table_procedure_product(5,'Iphone XR',900);
-------------------------------------------------------------------------------------------------------------------
----------- select rows from customer
delimiter //
create procedure select_rows_procedure_product()
begin
select * from product;
end //
delimiter ;

call select_rows_procedure_product();
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
----------------- create table order
delimiter //
create procedure create_table_procedure_order()
begin
create table orders(orderid int,prodid int,cid int);
end //
delimiter ;

call create_table_procedure_order();
--------------------------------------------------------------------------------------------------------------
 -- =============================================================================================================
 ----------------- Insert into table product 
delimiter //
create procedure Insert_into_table_procedure_order(in order_id int, in prod_id int, in c_id int)
begin
insert into orders(orderid,prodid,cid) values (order_id,prod_id,c_id);
end //
delimiter ;

call Insert_into_table_procedure_order(100,1,2);
call Insert_into_table_procedure_order(101,5,1);
call Insert_into_table_procedure_order(102,3,4);
call Insert_into_table_procedure_order(103,1,5);
call Insert_into_table_procedure_order(104,4,7);
call Insert_into_table_procedure_order(105,2,8);
call Insert_into_table_procedure_order(106,1,8);
call Insert_into_table_procedure_order(107,4,4);
call Insert_into_table_procedure_order(108,5,1);
call Insert_into_table_procedure_order(109,3,2);
call Insert_into_table_procedure_order(110,2,3);
call Insert_into_table_procedure_order(111,1,1);
call Insert_into_table_procedure_order(112,2,6);
call Insert_into_table_procedure_order(113,1,6);
call Insert_into_table_procedure_order(114,1,5);
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
----------- select rows from customer
delimiter //
create procedure select_rows_procedure_order()
begin
select * from orders;
end //
delimiter ;

call select_rows_procedure_order();
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
delimiter //
create procedure add_pk_fk_table_procedure()
begin
alter table customer add constraint pk_customer primary key (cid);
alter table product add constraint pk_product primary key (prodid); 
alter table orders add constraint pk_order primary key (orderid);
alter table orders add constraint fk_customerorders foreign key (cid) references customer(cid);
alter table orders add constraint fk_productorders foreign key (prodid) references product(prodid);
end //
delimiter ;

call add_pk_fk_table_procedure();

