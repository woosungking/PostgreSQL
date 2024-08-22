-- SELECT TO_CHAR(TO_DATE('2023.01.10 10', 'YYYY.MM.DD HH24')) AS formatted_date;

-- SELECT TO_CHAR(TO_DATE('2023.01.10 10', 'YYYY.MM.DD HH24'), 'YYYY-MM-DD HH24:MI:SS') AS formatted_date;
-- SELECT TO_CHAR(TO_DATE('2023.01.10 10', 'YYYY.MM.DD HH24')+1/24/(60/10), 'YYYY-MM-DD HH24:MI:SS') AS formatted_date;

select to_char(col1, 'YYMMDD HH24MISS') from tab1

select to_char(col1, 'YYMMDD') from tab1

select to_char(col1, 'Y-MM-DD') from tab1 -- 4-08-21
select to_char(col1, 'YY-MM-DD') from tab1 -- 24-08-21
select to_char(col1, 'YYY-MM-DD') from tab1 -- 023-08-21
select to_char(col1, 'YYYY-MM-DD') from tab1 -- 2034-08-21
-- 위 쿼리 결과로 보았을때 오른쪽에서 부터 읽는다는것을 확인 할 수 있음.

select to_char(col1, 'gffd-MM-DD') from tab1
-- 정해진 형식 Y, M, D, H 외 다른 문자를 지정하면 해당 문자열로 바뀌어서 나오게 된다.

select to_char(col1, 'gffd-MM-DD') from tab1


select to_date(col2, 'YYYY-MM-DD') from tab1
select to_date(col2, 'YYYYMMDD') from tab1 -- Date 형식은  0000-00-00 이런 포멧이라 어기면 오류 발생.
