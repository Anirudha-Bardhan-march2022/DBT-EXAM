-- 1-
create table DEPT
(
DEPTNO  int(2),
DNAME   varchar(15),
LOC     varchar(10)
);

insert into DEPT(DEPTNO, DNAME, LOC) values
(10, 'ACCOUNTING', 'NEW YORK'), 
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

select * from DEPT;

-- 2-
create table EMP
(
EMPNO      int(4),
ENAME      varchar(10),
JOB        varchar(9),
HIREDATE   date,
SAL        float(7,2),
COMM       float(7,2),
DEPTNO     int(2)
);

insert into EMP(empno, ename, job, hiredate, sal, comm, deptno) values
(7839, 'KING', 'MANAGER', '1991-11-17', 5000, NULL, 10),
(7698, 'BLAKE', 'CLERK', '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', '1981-06-09', 2450, NULL, 10),
(7566, 'JONES', 'CLERK', '1981-04-02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', '1981-09-28', 1250, 1400, 30),
(7499,	'ALLEN', 'SALESMAN', '1981-02-20', 1600, 300, 30);

select * from EMP;

-- 3-
select * from EMP 
where sal between 2500 and 5000;

-- 4 -
select ename from emp
order by 1 desc;

-- 5-
select lower(job) "Job" from emp;

-- 6 -
select ename, length(ename)"Length of enames" from emp;

-- 7-
select ename, count(deptno) from emp where DEPTNO = any (select deptno from emp);

-- 8-
select dname, ename from emp, dept
where dept.deptno = emp.deptno;

-- 9-
select ename, instr(ename, 'AR')"AR pos in enames" from emp;

-- 10-
Select ename, sal*0.2"HRA" from emp;

-- section II-
-- 1-
create table TEMPP
(
Str1  varchar(24),
Str2  varchar(23)
);
drop table tempp;
delimiter //
create procedure PROC1(a varchar(23), b varchar(24))
begin
   if instr(b, a) = 0 then
			select 'Given Str is not exist';
			insert into tempp values('Given Str is not exist', a);
   else
			select 'Given Str is exist';
            insert into tempp values('Given Str is exist', a);
   end if;
   
end;//
delimiter ;
call proc1('DAC', 'CDAC');
select * from TEMPP;
truncate table TEMPP;
drop procedure proc1;
    

