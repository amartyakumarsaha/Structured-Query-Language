select distinct CTC from employee order by 1 desc;

select max(distinct CTC) from employee;

----------- 2nd Highest CTC ----------------
select distinct CTC from employee where CTC < (select max(distinct CTC) from employee) limit 1;

############################################## Nth Highest CTC ################################################################

------------------------------------------- METHOD - 1  ----------------------------------------------------------------------
----------- 5th Highest CTC ----------------
select CTC from (select distinct CTC from employee order by 1 desc limit 5) Result order by 1 limit 1;
----------- 4th Highest CTC ----------------
select CTC from (select distinct CTC from employee order by 1 desc limit 4) Result order by 1 limit 1;

------------------------------------------- METHOD - 2  ----------------------------------------------------------------------
----------- 4th Highest CTC ----------------
with Result as
(select CTC, dense_rank() over (order by CTC desc) DRANK from employee)
select distinct CTC from Result where DRANK=4;
----------- 5th Highest CTC ----------------
with Result as
(select CTC, dense_rank() over (order by CTC desc) DRANK from employee)
select distinct CTC from Result where DRANK=5;

------------------------------------------- METHOD - 3  ----------------------------------------------------------------------
----------- 4th Highest CTC ----------------
select distinct CTC from employee  e1 where 4-1 = (select count(distinct CTC) from employee e2 where e2.CTC>e1.CTC);
----------- 5th Highest CTC ----------------
select distinct CTC from employee  e1 where 5-1 = (select count(distinct CTC) from employee e2 where e2.CTC>e1.CTC);