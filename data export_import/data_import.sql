CREATE TABLE supervisor_salaries (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    town text,
    county text,
    supervisor text,
    start_date text,
    salary numeric(10,2),
    benefits numeric(10,2)
);

table supervisor_salaries -- 테이블 생성 후 조회,

-- copy supervisor_salaries
-- from '/Users/apple/Desktop/study/POSTGRESQL/supervisor_salaries.csv'
-- with(FORMAT CSV, HEADER)
-- 테이블의 크기랑 데이터 셋의 header와 비교해보면 CSV파일의 해더가 더 작은걸 알 수 있는데. 
-- 이렇게 한번에 가지고 오려고 하면 오류가 나온다.(CSV의 행은 3개, 테이블의 행은 6개)

copy supervisor_salaries (town, supervisor, salary)
from '/Users/apple/Desktop/study/POSTGRESQL/supervisor_salaries.csv'
with(FORMAT CSV, HEADER)
-- 명시적으로 해주어야 오류가 안나온다. 명심.
-- CSV에 일부만 위처럼 카피 가능함, 일단 카피전에 테이블이 있어야한다는점 다시 한번 숙지.

-- CSV에서 데이터를 가지고 올때도 where절을 사용해서 필요한 데이터만 가지고 올 수 있음.
delete from supervisor_salaries -- 일단 지우고 다시 삽입.

copy supervisor_salaries (town, supervisor, salary)
from '/Users/apple/Desktop/study/POSTGRESQL/supervisor_salaries.csv'
with(FORMAT CSV, HEADER)
where town ILIKE 'new brillig'

table supervisor_salaries

-- 신기하다 ... good... new brillig 만 나옴.


-- 만약 데이터를 가지고 와야하는데 특정"행"에 원하는 값을 집어 넣은 상태로 가지고 오고싶다면.
-- 위 예시에서 3개의 행이 전부 null값이였는데, 이 행을 한번에 채우는법.
-- 임시테이블 생성 후, 데이터 삽입.

delete from supervisor_salaries -- 데이터 일단 날려주고

CREATE TEMPORARY TABLE supervisor_salaries_temp(LIKE supervisor_salaries INCLUDING ALL);
-- CREATE TEMPORARY TABLE supervisor_salaries_temp(
-- option1 text,
-- option2 text
-- ); -- 위 방법을 안쓰면 이렇게 다 해야함.

table supervisor_salaries_temp

-- TEMPORARY 는 임시테이블이다, 데이터베이스 세션에 존재 하고 디비가 꺼지면 없어짐.
-- INCLUDING ALL은 기존 위에서 이미 만든 supervisor_salaries 테이블의 속성을 가지고 온다는 말임.
-- 아니면 하나하나 다시 만들어야함.

copy supervisor_salaries_temp (town, supervisor, salary)
-- 임시테이블에 CSV데이터 삽입, 테이블 행이랑, CSV행이랑 일치하지 않으므로 명시적으로 집어넣어야함.
from '/Users/apple/Desktop/study/POSTGRESQL/supervisor_salaries.csv'
with(FORMAT CSV, HEADER)


INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, '부천시', supervisor, salary
FROM supervisor_salaries_temp
-- 아까랑 똑같이 값을 가지고 올것인데 town에 null값이 아닌 '부천시'를 넣고 싶다면 위처럼.

-- 내 생각:
--테이블에 합격 불합격 여부를 나타내는 행이 있다고 가정함, CSV로 성적데이터를 가지고 올때 where절로 조건을 걸어둔뒤 합 불에 여부를 넣은 후 데이터를 땡겨오면 편할거같다

TABLE supervisor_salaries

DROP TABLE supervisor_salaries_temp

