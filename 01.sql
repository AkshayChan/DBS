SELECT DISTINCT uun
FROM students 
WHERE uun NOT IN (SELECT student FROM exams);
