select LTRIM('xxYYZZxYZxx','x'); -- 대소문자 구분 함.

select RTRIM('xxYYZZxYZXx','x');

select TRIM('x' from 'xxYYZZxYZXx'); -- 양쪽에 있는 문자열을 지워주고, 중간에 껴있는건 못지워줌, rtrim, ltrim의 병합본.


-- 지우려는 문자열이 아래 예시처럼 여러개가 있다면 그중 하나라도 포함이 된다면 지워짐

insert into tab1 values
('ORACLE','DATABASE'),('SQL','DEVELOPER');

table tab1

select LTRIM(COL1,'RO') from tab1
select LTRIM(COL1,'OR') from tab1
select LTRIM(COL1,'OR') from tab1
select LTRIM(COL1,'OF') from tab1
select LTRIM(COL1,'FO') from tab1
select LTRIM(COL1,'RFO') from tab1
-- 전부 다 같은 결괏값임.



-- 어디에 있던간에 trim처럼 양 옆에만 봐주는게 아닌 중간에도 해당사항이 있으면 대체해준다.
insert into tab2 values
('아이즈원조유리');

select replace('아이즈원조유리','조유리','최예나') from tab2

select replace('아이즈원조유리','조','최') from tab2

select replace('아이즈원조유리','원','메롱메롱') from tab2

select replace('아이즈원조유리','조유리','') from tab2