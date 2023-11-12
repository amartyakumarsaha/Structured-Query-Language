/*
IN SQL IF A NULL VALUE IS PRESENT IN BOTH THE TABLES THEN IT INDICATES TWO DIFFERENT VALUES.
NULL IN TABLE_1 AND NULL IN TABLE_2 IS NOT SAME THEY ARE DIFFERENT
*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------
create or replace table t1 (col int);
create or replace table t2 (col int);

insert into t1 values(1),(1),(2);
insert into t2 values(1),(1),(1),(3);

select * from t1;
select * from t2;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

select * from t1 
inner join t2 
on t1.col = t2.col;

select * from t1 
left join t2 
on t1.col = t2.col;

select * from t1 
right join t2 
on t1.col = t2.col;

select * from t1 
full outer join t2 
on t1.col = t2.col;


-------------------------------------------------------------------------------------------------------------------------------------------------------------

insert into t1 values(2);
insert into t2 values(2);

select * from t1;
select * from t2;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

select * from t1 
inner join t2
on t1.col = t2.col;

select * from t1 
left join t2
on t1.col = t2.col;

select * from t1 
right join t2
on t1.col = t2.col;

select * from t1 
full outer join t2
on t1.col = t2.col;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into t1 values (4);
insert into t2 values (2);

select * from t1;
select * from t2;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

select * from t1 
inner join t2
on t1.col = t2.col;

select * from t1 
left join t2
on t1.col = t2.col;

select * from t1 
right join t2
on t1.col = t2.col;

select * from t1 
full outer join t2
on t1.col = t2.col;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

insert into t1 values (null);
insert into t2 values (null);

select * from t1;
select * from t2;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

select * from t1 
inner join t2
on t1.col = t2.col;

select * from t1 
left join t2
on t1.col = t2.col;

select * from t1 
right join t2
on t1.col = t2.col;

select * from t1 
full outer join t2
on t1.col = t2.col;
