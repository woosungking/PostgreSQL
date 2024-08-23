create table category(
category_type text,
category_name text,
parent_category text
);

insert into category values
('대','컴퓨터/디지털/가전',null),
('중','컴퓨터','컴퓨터/디지털/가전'),
('중','디지털','컴퓨터/디지털/가전'),
('중','가전','컴퓨터/디지털/가전'),
('소','노트북/PC','컴퓨터'),
('소','모니터/프린트','컴퓨터'),
('소','모바일/테블릿','디지털'),
('소','카메라','디지털'),
('소','영상가전','가전'),
('소','음향가전','가전');

table category

select 
B.category_type, B.category_name, -- 대분류
M.category_type, M.category_name -- 중분류
from category B, category M -- self join
where M.parent_category = B.category_name -- 중분류의 상위 카테고리(parent_category)와 상위 부모의 카테고리 이름과 같아야
-- and B.category_type = '대';

select 
B.category_type, B.category_name, -- 대분류
M.category_type, M.category_name, -- 중분류
S.category_type, S.category_name -- 소분류
from category B, category M, category S -- self join
where M.parent_category = B.category_name
and S.parent_category = M.category_name

select