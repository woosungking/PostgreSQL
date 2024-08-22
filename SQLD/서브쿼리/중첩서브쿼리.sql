-- 중첩 서브 쿼리 where절 안에 있는 서브 쿼리
	--비연관 서브쿼리(서브쿼리에 from 뒤에 오는 즉 주체가 되는 테이블의 컬럼이 없음)
	--연관 서브쿼리(서브쿼리에 from 뒤에 오는 테이블 즉 주체가 되는 테이블의 컬럼이 있음.)
create table agency(
agency_code text,
agency_name text
);

create table entertainer(
name text,
job text,
birthday bigint,
agency_code text
);

insert into agency values
('a1001','EDAM엔터'),('b1004','지킴엔터'),('c1005','뮤직팜엔터'),('d1006','안테나'),('e1007','빅히트');

insert into entertainer values
('아이유','가수 그리고 초절정미녀',19930516,'a1001'),
('김향기','배우',20000809,'b1004'),
('김태형','가수',19951230,'e1007'),
('유건우','배우',19830925,'b1004');

-- 지킴엔터 소속의 연예인을 찾기(비연관 서브쿼리)
	--서브 쿼리를 안쓰고 일단 해보기.
select E.name from entertainer E 
where E.agency_name = '지킴엔터' -- 지킴엔터의 코드명을 안다면 where절에 코드명이 같다라고 하면 편하지만
							   -- 코드명을 모르고 그냥 '지킴엔터' 자체로 조회를 하고 싶은경우에는 이렇게 못함.

--물론 조인문을 넣어서 아래와 같이 할 수 있지만, 데이터가 많을때 join을 쓰면 효율이 많이 떨어진다고 배웠음.
select E.name, A.agency_name from entertainer E
inner join agency A on A.agency_code = E.agency_code
where A.agency_name = '지킴엔터'


		-- 서브쿼리를 사용하여 더 간단하게 해결하였음 !!
		select E.name, E.job, E.birthday, E.agency_code from entertainer E
		where E.agency_code = (select agency_code from agency where agency_name='지킴엔터')

 


--생일이 가장 느린 연예인을 찾기(연관 서브쿼리)

select E.name, E.birthday from entertainer E
where birthday =(select MAX(E.birthday) from entertainer E)




-- 단일 행 서브 쿼리

	--생일이 가장 느린 연예인을 찾기(결과값이 1개) in, all 등 사용X 당연하겠지 ?
	select E.name, E.birthday from entertainer E
	where birthday =(select MAX(E.birthday) from entertainer E)

-- 다중 행 서브 쿼리

	-- 소속사가 존재하는 연예인 출력(물론 위 데이터셋에는 전부 소속이 되어있긴함.)
	select E.name from entertainer E
	where E.agency_code in (select agency_code from agency)