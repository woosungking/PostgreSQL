-- select * from teachers
-- order by id DESC

-- select * from teachers
-- order by first_name DESC --알파벳도 정렬가능.

-- select * from teachers
-- order by 1 DESC --행의 위치를 숫자로 입력해도 인식을 한다는 부분을 알 수 있다.

-- select * from teachers
-- order by school ASC, salary DESC --학교를 오름차순으로 정렬, 정렬된 데이터에서 봉급이 높은 순서대로 보이도록. 2가지 조건 가능

-- select distinct school from teachers --내가 선택하려는 데이터!!에서 중복을 제거, 이와 같은 경우는 학교 이름만 중복이 안되게..
-- select distinct school, salary from teachers -- 학교와, 봉급이 둘다! 중복이 되야 걸러서 보여줌
-- select distinct * from teachers -- 이 같은 경우는 데이터 셋에 모든항목이 중복되는 튜플이 없기떄문에 결과적으로 select * from teacher 과 똑같음

--where 연산자 사용, ilike, like, between, in 연산자 사용

-- select * from teachers where first_name = 'Samuel'
-- select * from teachers where first_name like 'samuel' -- 대소문자 구분을 하기 때문에 아무 결과도 안나옴.
-- select * from teachers where first_name ILIKE 'samuel' --ILIKE연산자는 대소문자 구분을 하지 않으므로 결과 같이 나옴,
-- select * from teachers
-- select * from teachers where first_name like '%mue%' 
-- select * from teachers where first_name like '%muel%'
-- select * from teachers where first_name in('Samuel', 'Jhon') -- Samuel, Jhon 둘중 하나만 일치해도 결과 출력, 대소문자 구문해야함.
-- select * from teachers where first_name in('%muel%', 'Jhon') -- LIKE처럼 %연산자를 같이 사용하지 못함.
-- select * from teachers where first_name <> 'Samuel' --또한 대소문자를 구분해줘야함. Not연산자임.

-- select * from teachers where salary > 40000 and first_name ILIKE '%e'

-- select * from teachers where salary > 40000 and salary < 50000
-- select * from teachers where salary between 40000 and 50000 -- 바로 위 쿼리문이랑 같은 결과를 보여줌.

-- 정리: 
--	<,>,<=,>=,!=(<>) 연산자들은 직관적이고
-- BETWEEN, IN, LIKE, ILIKE 연산자들은 위 예시를 떠올리고 사용하면 될듯.



















