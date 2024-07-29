create table department( --부서 테이블
	dept_id integer,
	dept text,
	city text,
	constraint dept_key primary key (dept_id),
	constraint dept_city_unique unique (dept,city)
);

create table employees( --직원 테이블
	emp_id integer,
	first_name text,
	last_name text,
	salary numeric(10,2),
	dept_id integer references department (dept_id)
);

insert into department values
    (1, 'Tax', 'Atlanta'),
    (2, 'IT', 'Boston');

insert into employees values
	(1, 'Julia', 'Reyes', 115300, 1),
    (2, 'Janet', 'King', 98000, 1),
    (3, 'Arthur', 'Pappas', 72700, 2),
    (4, 'Michael', 'Taylor', 89500, 2);

-- 일반 조인.

select * from  employees

select * from  employees join department
on employees.dept_id = department.dept_id
