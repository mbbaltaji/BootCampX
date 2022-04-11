SELECT students.name as student, AVG(assignment_submissions.duration) as avg_assignment_duration, AVG(assignments.duration) as avg_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON  assignments.id = assignment_id
WHERE end_date IS NULL
GROUP BY student;
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY avg_assignment_duration;

