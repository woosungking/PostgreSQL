create table human(
	first_name text
);

-- 다른 언어랑 비슷하게 case 조건문이 있는데, 김씨면 우리 집안사함이라고 보여줌.
insert into human values('김'),('이'),('박'),('최'),('고'),('김')

select first_name, -- first_name의 값을 바꾸는게 절대 아님 주의 ㅠㅠㅠ!
case when first_name = '김' then '집안사람'
else '다른집안사람'
end as asd -- 조건에 따라 값이 바뀌는데 새로운 컬럼을 만들어서 보여줌, end as 로 해서 새로 생기는 컬럼명을 정해주는거
from human


-- 다른 표기접, 컬럼명과 when이랑 위치 바꾸고 등호 없애주기.
select first_name,
case first_name when '김' then '집안사람'
else '다른집안사람'
end as asd
from human

-- SELECT TO_CHAR(TO_DATE('2023.01.10 10', 'YYYY.MM.DD HH24')) AS formatted_date;

-- SELECT TO_CHAR(TO_DATE('2023.01.10 10', 'YYYY.MM.DD HH24'), 'YYYY-MM-DD HH24:MI:SS') AS formatted_date;
-- SELECT TO_CHAR(TO_DATE('2023.01.10 10', 'YYYY.MM.DD HH24')+1/24/(60/10), 'YYYY-MM-DD HH24:MI:SS') AS formatted_date;

create table human(
	first_name text
);

-- 문제 1 기본적인 조건문

insert into human values('김'),('이'),('박'),('최'),('고'),('김'),(NULL),(NULL)

select first_name,
case when first_name = '김' then '집안사람'
else '다른집안사람'
end as asd
from human


-- 다른 표기접, 컬럼명과 when이랑 위치 바꾸고 등호 없애주기.
select first_name,
case first_name when '김' then '집안사람'
else '다른집안사람'
end as asd
from human

-- 문제 2 조건문의 응용

SELECT first_name,
       COALESCE(
           CASE 
               WHEN first_name = '김' THEN '집안사람'
               ELSE '다른집안사람'
           END, 
           '없는 집안 사람'
       ) AS asd
FROM human;



