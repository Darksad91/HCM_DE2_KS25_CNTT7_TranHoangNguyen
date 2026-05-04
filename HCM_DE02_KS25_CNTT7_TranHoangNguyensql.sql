CREATE DATABASE CenterManagement;
USE CenterManagement;

CREATE TABLE course(
    id_course INT PRIMARY KEY AUTO_INCREMENT,
    name_course VARCHAR(255) NOT NULL,
    lecturer VARCHAR(255) NOT NULL,
    tuition DECIMAL,
    duration CHAR(50)
);

CREATE TABLE student (
    id_student INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phonenumber CHAR(10) UNIQUE,
    dob DATE NOT NULL,
);

CREATE TABLE enrollment (
    id_enrollment INT AUTO_INCREMENT PRIMARY KEY,
    date_enrollment DATE NOT NULL,
    formality_pay BOOLEAN,
);

CREATE TABLE enrollment_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_enrollment INT,
    id_course INT,
    FOREIGN KEY (id_enrollment) REFERENCES course,
    FOREIGN KEY (id_course) REFERENCES enrollment,
    STATUS BOOLEAN,
    end_point INT
);

ALTER TABLE Enrollment
add ghi_chu VARCHAR(255);

ALTER TABLE course
change lecturer Giao_Vien VARCHAR(255) NOT NULL;

DROP enrollment_Detail;
DROP enrollment;

INSERT INTO course VALUES
(NULL, 'Toan 1', 'Nguyen Van A', 100000, 500),
(NULL, 'Ngu van 1', 'Nguyen Thi B', 2000000, 700),
(NULL, 'IELTS 6.5', 'Tran Van C' 2000000, 700),
(NULL, 'Vat ly 1', 'Ha Van D' 1000000, 500);
(NULL, 'Hoa hoc 1', 'Tran Anh' 1000000, 500);

INSERT INTO student VALUES
(NULL, 'Tran Hoang A', 'THA123@gmail.com', 0823456789),
(NULL, 'Nguyen Thi B', 'NTB123@gmail.com', 0923456789),
(NULL, 'Tran Van C', 'TVC123@gmail.com', 0323456789);
(NULL, 'Nguyen Hong D', 'NHD123@gmail.com', 0812345678),
(NULL, 'Le Van E', 'LVE123@gmail.com', 0912345678);

INSERT INTO enrollment VALUES
(NULL, '2025-01-01', 'Chuyển khoản'),
(NULL, '2025-02-01', 'Tiền mặt'),
(NULL, '2025-03-01', 'Tiền mặt');
(NULL, '2025-04-01', 'Chuyển khoản'),
(NULL, '2026-07-01', 'Tiền mặt');

SELECT * FROM course;
SELECT * FROM student;
SELECT * FROM enrollment;

UPDATE course
SET tuition * 1.1
WHERE Giao_Vien = 'Tran Anh';

DELETE FROM student
WHERE email = NULL;

-- cau 1
SELECT *
FROM course
WHERE tuition BETWEEN 1000000 AND 3000000;
