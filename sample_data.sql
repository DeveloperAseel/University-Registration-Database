INSERT INTO departments VALUES
    (1, 'Information Technology'),
    (2, 'Computer Science'),
    (3, 'Business Administration');

INSERT INTO students VALUES
    (1001, 'Sara Alharbi', 'sara.alharbi@university.edu', 2024, 1),
    (1002, 'Nora Alotaibi', 'nora.alotaibi@university.edu', 2023, 1),
    (1003, 'Layan Alqahtani', 'layan.alqahtani@university.edu', 2024, 2),
    (1004, 'Reem Alshammari', 'reem.alshammari@university.edu', 2022, 2),
    (1005, 'Hessa Aldossari', 'hessa.aldossari@university.edu', 2025, 3),
    (1006, 'Maha Almutairi', 'maha.almutairi@university.edu', 2025, 1);

INSERT INTO instructors VALUES
    (201, 'Dr. Amal Saleh', 'amal.saleh@university.edu', 1),
    (202, 'Dr. Huda Ali', 'huda.ali@university.edu', 1),
    (203, 'Dr. Rana Omar', 'rana.omar@university.edu', 2),
    (204, 'Dr. Wafa Ahmed', 'wafa.ahmed@university.edu', 3);

INSERT INTO courses VALUES
    (301, 'IT201', 'Database Fundamentals', 3, 1),
    (302, 'IT310', 'Information Security', 3, 1),
    (303, 'IT330', 'Web Development', 3, 1),
    (304, 'CS210', 'Data Structures', 4, 2),
    (305, 'CS350', 'Artificial Intelligence', 3, 2),
    (306, 'BUS220', 'Project Management', 3, 3);

INSERT INTO sections VALUES
    (401, 301, 201, 'Fall', 2026, 30, 'T201'),
    (402, 302, 202, 'Fall', 2026, 25, 'T305'),
    (403, 303, 201, 'Fall', 2026, 28, 'T210'),
    (404, 304, 203, 'Summer', 2026, 35, 'C112'),
    (405, 305, 203, 'Fall', 2026, 24, 'C208'),
    (406, 306, 204, 'Fall', 2026, 40, 'B101');

INSERT INTO enrollments VALUES
    (501, 1001, 401, '2026-08-20', 'ENROLLED', NULL),
    (502, 1001, 402, '2026-08-20', 'ENROLLED', NULL),
    (503, 1002, 401, '2026-08-21', 'ENROLLED', NULL),
    (504, 1002, 403, '2026-08-21', 'ENROLLED', NULL),
    (505, 1003, 404, '2026-06-10', 'COMPLETED', 'B+'),
    (506, 1003, 405, '2026-08-22', 'ENROLLED', NULL),
    (507, 1004, 405, '2026-08-23', 'DROPPED', NULL),
    (508, 1004, 404, '2026-06-10', 'COMPLETED', 'A'),
    (509, 1005, 406, '2026-08-24', 'ENROLLED', NULL),
    (510, 1006, 401, '2026-08-24', 'ENROLLED', NULL);
