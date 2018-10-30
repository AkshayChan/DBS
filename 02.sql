SELECT COUNT(uun) as "postgrad"
FROM students ps, degrees pd
WHERE ps.degree = pd.code AND pd.type = 'PG';
