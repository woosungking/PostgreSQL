create table no_mom(
    ROWNUM smallint,
    C1 text
);

-- insert into no_mom values(1,'A\nA'),(2,'B\nB\nB'); 
-- \n 을 사용하는것이 아닌 개행문자의 아스키 코드가 CHR(10) 이라고 한다.

insert into no_mom values
(1,'A'||CHR(10)||'A'),
(2,'B'||CHR(10)||'B'||CHR(10)||'B');

select length(c1) from no_mom 
-- 개행문자 포함 해서 문자열의 길이가 3, 5 이렇게 나온다.

	-- 개행문자를 지우면 어떻게 나올까?

select length(replace(c1,CHR(10),'')) from no_mom
-- 2,3 이렇게 나온다. 즉 CHR이 지워진 문자열의 수가 나온다. 2랑 3이 나온다.

	--문제가 있는 쿼리문을 보자

select sum(CC) from(select(length(c1)-length(replace(c1,chr(10),'')))CC 
from no_mom);
	-- 3이 나온다. 간략하게 설명을 하자면 모든 행의 length를 더한 길이가 나와야한다.
	-- 어 그러면 5가 나와야 하자나.

select sum(CC) from(select(length(c1)-length(replace(c1,chr(10),''))+1)CC
from no_mom); -- 그래서 1을 더해준다 ;;; 행이 두개니까 원래 값에 총 2가 더해지는거다.




-- 문자열의 길이는 개행문자 포함!
-- postgresql 에서 연결은 || 기호를 사용하여 표현, SQL에서는 concat을 사용함.




INSERT INTO no_mom (ROWNUM, C1) VALUES --sql 
(1, CONCAT('A', CHAR(10), 'A')),
(2, CONCAT('B', CHAR(10), 'B', CHAR(10), 'B'));

table no_mom


select length(replace(C1,CHR(10),'')) from no_mom