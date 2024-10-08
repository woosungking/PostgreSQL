-- 1. 테이블 생성
CREATE TABLE 매출 (
    지역 VARCHAR(10),  -- 지역
    제품 VARCHAR(10),  -- 제품
    연도 INT,          -- 연도
    판매금액 INT       -- 판매 금액
);


-- 2. 데이터 삽입
INSERT INTO 매출 (지역, 제품, 연도, 판매금액) VALUES
('서울', '노트북', 2023, 1000),
('서울', '노트북', 2023, 12000),
('서울', '노트북', 2023, 22000),
('서울', '노트북', 2023, 52000),
('서울', '태블릿', 2023, 800),
('부산', '노트북', 2023, 900),
('부산', '태블릿', 2023, 700);




SELECT 지역, 제품, 연도, SUM(판매금액) AS 총매출 -- 
FROM 매출
GROUP BY GROUPING SETS ( 
    (지역),
    (제품),
    (연도),
	(지역, 제품),
    (지역, 연도),
    (제품, 연도),
    (지역, 제품, 연도),
	()
)
ORDER BY 지역, 제품, 연도; -- 쿼리를 날려보면 각각 group by를 한것과 같다.


-- ROLLUP 설명과 마친가지로 그루핑을 예시를 먼저 보면 위 쿼리는 모든 경우의 수로 그룹을 묶은건데. 
    -- CUBE는 A,B,C 가 있다면 ABC,AB,AC,BC 모든 경우의 수를 계산하기에 위 그루핑보다ㅏ 더 많은 결과가 나온다.
    -- 큐르를 써서 원하는 결과를 얻고 싶다면 "괄호"로 잘 묶는 습관을 들여보자.

SELECT 지역, 제품, 연도, SUM(판매금액) AS 총매출 
FROM 매출
GROUP BY CUBE (지역, 제품, 연도)
ORDER BY 지역, 제품, 연도;