(SELECT DISTINCT examco.uun, examco.name
FROM (SELECT foo.uun, foo.name, SUM(CASE WHEN foo.course = fin.course THEN 1 ELSE 0 END) AS total
      FROM (SELECT ps.uun, ps.name, pe.course
            FROM students AS ps, exams AS pe
            WHERE ps.uun = pe.student
            ORDER BY ps.uun) foo, 
           (SELECT ps.uun, pp.course
            FROM students AS ps, degrees AS pd, programmes AS pp
            WHERE ps.degree = pd.code 
            AND pd.code = pp.degree
            ORDER BY ps.uun) fin
      WHERE foo.uun = fin.uun
      GROUP BY foo.uun, foo.name) examco,
     (SELECT ps.uun, COUNT(pp.course) as coursetotal
      FROM students AS ps, degrees AS pd, programmes AS pp
      WHERE ps.degree = pd.code 
      AND pd.code = pp.degree
      GROUP BY ps.uun
      ORDER BY ps.uun) totco
WHERE examco.total = totco.coursetotal
ORDER BY examco.uun)
UNION
SELECT DISTINCT uun, name 
FROM students
WHERE degree NOT IN (SELECT degree FROM programmes);
