create table date_type(
	timestamp_column timestamp with time zone,
	date_column date,
	time_column time,
	interval_column interval
);

select * from date_type

insert into date_type Values
	('2024-07-19 02:09', '2024-07-19','02:09','2 days')
	('2024-07-19 02:9', '2024-7-1','02:','2') 

-- 자리수 정도 생략하는건 알아서 채워줌. 물론 내가 의도하지 않는 값으로
-- 단 포멧을 완전히 무시하면 오류가 나옴.

	('2022-12-31 01:00 EST','2024-07-19','02:09','2 days'),
    ('2022-12-31 01:00 -8','2024-07-19','02:09','1 month'),
    ('2022-12-31 01:00 Australia/Melbourne','2024-07-19','02:09','1 century'),
    (now(),now(),now(),'1 weeks');

select * from date_type
-- 쿼리를 조회 해보면 now를 사용해서 만든 테이블에는 데이터들이 알맞는 형식으로 파싱 되어서 들어감.
-- timestamp_colume 튜플들을 보면 뒤에 +09라는 오프셋이 있는데, 이건 한국 표준시간대를 위한 오프셋임. 신기..

COPY date_type TO '/Users/apple/Desktop/study/POSTGRESQL/date_type.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');
