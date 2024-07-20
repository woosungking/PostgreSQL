CREATE TABLE us_counties_pop_est_2019 (
    state_fips text,                         -- 주 미국 연방 정보 처리 표준(FIPS) 코드
    county_fips text,                        -- 카운티 미국 연방 정보 처리 표준(FIPS) 코드
    region smallint,                         -- 구역
    state_name text,                         -- 주 이름	
    county_name text,                        -- 카운티 이름
    area_land bigint,                        -- 토지 면적 (제곱미터)
    area_water bigint,                       -- 수면 면적 (제곱미터)
    internal_point_lat numeric(10,7),        -- 위도
    internal_point_lon numeric(10,7),        -- 경도
    pop_est_2018 integer,                    -- 2018년 7월 1일 기준 인구 추정치
    pop_est_2019 integer,                    -- 2019년 7월 1일 기준 인구 추정치
    births_2019 integer,                     -- 2018년 7월 1일부터 2019년 6월 30일 사이 출생자 수
    deaths_2019 integer,                     -- 2018년 7월 1일부터 2019년 6월 30일 사이 사망자 수
    international_migr_2019 integer,         -- 2018년 7월 1일부터 2019년 6월 30일 사이 순 국제 이주자 수
    domestic_migr_2019 integer,              -- 2018년 7월 1일부터 2019년 6월 30일 사이 순 지역 이주자 수
    residual_2019 integer,                   -- 일관성을 위해 추정치를 조정하는 데 사용되는 숫자
    CONSTRAINT counties_2019_key PRIMARY KEY (state_fips, county_fips)	
);

SELECT * FROM us_counties_pop_est_2019;

COPY us_counties_pop_est_2019
FROM '/Users/apple/Desktop/study/POSTGRESQL/us_counties_pop_est_2019.csv'
WITH (FORMAT CSV, HEADER);

------------------------------------------------ 데이터 셋으로 문제 풀어보기 ! -----

-- 문제 1: 각 주(state_name)의 총 인구(pop_est_2019)를 계산하세요.
select state_name, pop_est_2019, pop_est_2018 from us_counties_pop_est_2019 order by pop_est_2019 DESC

-- 문제 2: 가장 인구가 많은 카운티(county_name)를 찾으세요.

select county_name, pop_est_2019 from us_counties_pop_est_2019 order by pop_est_2019 DESC limit 1;
select county_name, pop_est_2018 from us_counties_pop_est_2018 order by pop_est_2019 DESC limit 1;

-- 문제 3: 2018년에서 2019년으로 인구 증가율이 가장 높은 카운티를 찾으세요.

select county_name, (pop_est_2019-pop_est_2018) as grow from us_counties_pop_est_2019 order by grow DESC
select county_name, pop_est_2019, pop_est_2018 from us_counties_pop_est_2019 where county_name ILIKE 'maricopa county'

-- 문제 4: 총 토지 면적(area_land) 상위 10개의 카운티를 찾으세요.

select county_name, area_land from us_counties_pop_est_2019 order by area_land DESC LIMIT 10

-- 문제 5: 각 주의 평균 인구 밀도(인구 / 토지 면적)를 계산하세요.

select state_name, (pop_est_2019 / area_land) as popularity_density from us_counties_pop_est_2019

-- 문제 6: 2019년 출생자 수(births_2019)가 5000명 이상인 카운티의 목록을 출력하세요.

select county_name, births_2019 from us_counties_pop_est_2019 where births_2019 >=5000 order by births_2019 DESC

-- 문제 7: 2019년 국제 이주자 수(international_migr_2019) 상위 5개 카운티를 찾으세요.

select county_name, international_migr_2019 from us_counties_pop_est_2019 order by international_migr_2019 DESC limit 5

-- 문제 8: 주(state_name)별로 카운티 수를 계산하세요.

-- 문제 9: 2019년 사망자 수(deaths_2019)가 2019년 출생자 수(births_2019)보다 많은 카운티를 찾으세요.

-- 문제 10: 2019년 국내 이주자 수(domestic_migr_2019)가 0보다 큰 카운티의 목록을 출력하세요.

-- 문제 11: 각 주의 총 수면 면적(area_water)을 계산하세요.

-- 문제 12: 2019년 순 인구 변동(pop_est_2019 - pop_est_2018)이 가장 큰 상위 10개 카운티를 찾으세요.

-- 문제 13: 2019년 잔여 인구(residual_2019)가 음수인 카운티의 목록을 출력하세요.

-- 문제 14: 2019년 인구(pop_est_2019)가 1백만 이상인 카운티의 목록을 출력하세요.

-- 문제 15: 2019년 출생자 수(births_2019)가 주 인구 대비 비율이 가장 높은 주를 찾으세요.

-- 문제 16: 위도(internal_point_lat)가 가장 낮은 카운티를 찾으세요.

-- 문제 17: 경도(internal_point_lon)가 가장 높은 카운티를 찾으세요.

-- 문제 18: 각 주의 평균 수면 면적(area_water)을 계산하세요.

-- 문제 19: 2019년 국제 이주자 수(international_migr_2019)가 음수인 카운티의 목록을 출력하세요.

-- 문제 20: 각 구역(region)별로 총 인구(pop_est_2019)를 계산하세요.