SELECT
    s.student_id,
    s.full_name AS student,
    c.course_code,
    c.course_name,
    e.status
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN sections sec ON sec.section_id = e.section_id
JOIN courses c ON c.course_id = sec.course_id
ORDER BY s.full_name, c.course_code;

SELECT
    c.course_code,
    c.course_name,
    COUNT(CASE WHEN e.status = 'ENROLLED' THEN 1 END) AS enrolled_students,
    sec.capacity,
    sec.capacity - COUNT(CASE WHEN e.status = 'ENROLLED' THEN 1 END) AS available_seats
FROM sections sec
JOIN courses c ON c.course_id = sec.course_id
LEFT JOIN enrollments e ON e.section_id = sec.section_id
GROUP BY sec.section_id, c.course_code, c.course_name, sec.capacity
ORDER BY enrolled_students DESC;

SELECT
    i.full_name AS instructor,
    COUNT(sec.section_id) AS assigned_sections,
    SUM(c.credit_hours) AS total_credit_hours
FROM instructors i
LEFT JOIN sections sec ON sec.instructor_id = i.instructor_id
LEFT JOIN courses c ON c.course_id = sec.course_id
GROUP BY i.instructor_id, i.full_name
ORDER BY total_credit_hours DESC;

SELECT
    d.department_name,
    COUNT(DISTINCT s.student_id) AS students,
    COUNT(DISTINCT c.course_id) AS courses
FROM departments d
LEFT JOIN students s ON s.department_id = d.department_id
LEFT JOIN courses c ON c.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

SELECT s.student_id, s.full_name
FROM students s
LEFT JOIN enrollments e
    ON e.student_id = s.student_id
    AND e.status = 'ENROLLED'
WHERE e.enrollment_id IS NULL;

SELECT
    s.student_id,
    s.full_name,
    ROUND(AVG(CASE e.grade
        WHEN 'A+' THEN 4.0
        WHEN 'A' THEN 3.75
        WHEN 'B+' THEN 3.5
        WHEN 'B' THEN 3.0
        WHEN 'C+' THEN 2.5
        WHEN 'C' THEN 2.0
        WHEN 'D' THEN 1.0
        WHEN 'F' THEN 0.0
    END), 2) AS gpa
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
WHERE e.status = 'COMPLETED'
GROUP BY s.student_id, s.full_name;
