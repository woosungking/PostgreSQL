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


-- join 에서 특정열을 선택할때 그냥 열 이름만 지정하면 X, => "테이블명.열이름" 

select id from district_2020 left join district_2035
using(id)

select district_2020.id, district_2020.school_2020, district_2035.school_2035
from district_2020 left join district_2035
using(id)
order by district_2020.id

-- 기존 두개 테이블 조인 => 여러개의 테이블 조인하기 + as문을 써서 별칭으로 쿼리 할 예정이니 헷갈리지 말기

CREATE TABLE district_2020_enrollment ( -- 학생 정원 수 테이블
    id integer,
    enrollment integer
);

CREATE TABLE district_2020_grades ( -- 성적 테이블
    id integer,
    grades varchar(10)
);

INSERT INTO district_2020_enrollment
VALUES
    (1, 360),
    (2, 1001),
    (5, 450),
    (6, 927);

INSERT INTO district_2020_grades
VALUES
    (1, 'K-3'),
    (2, '9-12'),
    (5, '6-8'),
    (6, '9-12');


select d20.id, d20.school_2020, en.enrollment, gr.grades
from district_2020 as d20 
join district_2035 as d35
using(id)
join district_2020_enrollment as en
using(id)
join district_2020_grades as gr
using(id)
order by d20.id;
