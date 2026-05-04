CREATE DATABASE CenterManagement;
USE CenterManagement;

CREATE TABLE course (
    id_course INT PRIMARY KEY AUTO_INCREMENT,
    name_course VARCHAR(255) NOT NULL,
    lecturer VARCHAR(255) NOT NULL,
    tuition DECIMAL(15, 2),
    duration VARCHAR(50)
);

CREATE TABLE student (
    id_student INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phonenumber CHAR(10) UNIQUE,
    dob DATE
);

CREATE TABLE enrollment (
    id_enrollment INT PRIMARY KEY AUTO_INCREMENT,
    id_student INT,
    date_enrollment DATE NOT NULL,
    formality_pay VARCHAR(50),
    FOREIGN KEY (id_student) REFERENCES student(id_student)
);

CREATE TABLE enrollment_detail (
    id_detail INT PRIMARY KEY AUTO_INCREMENT,
    id_enrollment INT,
    id_course INT,
    status VARCHAR(50),
    end_point INT,
    FOREIGN KEY (id_enrollment) REFERENCES enrollment(id_enrollment),
    FOREIGN KEY (id_course) REFERENCES course(id_course)
);

ALTER TABLE enrollment ADD Ghi_chu TEXT;

ALTER TABLE course CHANGE lecturer Giao_Vien VARCHAR(255) NOT NULL;

INSERT INTO course (name_course, Giao_Vien, tuition, duration) VALUES
('Toan 1', 'Nguyen Van A', 500000, '3 thang'),
('Ngu van 1', 'Nguyen Thi B', 1500000, '3 thang'),
('IELTS 6.5', 'Tran Van C', 2500000, '6 thang'),
('Vat ly 1', 'Ha Van D', 1200000, '3 thang'),
('Hoa hoc 1', 'Tran Anh', 2000000, '3 thang');

INSERT INTO student (fullname, email, phonenumber, dob) VALUES
('Tran Hoang A', 'THA123@gmail.com', '0823456789', '2005-01-01'),
('Nguyen Thi B', 'NTB123@gmail.com', '0923456789', '2005-02-01'),
('Tran Van C', 'TVC123@gmail.com', '0323456789', '2005-03-01'),
('Nguyen Hong D', NULL, '0812345678', '2005-04-01'),
('Le Van E', 'LVE123@gmail.com', '0912345678', '2005-05-01');

INSERT INTO enrollment (id_student, date_enrollment, formality_pay) VALUES
(1, '2025-01-01', 'Chuyen khoan'),
(2, '2026-07-15', 'Tien mat'),
(3, '2026-07-20', 'Tien mat'),
(4, '2025-04-01', 'Chuyen khoan'),
(5, '2025-05-01', 'Tien mat');

INSERT INTO enrollment_detail (id_enrollment, id_course, status, end_point) VALUES
(1, 5, 'Dang hoc', NULL),
(2, 3, 'Dang học', NULL),
(3, 2, 'Hoan thanh', 8),
(4, 1, 'Dang hoc', NULL),
(5, 3, 'Hoan thanh', 7);

UPDATE course SET tuition = tuition * 10% WHERE Giao_Vien = 'Tran Anh';

DELETE FROM student WHERE email IS NULL;

