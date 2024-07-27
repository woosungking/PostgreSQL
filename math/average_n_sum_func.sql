table us_counties_pop_est_2019

-- 문제: 2019 미국의 카운티 인구수 총합, 및 카운티 인구수의 평균을 sum(),avg(), round() 함수를 이용해서 구해보자.

select sum(pop_est_2019) as total_pop, avg(pop_est_2019) as avg_pop
from us_counties_pop_est_2019

-- 문제: 평균의 소수점을 지워보자 => round함수 이용

select sum(pop_est_2019) as total_pop, round(avg(pop_est_2019),0) as avg_pop
from us_counties_pop_est_2019
