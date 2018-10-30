SELECT DISTINCT foo.uun, (cast(foo.avg as decimal(18,2))) as avg
FROM (SELECT ps.uun, AVG(pe.grade)
      FROM students as ps, exams as pe
      WHERE ps.uun = pe.student
      GROUP BY ps.uun
      ORDER BY avg DESC) foo
WHERE foo.avg >= 75;
