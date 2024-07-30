create table district_2020 (
	id integer constraint id_key_2020 primary key,
	school_2020 text
);

create table district_2035(
	id integer constraint id_key_2035 primary key,
	school_2035 text
);

INSERT INTO district_2020 VALUES
    (1, 'Oak Street School'),
    (2, 'Roosevelt High School'),
    (5, 'Dover Middle School'),
    (6, 'Webutuck High School');

INSERT INTO district_2035 VALUES
    (1, 'Oak Street School'),
    (2, 'Roosevelt High School'),
    (3, 'Morrison Elementary'),
    (4, 'Chase Magnet Academy'),
    (6, 'Webutuck High School');


table district_2035

-- 일반 조인

select * from district_2020 join district_2035
on district_2020.id = district_2035.id
order by district_2020.id

-- join on 하는 과정에서 두 테이블의 열 이름이 같다면 using을 사용해서 간략하게 작업 가능

select * from district_2020 join district_2035
using(id) -- on 대신 using 사용
order by district_2020.id

-- left join

select * from district_2020 left join district_2035
using(id)
order by district_2020.id

-- 중간정리 : left join은 왼쪽 테이블 값을 일단 다 보여줌. + 오른쪽 테이블의 값은 일반 조인처럼 using()에 중복되는 값또한 보여줌.
--			일반 조인은 두 테이블간 중복되는 데이터만 보여주었음.

-- right join

select * from district_2020 right join district_2035
using(id)
order by district_2020.id

-- left 조인과 마찬가지지만 오른쪽 테이블의 데이터를 다 보여주고, 왼쪽테이블은 겹치는 데이터만 보여줌