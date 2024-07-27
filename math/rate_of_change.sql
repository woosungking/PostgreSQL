-- ⭐ 변화율 (현제 판매량 - 이전 판매량) / 이전판매량

CREATE TABLE percent_change (
    department text,
    spend_2019 numeric(10,2),
    spend_2022 numeric(10,2)
);

table percent_change

insert into percent_change
values
    ('Assessor', 178556, 179500),
    ('Building', 250000, 289000),
    ('Clerk', 451980, 650000),
    ('Library', 87777, 90001),
    ('Parks', 250000, 223000),
    ('Water', 199000, 195000);

-- 문제: 가상의 지방 정부의 2019, 2022 변화율을 찾아보자..

select department, ((spend_2022-spend_2019)/spend_2019)*100 as change_of_rate
from percent_change
order by change_of_rate DESC



