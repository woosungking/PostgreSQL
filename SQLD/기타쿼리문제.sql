create table 서비스 (
	서비스번호 varchar(25) primary key,
	서비스명 varchar(25) null,
	개시일자 date not null
);


insert into 서비스 values
('001','청소','2024-12-01'),
('1','빨래','2024-12-02'),
('999','','2024-12-04'),-- 서비스 명에 '' 같은 빈 문지열을 입력
('2',NULL,'2024-12-04');-- null 값을 허용하므로 가능

table 서비스


select * from 서비스
where 서비스명 ='' --데이터가 조회가 된다. (오라클로 했을때는 조회가 안된다고 함.)

select * from 서비스
where 서비스명 is null