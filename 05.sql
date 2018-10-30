(SELECT pd.code AS degree, SUM(foo.credits) AS credits
 FROM (SELECT pp.degree, pp.course, pc.code, pc.credits
       FROM programmes pp, courses pc
       WHERE pp.course = pc.code) foo, degrees pd
 WHERE pd.code = foo.degree
 GROUP BY pd.code)
UNION
(SELECT code, 0
 FROM degrees
 WHERE code NOT IN (SELECT degree FROM programmes));
