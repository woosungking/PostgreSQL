
-------------- "" 혹은  null 값이 들어갔을때 쿼리문은 어떻게 나올까 ? --------------------------------------------------------------------------------------
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



select * from 서비스
where 서비스명 ='' --데이터가 조회가 된다. (오라클로 했을때는 조회가 안된다고 함.)

select * from 서비스
where 서비스명 is null





----------------------------- order by, where절의 LIKE절 부수기 ----------------------------------------------------------------------------------
create table 고객(
고객번호 int,
고객이름 text,
주소 text,
전화번호 bigint
);
create table 상품(
상품번호 int,
상품이름 text,
무게 bigint,
가격 bigint
);
create table 주문(
고객번호 int,
상품번호 int,
수량 int,
날짜 bigint
);

INSERT INTO 고객 (고객번호, 고객이름, 주소, 전화번호) VALUES
(1, '홍길동', '서울시 강남구 역삼동', 1234567890),
(2, '이순신', '서울시 종로구 청운동', 2345678901),
(3, '김유신', '부산시 해운대구 좌동', 3456789012),
(4, '장보고', '서울시 마포구 상암동', 4567890123);

INSERT INTO 상품 (상품번호, 상품이름, 무게, 가격) VALUES
(1, '스마트폰', 200, 500000),
(2, '노트북', 1500, 1500000),
(3, '헤드폰', 300, 150000),
(4, '키보드', 800, 80000);

INSERT INTO 주문 (고객번호, 상품번호, 수량, 날짜) VALUES
(1, 1, 2, 20230801),
(1, 3, 1, 20230802),
(2, 2, 1, 20230803),
(3, 4, 3, 20230804),
(4, 1, 1, 20230805);



-- where절의 like문
	--%가 앞에 오면 앞에는 뭐가 와도 신경 안쓴다는거. 반대로 뒤로 오면 뒤에 뭐가오던 상관이 없다
	-- 단 _ 언더바를 써준다면 자릿주의 제한이 생겨버리므로 잘 조합해서 쓰면 된다.

select 상품이름 from 상품
where 상품이름 LIKE '_트_'

select 상품이름 from 상품
where 상품이름 ILIKE '%트_'

select 상품이름 from 상품
where 상품이름 ILIKE '_트%'

select 상품이름 from 상품
where 상품이름 = '노트북'

select 상품이름 from 상품
where 상품이름 like '%폰' -- 끝자리가 '폰'으로 끝나면 만사 ok

select 상품이름 from 상품
where 상품이름 like '%마_' --"스마트폰"이 있지만 _ 로 글자수 제한을 걸어버려서 출력값이 안나옴

select 상품이름 from 상품
where 상품이름 like '%마__' --"스마트폰"에 맞게 자리수를 맞춰줘서 잘 나옴.

--order by
	-- order by 에서 ASEC DESC 를 명시적으로 안적어주면 자동적으로 오름차순으로 진행
	-- 왼쪽부터 우선순위
	-- 숫자로 DESC AESC 를 사용하려면 select문에 명시적으로 있어야함. select문에 컬럼명이 없어도 명시적으로 적어주면 ㄱㅊ

select 고객번호, 상품번호, 수량, 날짜 from 주문

select 고객번호, 상품번호, 수량, 날짜 from 주문
order by 고객번호, 상품번호 DESC

--order by의 잘못된 예시

select 고객번호, 상품번호 from 주문 
order by 고객번호, 3 DESC -- 숫자가 의미하는건 select문에 3번째라는건데, select문에는 2개밖에 없으므로 오류가 나온다.
						-- select 고객번호, 상품번호 from 주문
						-- order by 고객번호, 날짜 DESC 이처럼 명시적으로 넣을시에는 select문에 없어도 가능.
