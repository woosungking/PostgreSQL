-- WHERE절과 HAVING절은 유사하다.
-- 단 WHERE절은 "개별행"에 대한 조건을 제약하는 반면
-- HAVING절은 "그룹화 되어진"데이터에 대해 조건을 제약한다.


create table studentss (
    name text,
    age smallint,
	subject text,
	score smallint
);


INSERT INTO studentss (name, age, subject, score) VALUES
('Alice', 20, 'Math', 85),
('Alice', 20, 'English', 88),
('Alice', 20, 'History', 92),
('Bob', 21, 'Math', 78),
('Bob', 21, 'English', 84),
('Bob', 21, 'History', 70),
('Charlie', 22, 'Math', 90),
('Charlie', 22, 'English', 95),
('Charlie', 22, 'History', 100),
('David', 23, 'Math', 60),
('David', 23, 'English', 62),
('David', 23, 'History', 65),
('Eve', 20, 'Math', 82),
('Eve', 20, 'English', 79),
('Eve', 20, 'History', 88);


table studentss

select name, subject, score from studentss -- 개별행에 대한 제약조건을 having절로 설정하면 오류가 나온다.
group by name,subject, age;
having score>70;

select name,subject, score from studentss -- 개별행에 대한 제약조건 설정을 where절로 하면 실행이 된다.
where score > 70
order by name DESC

--where절의 실행 결과를 보면 개별행에대한 필터링만 적용했기때문에 70점이 넘는다면 해당하는 컬럼을 전부 보여준다.

-- 하지만 여기서 각 학생중 모든 과목 점수의 평균이 70이 넘는 학생만 필터링하고 싶다면 ?

	
	-- 내가 먼저했던 실수들

		
		--실수 1)  이렇게 하면 where절로 필터링 한 거랑 다르지 않다.. 
select name, score, avg(score) as avg_score from studentss
group by name, score
having avg(score) > 70
order by name DESC 

		--실수 2) 그룹으로 묶어서 통계를 내고싶은 데이터만 select절에 포함을 시켜야한다.

select name, score, avg(score) as avg_score from studentss
group by name
having avg(score) > 70
			-- 해당 쿼리문은 평균 70점이 넘는 학생의 name과 score와 avg_score 를 select를 하게 되는데,
			-- 에초에 평균이 70이 넘는 학생의 이름과 평균점수를 보도록 group과 having절을 사용하였지만 여기에 연관없는 score까지 보여달라고 하면 모순이 생기낟.

		--실수 3) 주석에 적힌 단계대로 읽어보면 말에 모순이 있음. 나중에 기억안나면 이 예시가 가장 좋을듯함.
		
select name, score from studentss	--Step3 -> 평균점수가 70이 넘는.. 사람이름과 점수를 보여줘라, studentss 테이블에서
group by name 						--Step1 -> 인스턴스중에서 이름이 같은것끼리 집합으로 묶었다
having avg(score) > 70 				--Step2 -> 그중에서 평균점수가 70이 넘는..


	-- 올바른 예시

		-- 정답 1)
select name, avg(score) from studentss  -- Step3 -> 사람의 이름과, 평균점수를 studentss 테이블에서 보여라.
group by name							 -- Step1 -> 같은 이름끼리 묶어라
having avg(score) > 70					 -- Step2 -> 같은 이름끼리 묶었니? 이 묶인 그룹에서 평균이 70이 넘는..


