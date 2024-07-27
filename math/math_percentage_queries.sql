table us_counties_pop_est_2019

-- 문제: 인구의 자연증가 natural_increse 를 구해보자.

SELECT state_name as states, county_name as county, births_2019 as birth, deaths_2019 as death,
(births_2019 - deaths_2019) as natural_increase
from us_counties_pop_est_2019
order by states ASC

-- 문제: 각 카운티 면적에서 물이 차지하는 면적의 백분율을 구해보자.(내 기준 중요!)

SELECT state_name as states, county_name as county, area_land as land, area_water as water,
(area_water / (area_land + area_water) ) * 100 as pct_water
from us_counties_pop_est_2019
-- 이렇게 하면 pct_water의 모든 값이 전부 0이 나온다.
-- ⭐정수 / 정수를 하면 결과값은 정수 !!! 그런이유로 0이 나올 수 밖에 없음⭐
--⭐ 피연산자 중 하나를 numeric 으로 바꾸어서 계산 ⭐

SELECT state_name as states, county_name as county, area_land as land, area_water as water,
(area_water::numeric / (area_land + area_water) ) * 100 as pct_water
from us_counties_pop_est_2019
order by pct_water DESC

SELECT state_name as states, county_name as county, area_land as land, area_water as water,
(area_water / (area_land + area_water)::numeric ) * 100 as pct_water
from us_counties_pop_est_2019
order by pct_water DESC

-- 결과는 둘다 동일!




