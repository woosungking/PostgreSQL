-- 중앙값 찾기, 및 최빈값 찾기(맨 아래에 있음.)

create table percentile_test (
	numbers smallint
);

insert into percentile_test (numbers) values
	(1), (2), (3), (4), (5), (6);

-- percentile_cont 는 cont -> continuous 연속적인 인데, 백분위수를 연속 값으로 계산 => 집합내의 숫자가 항상 나오지는 않음

select percentile_cont(.5) within group (order by numbers) from percentile_test
-- => 실행결과는 "3.5"가 나오게 되는데 짝수개의 집합에서 중앙값임.

-- percentile_disc 는 disc => discret 이산적인 인데, 결과는 데이터 베이스 테이블에 있는 집합의 값이 나옴.

select percentile_disc(.5) within group (order by numbers) from percentile_test
-- => 반올림이 되어서 3이 나오게 됌, 짝수개의 집합에서 중앙에서 바로 앞의 값이 나옴.



drop table percentile_test

create table percentile_test(
	numbers smallint
);

insert into percentile_test (numbers) values
	(1), (2), (3), (4), (5), (6), (7);


select percentile_cont(.5) within group (order by numbers) from percentile_test
select percentile_disc(.5) within group (order by numbers) from percentile_test
-- 홀수개의 집합에서는 중앙값이 두 함수 모두 딱 떨어져서 나옴.


--궁금했던점
--	1. 이미 데이터가 정렬이 되어 있다면 within group 절이 필요가 없지 않나 ?
--		=> ㄴㄴ 필요하다.


-- 중앙값이 중요한 이유는 하나의 수가 너무 커버리면 전체 평균이 높아지므로 신뢰도가 떨어짐.(us_county_pop_2019로 실습)
table us_counties_pop_est_2019

select 
round(avg(pop_est_2019)) as 평균, 
percentile_cont(.5) within group(order by pop_est_2019) as 중앙값
from us_counties_pop_est_2019

-- 중앙값 및 4분위 값 한번에 찾는법

select percentile_cont(array[.25,.5,.75,]) within group(order by pop_est_2019) as 사분위값
from us_counties_pop_est_2019
-- 25% 50% 75% 의 값들이 출력
-- 배열을 전달했으므로 중괄호에 감싸져서 나옴.


-- 중괄호에 감싸져있으므로 보기 불편하니 배열을 풀어보자 unnest() 함수 사용

select unnest(percentile_cont(array[.25,.5,.75]) within group(order by pop_est_2019)) as 사분위값
from us_counties_pop_est_2019



-- 최빈값을 찾아보자 ! mode() 함수 사용

select mode() within group(order by pop_est_2019) as 최빈값 from us_counties_pop_est_2019

