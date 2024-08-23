	-- 오답노트
select 
-- rownum,
student_name, 
score, 
rank() over(partition by student_name order by score desc) 
from 
(select student_name, sum(score) over(partition by student_name) as score );

SELECT 
    student_name, 
    total_score AS score, 
    RANK() OVER(PARTITION BY student_name ORDER BY total_score DESC) AS rank

	-- 수정
FROM 
(
    SELECT 
        student_name, 
        SUM(score) AS total_score
    FROM 
        exam_result
    GROUP BY 
        student_name
) AS subquery;