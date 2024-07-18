create table char_data_type(
	char_column char(10),
	varchar_column varchar(10),
	text_column text
);
--char 형식은 char(n) n번째까지 데이터를 채우지 않는다면 빈자리를 알아서 채워줌
--varchar(n) 형식은 n자리수 까지의 문자열만 입력이 가능
--text 는 가변적으로 늘어남.
--결론: 웬만 해선 text를 쓰고,

select * from char_data_type

insert into char_data_type (char_column, varchar_column, text_column)
values
	('abc', 'abc', 'abc'),
    ('ABCDEF', 'ABCDEF', 'ABCDEF');

select * from char_data_type

COPY char_data_type TO '/Users/apple/Desktop/ex.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

--text 파일로 테이블을 내보낼수있다.
