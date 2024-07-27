select 3*4 as multiple

-- // 테이블 없이도 별도의 연산이 가능,
-- // 정수 * 정수 = 정수 integer반환
-- // 연산자 연산중에 numeric 타입이 하나라도 있으면, numeric(고정 소수점) 타입이 반환
-- 부동소수점 숫자가 있으면 double precision(부동소수점) 타입 반환



select 11.0/6
-- 연산자 숫자중에 numeric(11.0)이 있으므로 값도 당연히 numeric (1.8333333333)
select cast(11 as numeric(3,1))/6
--만약 강제로 소수점으로 계산을 해야한다면?

--위 두개는 같은 결과를 반환, numeric(3,1)은 전체 3자리중에 소수점 1자리만, => 11.0


select cast(11.0/6 as integer)
-- 정수로 표현하고 싶다면 타입캐스트를 사용.

select |/100
select sqrt(100) as ss
--제곱근

select ||/10000
--세제곱근

select factorial(3)




