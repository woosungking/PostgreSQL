table district_2020
-- 1	"Oak Street School"
-- 2	"Roosevelt High School"
-- 5	"Dover Middle School"
-- 6	"Webutuck High School"

table district_2035
-- 1	"Oak Street School"
-- 2	"Roosevelt High School"
-- 3	"Morrison Elementary"
-- 4	"Chase Magnet Academy"
-- 6	"Webutuck High School"




-- UNION 연산자 -> 합집합(A + B - A 교집합 B )

select * from district_2020
union
select * from district_2035
order by id
-- 1	"Oak Street School"
-- 2	"Roosevelt High School"
-- 3	"Morrison Elementary"
-- 4	"Chase Magnet Academy"
-- 5	"Dover Middle School"
-- 6	"Webutuck High School"


-- A + B => UNION ALL
select * from district_2020
union all
select * from district_2035
order by id
-- 1	"Oak Street School"
-- 1	"Oak Street School"
-- 2	"Roosevelt High School"
-- 2	"Roosevelt High School"
-- 3	"Morrison Elementary"
-- 4	"Chase Magnet Academy"
-- 5	"Dover Middle School"
-- 6	"Webutuck High School"
-- 6	"Webutuck High School"

-- A 교집합 B => INTERSECT

select * from district_2020
intersect
select * from district_2035

-- A - B => EXCEPT

select * from district_2020
except
select * from district_2035
