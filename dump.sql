SELECT  S.SURNAME,S.NAME FROM students  S
LEFT  JOIN Registrations R ON (r.student_id = S.id AND R.course_id = 4)
WHERE   r.id IS NULL
ORDER BY S.SURNAME DESC