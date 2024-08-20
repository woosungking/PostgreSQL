
-- NULL의 사칙연산은 NULL 이랑 더하고 빼고 곱하고 나누어도 null이다.
-- 세로로 계산시에 null이 있다면 무시가 된다.
-- 단 가로로 계산시에는 null의 사칙연산 개념을 똑같이 적용받는다.


insert into tab1 values
(1),(2),(3),(4),(null)

insert into tab2 values
(1),(2),(3),(4)

select col1 from tab1

select sum(col1) from tab1 --10

select col2 from tab2

select sum(col2) from tab2 --10

select sum(col1 + col2) from tab1, tab2 --70

create table tab3(
	col3 int
);

create table tab4(
	col4 int
);

insert into tab3 values
(1),(null)

insert into tab4 values
(1),(2)

select * from tab3
select * from tab4

select sum(col3) from tab3
select sum(col4) from tab4

select sum(col3 + col4) from tab3, tab4
