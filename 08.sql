SELECT DISTINCT fin.course
FROM (SELECT pp.course, COUNT(pp.course) as count
      FROM degrees AS pd, programmes as pp
      WHERE pd.type = 'PG' 
      AND pd.code = pp.degree
      GROUP BY pp.course) fin
WHERE fin.count = 1
ORDER BY fin.course;
