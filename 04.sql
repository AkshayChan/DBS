SELECT DISTINCT final.student
FROM (SELECT foo.student, SUM(CASE WHEN foo.grade < 40 THEN 1 ELSE 0 END) AS failed, COUNT(foo.grade) AS total
      FROM (SELECT student, grade
            FROM exams
            ORDER BY student) foo
      GROUP BY foo.student
      ORDER BY foo.student) final
WHERE (cast(((final.failed*100.00)/final.total) as decimal(18,2))) > 30;
