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



-- select E.name, S.agency_name 
-- from entertainer E,(select agency_name from agency A where E.agency_code =A.agency_code) S

select 
E.name, 
(select A.agency_name from agency A where E.agency_code = A.agency_code) 
from entertainer E


delete from entertainer where name = '아이유'

insert into entertainer values ('아이유','가수 그리고 초절정미녀',19930516,'a1001');

-- 엔터테이너에 대한 롤백 테이블 만들거임
	
	-- case 1) 테이블 복사 명령어로 복사하기
		create table entertainer_rollback as select * from entertainer 
		-- 조건대로 복사가 되어지지만, 제약조건등은 넘어오지 않으므로 정의해줘야함
		table entertainer_rollback -- 데이터도 다 넘어옴.
	
	-- case 2 ) merge문은 postgresql에서 지원하지 않음.
		drop table entertainer_rollback
		create table entertainer_rollback(
		name text,
		job text,
		birthday bigint,
		agency_code text
		);

		merge -- 아 ! postgresql은 merge구문을 지원하지 않는다 ;;;
			into entertainer_rollback DB
			using entertainer E
				on E.name = DB.name
			when matched then
				update set DB.name = E.name,
							DB.job = E.job,
							DB.birthday = E.birthday,
							DB.agency_code = E.agency_code
			when not matched then
				insert (DB.name, DB.job, DB.birthday, DB.agency_code)
				values (E.name, E.job, E.birthday, E.agency_code);



create table TCL_tab(
col1 smallint,
col2 text,
col3 text
);

insert into TCL_tab values (1,'가','A'),(2,'나','B'),(3,'다','C');

table tcl_tab

begin;
insert into TCL_tab values (4,'라','D');
savepoint A;
update TCL_tab set col2='나' where col1 in(1,3);
savepoint B;
delete from TCL_tab where col2 = '라';
rollback to A;
delete from TCL_tab where col2 = '나';
commit

table TCL_tab
