create table PRODUCT_REVIEW(
REVIEW_NO SMALLINT,
PRODUCT_CODE BIGINT,
MEMBER_ID TEXT,
CONTENT TEXT,
REG_DATE DATE
);

CREATE TABLE PRODUCT(
PRODUCT_CODE BIGINT,
PRODUCT_NAME TEXT,
PRICE BIGINT
);

INSERT INTO PRODUCT_REVIEW VALUES
(1,100001,'auga10','무소음인데소음이조금있는듯합니다람쥐'),
(2,100001,'auga1008','무선이라편합니다람쥐'),
(3,100002,'auga9','맛돌이맛돌이럭키비키'),
(4,100002,'auga991008','별로네요 ㅡㅡ'),
(4,100010,'ghost','상품코드가 잘못 입력 되어진 상품');

INSERT INTO PRODUCT VALUES
(100001,'무소음 무선 마우스', 29500),
(100002,'기계식 게이밍 키보드', 150000),
(100003,'맥북 M1 pro ssd 1tb', 150000),
(100009,'아무도 구매 안한 상품', 150000);


-- join을 해서 나오는 결과를 서브쿼리로 입력해서 똑같이 만들어보자.
select m.product_code, s.product_name, s.price,m.member_id,m.content
from product_review m
inner join product s on s.product_code = m.product_code 

select m.product_code, s.product_name, s.price,m.member_id,m.content
from product_review m
left join product s on s.product_code = m.product_code


-- 스칼라 서브 쿼리 select 문에 넣는 쿼리(left join과 같은 결과)
select 
m.product_code,
(select s.product_name from product s where m.product_code = s.product_code),
m.member_id,
m.content
from product_review m -- 어!!!! 문제만 풀때는 fk값이 전부 대응이 되기때문에 inner join이랑 같은건줄 알았지만.
					  -- 쓰레기 값을 넣고 확인해보면 스칼라서브쿼리는 left join과 같다는걸 알 수 있음.!!



select 
m.product_code,
(select s.product_name from product s where m.product_code = s.product_code),
(select s.price from product s where m.product_code = s.product_code), -- 참고로 짬뽕해서 같이 서브쿼리에 한번에 넣으면 오류가 나와용
m.member_id,
m.content
from product_review m


-- 인라인 서브 쿼리 from 문에 넣는 쿼리(inner join과 같은 결과)


select m.product_code,
s.product_name,
s.price,
m.member_id,
m.content
from product_review m, (select product_code,product_name,price from product) s 
where m.product_code = s.product_code -- 쿼리 결과를 보면 inner join과 같은 결과임을 볼 수 있음.

--(=) 

select m.product_code,
s.product_name,
s.price,
m.member_id,
m.content
from product_review m, product s
where m.product_code = s.product_code 
