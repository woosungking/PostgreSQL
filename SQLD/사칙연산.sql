
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


------------------------------------------------------------------------------------------------------------------------------

insert into tab5 values
('수학',1),('수학',2),('수학',3),('수학',4),('수학',5),('수학',6),
('과학',10),('과학',20),('과학',30),('수학',40),('수학',50),('수학',60);

select subject, sum(col5) from tab5
group by subject;


select null, sum(col5) from tab5 -- subject쪽 데이터가 전부 null로 변하고 그룹으로 지어져서 한번에 더하기가 실행됌, 컬럼명은 null?이렇게 변함.
group by subject;