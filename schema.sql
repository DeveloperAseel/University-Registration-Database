PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS sections;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    enrollment_year INTEGER NOT NULL CHECK (enrollment_year >= 2020),
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE instructors (
    instructor_id INTEGER PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    course_code VARCHAR(12) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    credit_hours INTEGER NOT NULL CHECK (credit_hours BETWEEN 1 AND 6),
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE sections (
    section_id INTEGER PRIMARY KEY,
    course_id INTEGER NOT NULL,
    instructor_id INTEGER NOT NULL,
    semester VARCHAR(20) NOT NULL,
    academic_year INTEGER NOT NULL,
    capacity INTEGER NOT NULL CHECK (capacity > 0),
    room VARCHAR(20) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    section_id INTEGER NOT NULL,
    enrollment_date DATE NOT NULL,
    status VARCHAR(15) NOT NULL DEFAULT 'ENROLLED'
        CHECK (status IN ('ENROLLED', 'COMPLETED', 'DROPPED')),
    grade VARCHAR(2) CHECK (grade IN ('A+', 'A', 'B+', 'B', 'C+', 'C', 'D', 'F')),
    UNIQUE (student_id, section_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (section_id) REFERENCES sections(section_id)
);

CREATE INDEX idx_students_department ON students(department_id);
CREATE INDEX idx_sections_course ON sections(course_id);
CREATE INDEX idx_enrollments_student ON enrollments(student_id);
CREATE INDEX idx_enrollments_section ON enrollments(section_id);
