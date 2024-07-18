create table num_data_type(
	numeric_column numeric(10,5), -- == decimal(precious, scale) 둘다 고정소수점
	real_column real,
	double_column double precision -- real과 double은 부동소수점
);
--numeric의 첫번째 인수는 precious 정밀도, 두번째 인자는 scale인데, 10.5 면 전체 10 자리중에 소수점 부분을 5번째 까지 표시한다는 말
--10.5 같은 경우는 실수부 5자리, 소수점 뒷 자리 5자리 까지 허용

-- real타입은 소수점 6자리, double precision은 소수점 12자리 까지 허용

INSERT INTO num_data_type
VALUES
    (.7, .7, .7),
    (2.13579, 2.13579, 2.13579),
    (2.1357987654, 2.1357987654, 2.1357987654),
	(99999.7, 99999.7, 99999.7)
	(21111111111.7, 21111111111.7, 21111111111.7);

select * from num_data_type

-- 부동소수점의 계산은 부정확함.
-- 예를 들어 회로의 n,p형 반도체가 여러개 붙어있는 수치해석? 전류 및 전압을 구할때 소수점을 어디까지 끊냐에 따라
-- 정답이 다 다르다. 값이 서로에게 의존적이므로 여러번 반복하다보면 완전 달라보이는 정답이 나오곤하는데..
-- 여러개의 데이터를 부동소수점 방식으로 저장을 하고 추후 계산을 한다면 오차가 분명 발생한다.

-- 증명 : 

SELECT
    numeric_column * 10000000 AS fixed,
    real_column * 10000000 AS floating
FROM num_data_type
WHERE numeric_column = .7;
--결과: 7000000.00000	| 6999999.88079071 

COPY num_data_type TO '/Users/apple/Desktop/study/POSTGRESQL/num_data_type.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');