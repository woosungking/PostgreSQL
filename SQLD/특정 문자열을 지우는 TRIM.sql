select LTRIM('xxYYZZxYZxx','x'); -- 대소문자 구분 함.

select RTRIM('xxYYZZxYZXx','x');

select TRIM('x' from 'xxYYZZxYZXx'); -- 양쪽에 있는 문자열을 지워주고, 중간에 껴있는건 못지워줌, rtrim, ltrim의 병합본.
