SELECT DISTINCT fin.student, foo.date
FROM (SELECT student, date, COUNT(date) AS count
      FROM exams
      GROUP BY student, date) fin,
     (SELECT student, MAX(date) as date
      FROM exams
      GROUP BY student) foo
WHERE fin.student = foo.student
AND fin.date = foo.date
AND fin.count > 1 
ORDER BY fin.student, foo.date;
