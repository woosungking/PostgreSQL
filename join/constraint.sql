--조인을 하기 전 제약조건 설정

create table department( --부서 테이블
	dept_id integer,
	dept text,
	city text,
	constraint dept_key primary key (dept_id),
	constraint dept_city_unique unique (dept,city)
)
--constraint는 제약조건 설정을 위한 명령어. constraint 000 primary key (컬럼이름)
--"000" 은 제약조건의 이름이고, 이 이름을 통해 관리와 유지보수를 편하게 하기위함임.

-- constraint 000 unique (111, 222)
-- 000또한 제약조건 이름
-- 111, 222는 unique키라고 알려주는 역할, 111만 될 수도 있고, 111, 222 쌍으로 이룰 수 있다.
-- ⭐ unique로 지정된 행의 열에는 중복된 값이 들어오지 못함. 데이터의 중복 방지, ⭐
-- ⭐ 위 처럼 쌍으로 넣었다면 두개 쌍의 조합이 같은 데이터는 들어오지 못한다.

create table employees( --직원 테이블
	emp_id integer,
	first_name text,
	last_name text,
	salary numeric(10,2),
	dept_id integer references department (dept_id)
)
--references는 외래키 제약조건, 

--000 references 111 (222)
-- 000은 컬럼명 인데 참조하는 외래키의 컬럼명과 동일시 하는게 관습
-- 111은 참조하려는 키가있는 테이블이름
-- 222는 참조하려는 컬럼명(제약조건 이름을 넣으면 X)

table employees
table department


insert into department values
    (1, 'Tax', 'Atlanta'),
    (2, 'IT', 'Boston');

insert into employees values
	(1, 'Julia', 'Reyes', 115300, 1),
    (2, 'Janet', 'King', 98000, 1),
    (3, 'Arthur', 'Pappas', 72700, 2),
    (4, 'Michael', 'Taylor', 89500, 2);

insert into department values
    (3, 'Tax', 'Atlanta')
--⭐ unique 제약 조건에 의거 중복된 값을 넣으면 거부가 일어남.

insert into department values
    (3, 'Taax', 'Atlanta')
--⭐ city가 중복이 되었지만 dept가 중복이 안되므로 이건 가능. 쌍이 동일해야 입력이 안됌.


-- 실험1: unique를 쌍이 하닌 하나만 지정 후 중복 유도.
drop table department, employees

create table department( --부서 테이블
	dept_id integer,
	dept text,
	city text,
	constraint dept_key primary key (dept_id),
	constraint city_unique unique (city) -- (dept, city) => (city)
)


insert into department values
    (1, 'Tax', 'Atlanta')

insert into department values
    (2, 'IT', 'Atlanta')

-- city에 중복 데이터가 들어감으로 역시 X


