(SELECT pp.course 
FROM degrees AS pd, programmes as pp
WHERE pd.type = 'UG' 
AND pd.code = pp.degree 
ORDER BY pd.code)
INTERSECT
(SELECT pp.course 
FROM degrees AS pd, programmes as pp
WHERE pd.type = 'PG' 
AND pd.code = pp.degree 
ORDER BY pd.code);
