CREATE TABLE export_table (
    name text,
    age smallint,
    gender varchar(2),
    home text
);

INSERT INTO export_table VALUES
('우성', 26, '남', '부천'),
('우민', 15, '남', '서울'),
('우순', 35, '여', '부산');

COPY export_table
TO '/Users/apple/Desktop/study/POSTGRESQL/export_table.txt'
WITH(FORMAT CSV, HEADER, DELIMITER'@');
-- 기본적인 내보내기. 가져오기는 from인데 내보내기는 to를 사용함, with에 제약조건 설정


COPY (
    SELECT name, home, age
    FROM export_table
    WHERE age > 20
)
TO '/Users/apple/Desktop/study/POSTGRESQL/export_specific_table_data.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '@');
-- 테이블에서 특정 부분의 데이터만 내보내는법. 조건물 사용 가능 문법 유의
CREATE TABLE export_table (
    name text,
    age smallint,
    gender varchar(2),
    home text
);

INSERT INTO export_table VALUES
('우성', 26, '남', '부천'),
('우민', 15, '남', '서울'),
('우순', 35, '여', '부산');

COPY export_table
TO '/Users/apple/Desktop/study/POSTGRESQL/export_table.txt'
WITH(FORMAT CSV, HEADER, DELIMITER'@');
-- 기본적인 내보내기. 가져오기는 from인데 내보내기는 to를 사용함, with에 제약조건 설정


COPY (
    SELECT name, home, age
    FROM export_table
    WHERE age > 20
)
TO '/Users/apple/Desktop/study/POSTGRESQL/export_specific_table_data.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '@');
-- 테이블에서 특정 부분의 데이터만 내보내는법. 조건물 사용 가능 문법 유의


