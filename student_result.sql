CREATE DATABASE student_result_db;
USE student_result_db;

-- Table 1: Departments
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Table 2: Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    gender VARCHAR(10),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Table 3: Marks
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
-- Departments
INSERT INTO Departments VALUES 
(1, 'Computer Science'),
(2, 'Electronics'),
(3, 'Mechanical');

-- Students
INSERT INTO Students VALUES
(101, 'Amit Kumar', 'Male', 1),
(102, 'Riya Sharma', 'Female', 1),
(103, 'Neha Singh', 'Female', 2),
(104, 'Rohit Das', 'Male', 3),
(105, 'Pooja Patel', 'Female', 2);

-- Marks
INSERT INTO Marks VALUES
(1, 101, 'Math', 85),
(2, 101, 'DBMS', 90),
(3, 102, 'Math', 78),
(4, 102, 'DBMS', 88),
(5, 103, 'Electronics', 92),
(6, 103, 'Circuits', 80),
(7, 104, 'Mechanics', 70),
(8, 104, 'Thermo', 75),
(9, 105, 'Electronics', 88),
(10, 105, 'Circuits', 95);

Q-a-->Show all students with their department names:
SELECT s.student_name, s.gender, d.dept_name
FROM Students s
JOIN Departments d ON s.dept_id = d.dept_id;

Q-b-->Show average marks of each student:
SELECT s.student_name, AVG(m.marks) AS avg_marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.student_name;

Q-c-->Show toppers (students with average marks > 85):
SELECT s.student_name, AVG(m.marks) AS avg_marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.student_name
HAVING AVG(m.marks) > 85;

Q-d-->Find department-wise average marks:
SELECT d.dept_name, AVG(m.marks) AS dept_avg
FROM Departments d
JOIN Students s ON d.dept_id = s.dept_id
JOIN Marks m ON s.student_id = m.student_id
GROUP BY d.dept_name;

Q-e-->Find highest marks in each subject:
SELECT subject, MAX(marks) AS highest_marks
FROM Marks
GROUP BY subject;

