-- Create the Departments table
CREATE TABLE Departments (
    DepartmentId INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

-- Create the Courses table
CREATE TABLE Courses (
    CourseId INT PRIMARY KEY,
    CourseName NVARCHAR(50),
    DepartmentId INT
);

-- Create the Users table
CREATE TABLE Users (
    UserId INT PRIMARY KEY,
    Username NVARCHAR(50),
    Password NVARCHAR(50),
    Role NVARCHAR(50),
    DepartmentId INT
);

-- Create the Students table
CREATE TABLE Students (
    StudentId INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    ParentHomeAddress NVARCHAR(100),
    ClassGrade INT,
    DepartmentId INT,
    UserId INT
);

-- Create the Teachers table
CREATE TABLE Teachers (
    TeacherId INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentId INT,
    UserId INT
);

-- Create the Principal table
CREATE TABLE Principal (
    PrincipalId INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    UserId INT
);

-- Create the ClassRoom table
CREATE TABLE Class (
    ClassId INT PRIMARY KEY,
    ClassName NVARCHAR(50),
    DepartmentId INT
);

-- Create the Grades table
CREATE TABLE Grades (
    GradeId INT PRIMARY KEY,
    StudentId INT,
    ClassId INT,
    CourseId INT,
    Grade DECIMAL(4, 2)
);

-- Create the Registration table
CREATE TABLE Registration (
    RegistrationId INT PRIMARY KEY,
    StudentId INT,
    ClassId INT,
    RegistrationYear INT,
    Fees DECIMAL(8, 2),
    AmountPaid DECIMAL(8, 2)
);

-- Populate the Departments table
INSERT INTO Departments (DepartmentId, DepartmentName)
VALUES
    (1, 'Science'),
    (2, 'History'),
    (3, 'Commerce');

-- Populate the Courses table
INSERT INTO Courses (CourseId, CourseName, DepartmentId)
VALUES
    -- Science department courses
    (1, 'IsiZulu', 1),
    (2, 'Mathematics', 1),
    (3, 'English', 1),
    (4, 'Life Sciences', 1),
    (5, 'Physical Sciences', 1),
    (6, 'Life Orientation', 1),
    (7, 'Agriculture', 1),
    -- History department courses
    (8, 'IsiZulu', 2),
    (9, 'English', 2),
    (10, 'Mathematics Literacy', 2),
    (11, 'Life Orientation', 2),
    (12, 'Life Sciences', 2),
    (13, 'History', 2),
    (14, 'Geography', 2),
    -- Commerce department courses
    (15, 'IsiZulu', 3),
    (16, 'Mathematics', 3),
    (17, 'English', 3),
    (18, 'Life Orientation', 3),
    (19, 'Accounting', 3),
    (20, 'Business Studies', 3),
    (21, 'Economics', 3);

-- Populate the Users table
INSERT INTO Users (UserId, Username, Password, Role, DepartmentId)
VALUES
    (1, 'admin', 'admin123', 'admin', NULL),
    (2, 'teacher1', 'teacher123', 'teacher', 1),
    (3, 'teacher2', 'teacher123', 'teacher', 2),
    (4, 'principal1', 'principal123', 'principal', NULL),
    (5, 'student1', 'stu001','student',1),
    (6,'student2','stu002','student',2),
    (7,'student3','stu003','student',3);
    
-- Populate the Students table
INSERT INTO Students (StudentId, FirstName, LastName, ParentHomeAddress, ClassGrade, DepartmentId, UserId)
VALUES
    (1, 'John', 'Doe', '123 Main St', 8, 1, 5),
    (2, 'Jane', 'Smith', '456 Elm St', 9, 2, 6),
    (3, 'Michael', 'Johnson', '789 Oak St', 10, 3, 7);

-- Populate the Teachers table
INSERT INTO Teachers (TeacherId, FirstName, LastName, DepartmentId, UserId)
VALUES
    (1, 'Teacher', 'One', 1, 2),
    (2, 'Teacher', 'Two', 2, 3);

-- Populate the Principal table
INSERT INTO Principal (PrincipalId, FirstName, LastName, UserId)
VALUES
    (1, 'Principal', 'One', 4);

-- Grades for John Doe (StudentId = 1)
INSERT INTO Grades (GradeId, StudentId, ClassId, CourseId, Grade)
VALUES
    (1, 1, 1, 1, 85.5),    -- Mathematics (Science)
    (2, 1, 1, 2, 90.0),    -- English (Science)
    (3, 1, 1, 3, 78.2),    -- Life Sciences (Science)
    (4, 1, 1, 4, 85.0),   -- History (History)
    (5, 1, 1, 5, 80.5),   -- Geography (History)
    (6, 1, 1, 6, 79.8),   -- Mathematics (Commerce)
    (7, 1, 1, 7, 88.4);  -- Business Studies (Commerce)

-- Grades for Jane Smith (StudentId = 2)
INSERT INTO Grades (GradeId, StudentId, ClassId, CourseId, Grade)
VALUES
    (8, 2, 2, 8, 75.8),    -- IsiZulu (Science)
    (9, 2, 2, 9, 88.2),    -- English (Science)
    (10, 2, 2, 10, 92.0),   -- Mathematics Literacy (History)
    (11, 2, 2, 11, 87.5),   -- Life Orientation (History)
    (12, 2, 2, 12, 81.7),   -- Mathematics (Commerce)
    (13, 2, 2, 13, 90.5),   -- English (Commerce)
    (14, 2, 2, 14, 85.8);   -- Geography (Commerce)

-- Grades for Michael Johnson (StudentId = 3)
INSERT INTO Grades (GradeId, StudentId, ClassId, CourseId, Grade)
VALUES
    (18, 3, 3, 15, 93.7),    -- Mathematics (Science)
    (19, 3, 3, 16, 87.9),    -- English (Science)
    (20, 3, 3, 17, 80.0),    -- Life Sciences (Science)
    (21, 3, 3, 18, 89.5),   -- History (History)
    (22, 3, 3, 19, 86.2),   -- Business Studies (Commerce)
    (23, 3, 3, 20, 92.4),   -- Economics (Commerce)
    (24, 3, 3, 21, 84.8);   -- IsiZulu (Commerce)

-- Registration for John Doe (StudentId = 1)
INSERT INTO Registration (RegistrationId, StudentId, ClassId, RegistrationYear, Fees, AmountPaid)
VALUES
    (1, 1, 1, 2022, 5000.00, 5000.00);

-- Registration for Jane Smith (StudentId = 2)
INSERT INTO Registration (RegistrationId, StudentId, ClassId, RegistrationYear, Fees, AmountPaid)
VALUES
    (2, 2, 2, 2022, 5000.00, 4500.00);

-- Registration for Michael Johnson (StudentId = 3)
INSERT INTO Registration (RegistrationId, StudentId, ClassId, RegistrationYear, Fees, AmountPaid)
VALUES
    (3, 3, 3, 2022, 5000.00, 4000.00);


INSERT INTO Grades (GradeId, StudentId, ClassId, CourseId, Grade)
VALUES
        
    (25, 4, 2, 9, 88.2),    -- English (Science)
    (26, 4, 2, 10, 92.0),   -- Mathematics Literacy (History)
    (27, 4, 2, 11, 87.5),   -- Life Orientation (History)
    (28, 4, 2, 12, 81.7),   -- Mathematics (Commerce)
    (29, 4, 2, 13, 90.5),   -- English (Commerce)
    (30, 4, 2, 14, 85.8),   -- Geography (Commerce)
    (31, 5, 2, 8, 75.8),    -- IsiZulu (Science)
    (32, 5, 2, 9, 88.2),    -- English (Science)
    (33, 5, 2, 10, 92.0),   -- Mathematics Literacy (History)
    (34, 5, 2, 11, 87.5),   -- Life Orientation (History)
    (35, 5, 2, 12, 81.7),   -- Mathematics (Commerce)
    (36, 5, 2, 13, 90.5),   -- English (Commerce)
    (37, 5, 2, 14, 85.8),   -- Geography (Commerce)
    (38, 6, 2, 8, 75.8),    -- IsiZulu (Science)
    (39, 6, 2, 9, 88.2),    -- English (Science)
    (40, 6, 2, 10, 92.0),   -- Mathematics Literacy (History)
    (41, 6, 2, 11, 87.5),   -- Life Orientation (History)
    (42, 6, 2, 12, 81.7),   -- Mathematics (Commerce)
    (43, 6, 2, 13, 90.5),   -- English (Commerce)
    (44, 6, 2, 14, 85.8),   -- Geography (Commerce)
    (45, 7, 2, 8, 75.8),    -- IsiZulu (Science)
    (46, 7, 2, 9, 88.2),    -- English (Science)
    (47, 7, 2, 10, 92.0),   -- Mathematics Literacy (History)
    (48, 7, 2, 11, 87.5),   -- Life Orientation (History)
    (49, 7, 2, 12, 81.7),   -- Mathematics (Commerce)
    (50, 7, 2, 13, 90.5),   -- English (Commerce)
    (51, 7, 2, 14, 85.8),   -- Geography (Commerce)
    (52, 8, 2, 8, 75.8),    -- IsiZulu (Science)
    (53, 8, 2, 9, 88.2),    -- English (Science)
    (54, 8, 2, 10, 92.0),   -- Mathematics Literacy (History)
    (55, 8, 2, 11, 87.5),   -- Life Orientation (History)
    (56, 8, 2, 12, 81.7),   -- Mathematics (Commerce)
    (57, 8, 2, 13, 90.5),   -- English (Commerce)
    (58, 8, 2, 14, 85.8),   -- Geography (Commerce)
    (59, 9, 2, 8, 75.8),    -- IsiZulu (Science)
    (60, 9, 2, 9, 88.2),    -- English (Science)
    (61, 9, 2, 10, 92.0),   -- Mathematics Literacy (History)
    (62, 9, 2, 11, 87.5),   -- Life Orientation (History)
    (63, 9, 2, 12, 81.7),   -- Mathematics (Commerce)
    (64, 9, 2, 13, 90.5),   -- English (Commerce)
    (65, 9, 2, 14, 85.8),   -- Geography (Commerce)
    (66, 10, 2, 8, 75.8),   -- IsiZulu (Science)
    (67, 10, 2, 9, 88.2),   -- English (Science)
    (68, 10, 2, 10, 92.0),  -- Mathematics Literacy (History)
    (69, 10, 2, 11, 87.5),  -- Life Orientation (History)
    (70, 10, 2, 12, 81.7),  -- Mathematics (Commerce)
    (71, 10, 2, 13, 90.5),  -- English (Commerce)
    (72, 10, 2, 14, 85.8);  -- Geography (Commerce)


INSERT INTO Grades (GradeId, StudentId, ClassId, CourseId, Grade)
VALUES
    (73, 10, 3, 8, 75.8),    -- IsiZulu (Science)
    (74, 10, 3, 9, 88.2),    -- English (Science)
    (75, 10, 3, 10, 92.0),   -- Mathematics Literacy (History)
    (76, 10, 3, 11, 87.5),   -- Life Orientation (History)
    (77, 10, 3, 12, 81.7),   -- Mathematics (Commerce)
    (78, 10, 3, 13, 90.5),   -- English (Commerce)
    (79, 10, 3, 14, 85.8),   -- Geography (Commerce)
    (80, 11, 3, 8, 75.8),    -- IsiZulu (Science)
    (81, 11, 3, 9, 88.2),    -- English (Science)
    (82, 11, 3, 10, 92.0),   -- Mathematics Literacy (History)
    (83, 11, 3, 11, 87.5),   -- Life Orientation (History)
    (84, 11, 3, 12, 81.7),   -- Mathematics (Commerce)
    (85, 11, 3, 13, 90.5),   -- English (Commerce)
    (86, 11, 3, 14, 85.8),   -- Geography (Commerce)
    (87, 12, 3, 8, 75.8),    -- IsiZulu (Science)
    (88, 12, 3, 9, 88.2),    -- English (Science)
    (89, 12, 3, 10, 92.0),   -- Mathematics Literacy (History)
    (90, 12, 3, 11, 87.5),   -- Life Orientation (History)
    (91, 12, 3, 12, 81.7),   -- Mathematics (Commerce)
    (92, 12, 3, 13, 90.5),   -- English (Commerce)
    (93, 12, 3, 14, 85.8),   -- Geography (Commerce)
    (94, 13, 3, 8, 75.8),    -- IsiZulu (Science)
    (95, 13, 3, 9, 88.2),    -- English (Science)
    (96, 13, 3, 10, 92.0),   -- Mathematics Literacy (History)
    (97, 13, 3, 11, 87.5),   -- Life Orientation (History)
    (98, 13, 3, 12, 81.7),   -- Mathematics (Commerce)
    (99, 13, 3, 13, 90.5),   -- English (Commerce)
    (100, 13, 3, 14, 85.8),  -- Geography (Commerce)
    (101, 14, 3, 8, 75.8),   -- IsiZulu (Science)
    (102, 14, 3, 9, 88.2),   -- English (Science)
    (103, 14, 3, 10, 92.0),  -- Mathematics Literacy (History)
    (104, 14, 3, 11, 87.5),  -- Life Orientation (History)
    (105, 14, 3, 12, 81.7),  -- Mathematics (Commerce)
    (106, 14, 3, 13, 90.5),  -- English (Commerce)
    (107, 14, 3, 14, 85.8);  -- Geography (Commerce)


INSERT INTO Grades (GradeId, StudentId, ClassId, CourseId, Grade)
VALUES
    (108, 14, 3, 15, 93.7),    -- Mathematics (Science)
    (109, 14, 3, 16, 87.9),    -- English (Science)
    (110, 14, 3, 17, 80.0),    -- Life Sciences (Science)
    (111, 14, 3, 18, 89.5),    -- History (History)
    (112, 14, 3, 19, 86.2),    -- Business Studies (Commerce)
    (113, 14, 3, 20, 92.4),    -- Economics (Commerce)
    (114, 14, 3, 21, 84.8);    -- IsiZulu (Commerce)


INSERT INTO Grades (GradeId, StudentId, ClassId, CourseId, Grade)
VALUES
    (115, 15, 3, 15, 93.7),    -- Mathematics (Science)
    (116, 15, 3, 16, 87.9),    -- English (Science)
    (117, 15, 3, 17, 80.0),    -- Life Sciences (Science)
    (118, 15, 3, 18, 89.5),    -- History (History)
    (119, 15, 3, 19, 86.2),    -- Business Studies (Commerce)
    (120, 15, 3, 20, 92.4),    -- Economics (Commerce)
    (121, 15, 3, 21, 84.8),    -- IsiZulu (Commerce)
    (122, 16, 3, 15, 91.2),    -- Mathematics (Science)
    (123, 16, 3, 16, 85.6),    -- English (Science)
    (124, 16, 3, 17, 78.3),    -- Life Sciences (Science)
    (125, 16, 3, 18, 88.7),    -- History (History)
    (126, 16, 3, 19, 82.4),    -- Business Studies (Commerce)
    (127, 16, 3, 20, 90.9),    -- Economics (Commerce)
    (128, 16, 3, 21, 83.2),    -- IsiZulu (Commerce)
    (129, 17, 3, 15, 89.5),    -- Mathematics (Science)
    (130, 17, 3, 16, 83.2),    -- English (Science)
    (131, 17, 3, 17, 76.9),    -- Life Sciences (Science)
    (132, 17, 3, 18, 86.3),    -- History (History)
    (133, 17, 3, 19, 80.1),    -- Business Studies (Commerce)
    (134, 17, 3, 20, 88.6),    -- Economics (Commerce)
    (135, 17, 3, 21, 81.9),    -- IsiZulu (Commerce)
    (136, 18, 3, 15, 88.2),    -- Mathematics (Science)
    (137, 18, 3, 16, 81.7),    -- English (Science)
    (138, 18, 3, 17, 75.4),    -- Life Sciences (Science)
    (139, 18, 3, 18, 85.8),    -- History (History)
    (140, 18, 3, 19, 79.6),    -- Business Studies (Commerce)
    (141, 18, 3, 20, 88.1),    -- Economics (Commerce)
    (142, 18, 3, 21, 81.4),    -- IsiZulu (Commerce)
    (143, 19, 3, 15, 86.7),    -- Mathematics (Science)
    (144, 19, 3, 16, 80.3),    -- English (Science)
    (145, 19, 3, 17, 73.8),    -- Life Sciences (Science)
    (146, 19, 3, 18, 83.9),    -- History (History)
    (147, 19, 3, 19, 77.7),    -- Business Studies (Commerce)
    (148, 19, 3, 20, 86.4),    -- Economics (Commerce)
    (149, 19, 3, 21, 79.7),    -- IsiZulu (Commerce)
    (150, 20, 3, 15, 84.5),    -- Mathematics (Science)
    (151, 20, 3, 16, 78.1),    -- English (Science)
    (152, 20, 3, 17, 71.6),    -- Life Sciences (Science)
    (153, 20, 3, 18, 81.7),    -- History (History)
    (154, 20, 3, 19, 75.5),    -- Business Studies (Commerce)
    (155, 20, 3, 20, 84.2),    -- Economics (Commerce)
    (156, 20, 3, 21, 77.5),    -- IsiZulu (Commerce)
    (157, 21, 3, 15, 82.8),    -- Mathematics (Science)
    (158, 21, 3, 16, 76.4),    -- English (Science)
    (159, 21, 3, 17, 69.9),    -- Life Sciences (Science)
    (160, 21, 3, 18, 79.9),    -- History (History)
    (161, 21, 3, 19, 73.7),    -- Business Studies (Commerce)
    (162, 21, 3, 20, 82.4),    -- Economics (Commerce)
    (163, 21, 3, 21, 75.7),    -- IsiZulu (Commerce)
    (164, 22, 3, 15, 80.6),    -- Mathematics (Science)
    (165, 22, 3, 16, 74.2),    -- English (Science)
    (166, 22, 3, 17, 67.7),    -- Life Sciences (Science)
    (167, 22, 3, 18, 77.7),    -- History (History)
    (168, 22, 3, 19, 71.5),    -- Business Studies (Commerce)
    (169, 22, 3, 20, 80.2),    -- Economics (Commerce)
    (170, 22, 3, 21, 73.5),    -- IsiZulu (Commerce)
    (171, 23, 3, 15, 78.3),    -- Mathematics (Science)
    (172, 23, 3, 16, 71.9),    -- English (Science)
    (173, 23, 3, 17, 65.4),    -- Life Sciences (Science)
    (174, 23, 3, 18, 75.5),    -- History (History)
    (175, 23, 3, 19, 69.3),    -- Business Studies (Commerce)
    (176, 23, 3, 20, 78.0),    -- Economics (Commerce)
    (177, 23, 3, 21, 71.3),    -- IsiZulu (Commerce)
    (178, 24, 3, 15, 76.1),    -- Mathematics (Science)
    (179, 24, 3, 16, 69.7),    -- English (Science)
    (180, 24, 3, 17, 63.2),    -- Life Sciences (Science)
    (181, 24, 3, 18, 73.3),    -- History (History)
    (182, 24, 3, 19, 67.1),    -- Business Studies (Commerce)
    (183, 24, 3, 20, 75.8),    -- Economics (Commerce)
    (184, 24, 3, 21, 69.1),    -- IsiZulu (Commerce)
    (185, 25, 3, 15, 73.9),    -- Mathematics (Science)
    (186, 25, 3, 16, 67.5),    -- English (Science)
    (187, 25, 3, 17, 61.0),    -- Life Sciences (Science)
    (188, 25, 3, 18, 71.1),    -- History (History)
    (189, 25, 3, 19, 64.9),    -- Business Studies (Commerce)
    (190, 25, 3, 20, 73.6),    -- Economics (Commerce)
    (191, 25, 3, 21, 67.9),    -- IsiZulu (Commerce)
    (192, 26, 3, 15, 71.7),    -- Mathematics (Science)
    (193, 26, 3, 16, 65.3),    -- English (Science)
    (194, 26, 3, 17, 58.8),    -- Life Sciences (Science)
    (195, 26, 3, 18, 68.9),    -- History (History)
    (196, 26, 3, 19, 62.7),    -- Business Studies (Commerce)
    (197, 26, 3, 20, 71.4),    -- Economics (Commerce)
    (198, 26, 3, 21, 64.7),    -- IsiZulu (Commerce)
    (199, 27, 3, 15, 69.5),    -- Mathematics (Science)
    (200, 27, 3, 16, 63.1),    -- English (Science)
    (201, 27, 3, 17, 56.6),    -- Life Sciences (Science)
    (202, 27, 3, 18, 66.7),    -- History (History)
    (203, 27, 3, 19, 60.5),    -- Business Studies (Commerce)
    (204, 27, 3, 20, 69.2),    -- Economics (Commerce)
    (205, 27, 3, 21, 62.5),    -- IsiZulu (Commerce)
    (206, 28, 3, 15, 67.3),    -- Mathematics (Science)
    (207, 28, 3, 16, 60.9),    -- English (Science)
    (208, 28, 3, 17, 54.4),    -- Life Sciences (Science)
    (209, 28, 3, 18, 64.5),    -- History (History)
    (210, 28, 3, 19, 58.3),    -- Business Studies (Commerce)
    (211, 28, 3, 20, 67.0),    -- Economics (Commerce)
    (212, 28, 3, 21, 60.3),    -- IsiZulu (Commerce)
    (213, 29, 3, 15, 65.1),    -- Mathematics (Science)
    (214, 29, 3, 16, 58.7),    -- English (Science)
    (215, 29, 3, 17, 52.2),    -- Life Sciences (Science)
    (216, 29, 3, 18, 62.3),    -- History (History)
    (217, 29, 3, 19, 56.1),    -- Business Studies (Commerce)
    (218, 29, 3, 20, 64.8),    -- Economics (Commerce)
    (219, 29, 3, 21, 58.1),    -- IsiZulu (Commerce)
    (220, 30, 3, 15, 62.9),    -- Mathematics (Science)
    (221, 30, 3, 16, 56.5),    -- English (Science)
    (222, 30, 3, 17, 50.0),    -- Life Sciences (Science)
    (223, 30, 3, 18, 60.1),    -- History (History)
    (224, 30, 3, 19, 53.9),    -- Business Studies (Commerce)
    (225, 30, 3, 20, 62.6),    -- Economics (Commerce)
    (226, 30, 3, 21, 55.9);    -- IsiZulu (Commerce)
