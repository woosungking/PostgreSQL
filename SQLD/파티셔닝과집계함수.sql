-- 집계함수를 전에는 group by 로 묶고 써야한다고 하고, where절에서는 집계함수를 쓰지 못했다.
-- 아래는 파티셔닝을 이용해 group by 없이 집계함수를 쓸거다
    -- 차이점은 그룹함수는 알다시피 그룹조건에 같은 인스턴스가 있으면 "하나"로 만들어준다.
    -- 즉 김우성, 김우성, 김우성, 심재홍, 심재홍, 심재홍 이걸 이름명으로 그룹바이를 한다면, 김우성, 심재홍 이렇게 두개밖에 안나온다
    -- 파티셔닝을 이용하면 다 살리고 집계까지 ㄱ가능하다.

create table exam_result (
student_name text,
subject text,
score int,
result text
);

insert into exam_result values
('제니','컴퓨터네트워크',90,'pass'),
('제니','데이터베이스',40,'fail'),
('지수','컴퓨터네트워크',50,'pass'),
('지수','데이터베이스',60,'pass'),
('리사','컴퓨터네트워크',40,'fail'),
('리사','데이터베이스',10,'fail'),
('로제','컴퓨터네트워크',65,'pass'),
('로제','데이터베이스',80,'pass'),
('조이','컴퓨터네트워크',65,'pass'),
('조이','데이터베이스',80,'pass');

select * from exam_result

-- rank() over 는 동일 점수가 있을때 공통 순위를 맥여줌  + 공동순위만큼 그 뒤 순위를 밀어버림
--로제 와 조이의 점수를 보자.
SELECT subject, 
       student_name, 
       RANK() OVER(PARTITION BY subject ORDER BY score DESC) AS rank
FROM exam_result;

-- dense_rank 는 동일 점수가 있을때 공통 순위를 맥여주고 , 공동순위만큼 뒤 순위를 밀지 않는다, rank와의 차이점.
SELECT subject, 
       student_name, 
       dense_RANK() OVER(PARTITION BY subject ORDER BY score DESC) AS rank
FROM exam_result;

-- ROW_NUMBER는  동일 점수가 있을때 공동으로 순위를 맥여주지 않고 테이블 순서대로 순위를 맥인다, 즉 공동 랭크가 없음.
SELECT subject, 
       student_name, 
       ROW_NUMBER() OVER(PARTITION BY subject ORDER BY score DESC) AS rank
FROM exam_result;


		--집계함수


select student_name, subject, score, sum(score) over(partition by student_name) as 학생들의모든과목점수합
from exam_result

select student_name, subject, score, round(avg(score) over(partition by student_name order by score)) as 각학생전과목평균
from exam_result

-- 각 학생의 평균 점수
	-- select student_name, subject, score, avg(score) over(partition by name partition by subject order by score desc) as 과목의평균
	-- from exam_result
-- 요따구로 partion by 를 두번쓰면 X

SELECT 
    student_name, 
    subject, 
    score, 
    AVG(score) OVER(PARTITION BY subject) AS 과목의평균
FROM 
    exam_result;

-- Max를 사용하여 각 과목별 과탑의 점수를 컬럼에 추가해보자

SELECT 
    student_name, 
    subject, 
    score, 
	max(score) over(partition by subject) as 과탑성적
from
exam_result;

-- Min를 사용하여 각 과목별 꼴등의 점수를 박제해보자
SELECT 
    student_name, 
    subject, 
    score, 
	min(score) over(partition by subject) as 과탑성적
from
exam_result;

-- 각 과목별로 PASS를 받은 학생의 수를 박제해보자

select student_name, subject, score, count(result) over(partition by subject) as 합격자수
from exam_result
where result = 'pass';

--first_value 함수를 써서 각 과목 1등의 이름을 박제해보자
select student_name, subject, score, 
		count(result) over(partition by subject) as 합격자수,
		first_value(student_name) over(partition by subject order by score desc) as 1등
from exam_result
where result = 'pass';

-- last_value 를 이용해서 각 과목 꼴등의 이름을 박제하자.(오류 있음... 추후 다시 공부 예정....)
select student_name, subject, score, 
		count(result) over(partition by subject) as 합격자수,
		last_value(student_name) over(partition by subject order by score asc) as 꼴등
from exam_result;


--LAG 함수를 써서 내 바로 위에 있는 사람(나보다 점수가 높은 사람) 이름을 출력해보자.

select student_name, subject, score, LAG(student_name,1) over(partition by subject order by score) as asd
from exam_result

--LEAD 함수를 써서 내 바로 뒤에 있는 사람(나보다 점수가 높은 사람) 이름을 출력해보자.

select student_name, subject, score, LEAD(student_name) over(partition by subject order by score) as asd
from exam_result




----------------- 비율함수

select 
student_name, subject, 
score,
sum(score) over() as sum, 
score / sum(score) over() as "score/sum",
ratio_to_report(score) over() as R_T_R --postgresql에서는 지원 안해서 위 처럼 수동으로..
from exam_result
