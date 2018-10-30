SELECT DISTINCT fin.uun, SUM(CASE WHEN fin.grade >= 80 THEN 1 ELSE 0 END) AS "A",
SUM(CASE WHEN fin.grade >= 60 AND fin.grade <=79 THEN 1 ELSE 0 END) AS "B",
SUM(CASE WHEN fin.grade >= 40 AND fin.grade <=59 THEN 1 ELSE 0 END) AS "C",
SUM(CASE WHEN fin.grade <40 THEN 1 ELSE 0 END) AS "D"     
FROM (SELECT ps.uun, pe.grade
      FROM students AS ps, exams AS pe
      WHERE ps.uun = pe.student
      ORDER BY ps.uun, pe.grade DESC) fin
GROUP BY fin.uun
ORDER BY fin.uun;