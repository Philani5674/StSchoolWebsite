-- Create the Departments table
CREATE TABLE Departments (
    DepartmentId INT PRIMARY KEY Identity,
    DepartmentName NVARCHAR(50)
);

-- Create the Courses table
CREATE TABLE Courses (
    CourseId INT PRIMARY KEY Identity,
    CourseName NVARCHAR(50),
    DepartmentId INT
);


CREATE TABLE [dbo].[ClassRoom] (
    [ClassId]      INT     IDENTITY Primary key,
    [ClassName]    NVARCHAR (50) ,
    [DepartmentId] INT       
);

-- Create the Users table
CREATE TABLE Users (
    UserId INT PRIMARY KEY Identity,
    Username NVARCHAR(50),
    Password NVARCHAR(50),
    Role NVARCHAR(50),
    DepartmentId INT
);

-- Create the Students table
CREATE TABLE Students (
    StudentId INT PRIMARY KEY Identity,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    ParentHomeAddress NVARCHAR(100),
    ClassGrade INT,
    DepartmentId INT,
    UserId INT
);

-- Create the Teachers table
CREATE TABLE Teachers (
    TeacherId INT PRIMARY KEY Identity,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentId INT,
    UserId INT
);


CREATE TABLE AdminTb (
    AdminId INT PRIMARY KEY Identity,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentId INT,
    UserId INT
);

-- Create the Principal table
CREATE TABLE Principal (
    PrincipalId INT PRIMARY KEY Identity,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    UserId INT
);


-- Create the Grades table
CREATE TABLE Grades (
    GradeId INT PRIMARY KEY Identity,
    StudentId INT,
    ClassId INT,
    CourseId INT,
    Grade DECIMAL(4, 2)
);

-- Create the Registration table
CREATE TABLE Registration (
    RegistrationId INT PRIMARY KEY Identity,
    StudentId INT,
    ClassId INT,
    RegistrationYear INT,
    AmountPaid decimal(8,2),
    Fees DECIMAL(8, 2)
);

-- Populate the Departments table
INSERT INTO Departments (DepartmentName)
VALUES
    ( 'Science'),
    ( 'History'),
    ( 'Commerce');

-- Populate the Courses table
INSERT INTO Courses ( CourseName, DepartmentId)
VALUES
    -- Science department courses
    ( 'IsiZulu', 1),
    ( 'Mathematics', 1),
    ( 'English', 1),
    ( 'Life Sciences', 1),
    ( 'Physical Sciences', 1),
    ( 'Life Orientation', 1),
    ( 'Agriculture', 1),
    --History department courses
    ( 'IsiZulu', 2),
    ( 'English', 2),
    ( 'Mathematics Literacy', 2),
    ( 'Life Orientation', 2),
    ( 'Life Sciences', 2),
    ( 'History', 2),
    ( 'Geography', 2),
    --Commerce department courses
    ( 'IsiZulu', 3),
    ( 'Mathematics', 3),
    ( 'English', 3),
    ( 'Life Orientation', 3),
    ( 'Accounting', 3),
    ( 'Business Studies', 3),
    ( 'Economics', 3);

-- Populate the Users table
INSERT INTO Users (Username, Password, Role, DepartmentId)
VALUES
    ('admin', 'admin123', 'admin', 1),
    ( 'teacher1', 'teacher123', 'teacher', 1),
    ( 'teacher2', 'teacher123', 'teacher', 2),
    ( 'principal1', 'principal123', 'principal',2),
    ( 'student1', 'stu001','student',1),
    ('student2','stu002','student',2),
    ('student3','stu003','student',3),
    ( 'student4', 'stu004','student',1),
    ('student5','stu005','student',2),
    ('student6','stu004','student',3),
    ( 'student7', 'stu007','student',1),
    ('student8','stu008','student',2),
    ('student9','stu009','student',3),
    ( 'student10', 'stu010','student',1),
    ('student11','stu011','student',3),
    ('student12','stu012','student',2),
    ('student13','stu013','student',3),
    ( 'student14', 'stu014','student',1),
    ('student15','stu015','student',2),
    ('student16','stu016','student',3),
    ( 'student17', 'stu017','student',1),
    ('student18','stu018','student',2),
    ('student19','stu019','student',3),
    ( 'student20', 'stu020','student',1),
    ('student21','stu021','student',2),
    ('student22','stu022','student',3),
    ('student23','stu023','student',2),
    ('student24','stu024','student',3),
    ( 'student25', 'stu025','student',1),
    ('student26','stu026','student',2),
    ('student27','stu027','student',3),
    ( 'student28', 'stu028','student',1),
    ('student29','stu029','student',2),
    ('student30','stu030','student',3);
    
-- Populate the Students table
INSERT INTO Students ( FirstName, LastName, ParentHomeAddress, ClassGrade, DepartmentId, UserId)
VALUES

    ( 'John', 'Doe', '123 Main St', 8, 1, 5),
    ( 'Jane', 'Smith', '456 Elm St', 9, 2, 6),
    ( 'Michael', 'Johnson', '789 Oak St', 10, 3, 7),
    ( 'lunga', 'Nkabi', '9 kick St', 11, 3, 8),
    ( 'Mandla', 'Mjula', '789 Oak St', 12, 3, 9),
    ( 'Puleng', 'Mopuleng', '789 Oak St', 10, 3, 10),
    ( 'fahlaza', 'mjubadeli', '789 Oak St', 9, 3, 11),
    ( 'Mikhal', 'Johnson', '789 Oak St', 8, 3, 12),
    ( 'Gloria', 'Septhember', '789 Oak St', 9, 3, 13),
    ( 'mkhulu', 'mkhulwana', '789 Oak St', 7, 3, 14),
    ( 'kahlela', 'jonga', '789 Oak St', 8, 3, 15),
    ( 'koko', 'kokosi', '789 Oak St', 9, 3, 16),
    ( 'hubede', 'vusani', '789 Oak St', 9, 3, 17),
    ( 'webar', 'webinar', '789 Oak St', 9, 3, 18),
    ( 'holokosho', 'Johnson', '789 Oak St', 8, 3, 19),
    ( 'Khulanabo', 'Johnson', '789 Oak St', 10, 3, 20),
    ( 'Khle', 'Johnson', '789 Oak St', 9, 3, 21),
    ( 'Mjibha', 'Johnson', '789 Oak St', 12, 3, 22),
    ( 'Andile', 'Johnson', '789 Oak St', 12, 3, 23),
    ( 'Mkhanyiselwa', 'Johnson', '789 Oak St', 12, 3, 24),
    ( 'Mjista', 'Mfene', '789 Oak St', 12, 3, 25),
    ( 'Michael', 'kalula', '789 Oak St', 12, 3, 26),
    ( 'Michael', 'Goba', '789 Oak St', 12, 3, 27),
    ( 'Twitter', 'Chrome', '789 Oak St', 12, 3, 28),
    ( 'Facebook', 'Brave', '789 Oak St', 11, 3, 29),
    ( 'Word', 'PowerPoint', '789 Oak St', 11, 3, 30);

-- Populate the Teachers table
INSERT INTO Teachers ( FirstName, LastName, DepartmentId, UserId)
VALUES
    ( 'Thungela', 'Onion', 1, 2),
    ( 'Dumani', 'Ngalapawu', 2, 3);

-- Populate the Principal table
INSERT INTO Principal ( FirstName, LastName, UserId)
VALUES
    ( 'Principal', 'One', 4);

INSERT INTO AdminTb ( FirstName, LastName, UserId)
VALUES
    ( 'Mulenga', 'Mkhubazi', 1);

-- Grades for John Doe (StudentId = 1)
INSERT INTO Grades ( StudentId, ClassId, CourseId, Grade)
VALUES
    ( 1, 1, 1, 85.5),    -- Mathematics (Science)
    ( 1, 1, 2, 90.0),    -- English (Science)
    ( 1, 1, 3, 78.2),    -- Life Sciences (Science)
    ( 1, 1, 4, 85.0),   -- History (History)
    ( 1, 1, 5, 80.5),   -- Geography (History)
    ( 1, 1, 6, 79.8),   -- Mathematics (Commerce)
    ( 1, 1, 7, 88.4);  -- Business Studies (Commerce)

-- Grades for Jane Smith (StudentId = 2)
INSERT INTO Grades ( StudentId, ClassId, CourseId, Grade)
VALUES
    ( 2, 1, 8, 75.8),    -- IsiZulu (Science)
    ( 2, 1, 9, 88.2),    -- English (Science)
    ( 2, 1, 10, 92.0),   -- Mathematics Literacy (History)
    ( 2, 1, 11, 87.5),   -- Life Orientation (History)
    ( 2, 1, 12, 81.7),   -- Mathematics (Commerce)
    ( 2, 1, 13, 90.5),   -- English (Commerce)
    ( 2, 1, 14, 85.8);   -- Geography (Commerce)

-- Grades for Michael Johnson (StudentId = 3)
INSERT INTO Grades ( StudentId, ClassId, CourseId, Grade)
VALUES
    ( 3, 1, 15, 93.7),    -- Mathematics (Science)
    ( 3, 1, 16, 87.9),    -- English (Science)
    ( 3, 1, 17, 80.0),    -- Life Sciences (Science)
    ( 3, 1, 18, 89.5),   -- History (History)
    ( 3, 1, 19, 86.2),   -- Business Studies (Commerce)
    ( 3, 1, 20, 92.4),   -- Economics (Commerce)
    ( 3, 1, 21, 84.8);   -- IsiZulu (Commerce)

-- Registration for John Doe (StudentId = 1)
INSERT INTO Registration ( StudentId, ClassId, RegistrationYear, Fees, AmountPaid)
VALUES
    (1,1, 2022, 5000.00, 5000.00);

-- Registration for Jane Smith (StudentId = 2)
INSERT INTO Registration ( StudentId, ClassId, RegistrationYear, Fees, AmountPaid)
VALUES
    ( 2,1, 2022, 5000.00, 4500.00);

-- Registration for Michael Johnson (StudentId = 3)
INSERT INTO Registration ( StudentId, ClassId, RegistrationYear, Fees, AmountPaid)
VALUES
    ( 3,1, 2022, 5000.00, 3000.00),
    ( 4,2, 2022, 5000.00, 5000.00),
    ( 5,2, 2022, 5000.00, 1000.00),
    ( 6,2, 2022, 5000.00, 2000.00),
    ( 7,2, 2022, 5000.00, 2500.00),
    ( 8,2, 2022, 5000.00, 5000.00),
    ( 9,2, 2022, 5000.00, 4000.00),
    ( 10,2, 2022, 5000.00, 3000.00),
    ( 11,3, 2022, 5000.00, 1500.00),
    ( 12,3, 2022, 5000.00, 1200.00),
    ( 13,3, 2022, 5000.00, 1100.00),
    ( 14,3, 2022, 5000.00, 900.00),
    ( 15,3, 2022, 5000.00, 600.00),
    ( 16,3, 2022, 5000.00, 400.00),
    ( 17,3, 2022, 5000.00, 4000.00),
    ( 18,3, 2022, 5000.00, 2800.00),
    ( 19,3, 2022, 5000.00, 4500.00),
    ( 20,4, 2022, 5000.00, 3200.00),
    ( 21,4, 2022, 5000.00, 2200.00),
    ( 22,4, 2022, 5000.00, 200.00),
    ( 23,4, 2022, 5000.00, 300.00),
    ( 24,4, 2022, 5000.00, 100.00),
    ( 25,4, 2022, 5000.00, 100.00),
    ( 26,4, 2022, 5000.00, 100.00);


INSERT INTO Grades ( StudentId, ClassId, CourseId, Grade)
VALUES
        
    ( 4, 2, 9, 88.2),    -- English (Science)
    ( 4, 2, 10, 92.0),   -- Mathematics Literacy (History)
    ( 4, 2, 11, 87.5),   -- Life Orientation (History)
    ( 4, 2, 12, 81.7),   -- Mathematics (Commerce)
    ( 4, 2, 13, 90.5),   -- English (Commerce)
    ( 4, 2, 14, 85.8),   -- Geography (Commerce)
    ( 5, 2, 8, 75.8),    -- IsiZulu (Science)
    ( 5, 2, 9, 88.2),    -- English (Science)
    ( 5, 2, 10, 92.0),   -- Mathematics Literacy (History)
    ( 5, 2, 11, 87.5),   -- Life Orientation (History)
    ( 5, 2, 12, 81.7),   -- Mathematics (Commerce)
    ( 5, 2, 13, 90.5),   -- English (Commerce)
    ( 5, 2, 14, 85.8),   -- Geography (Commerce)
    ( 6, 2, 8, 75.8),    -- IsiZulu (Science)
    ( 6, 2, 9, 88.2),    -- English (Science)
    ( 6, 2, 10, 92.0),   -- Mathematics Literacy (History)
    ( 6, 2, 11, 87.5),   -- Life Orientation (History)
    ( 6, 2, 12, 81.7),   -- Mathematics (Commerce)
    ( 6, 2, 13, 90.5),   -- English (Commerce)
    ( 6, 2, 14, 85.8),   -- Geography (Commerce)
    ( 7, 2, 8, 75.8),    -- IsiZulu (Science)
    ( 7, 2, 9, 88.2),    -- English (Science)
    ( 7, 2, 10, 92.0),   -- Mathematics Literacy (History)
    ( 7, 2, 11, 87.5),   -- Life Orientation (History)
    ( 7, 2, 12, 81.7),   -- Mathematics (Commerce)
    ( 7, 2, 13, 90.5),   -- English (Commerce)
    ( 7, 2, 14, 85.8),   -- Geography (Commerce)
    ( 8, 2, 8, 75.8),    -- IsiZulu (Science)
    ( 8, 2, 9, 88.2),    -- English (Science)
    ( 8, 2, 10, 92.0),   -- Mathematics Literacy (History)
    ( 8, 2, 11, 87.5),   -- Life Orientation (History)
    ( 8, 2, 12, 81.7),   -- Mathematics (Commerce)
    ( 8, 2, 13, 90.5),   -- English (Commerce)
    ( 8, 2, 14, 85.8),   -- Geography (Commerce)
    ( 9, 2, 8, 75.8),    -- IsiZulu (Science)
    ( 9, 2, 9, 88.2),    -- English (Science)
    ( 9, 2, 10, 92.0),   -- Mathematics Literacy (History)
    ( 9, 2, 11, 87.5),   -- Life Orientation (History)
    ( 9, 2, 12, 81.7),   -- Mathematics (Commerce)
    ( 9, 2, 13, 90.5),   -- English (Commerce)
    ( 9, 2, 14, 85.8),   -- Geography (Commerce)
    ( 10, 2, 8, 75.8),   -- IsiZulu (Science)
    ( 10, 2, 9, 88.2),   -- English (Science)
    ( 10, 2, 10, 92.0),  -- Mathematics Literacy (History)
    ( 10, 2, 11, 87.5),  -- Life Orientation (History)
    ( 10, 2, 12, 81.7),  -- Mathematics (Commerce)
    ( 10, 2, 13, 90.5),  -- English (Commerce)
    ( 10, 2, 14, 85.8);  -- Geography (Commerce)


INSERT INTO Grades ( StudentId, ClassId, CourseId, Grade)
VALUES
    ( 11, 3, 8, 75.8),    -- IsiZulu (Science)
    ( 11, 3, 9, 88.2),    -- English (Science)
    ( 11, 3, 10, 92.0),   -- Mathematics Literacy (History)
    ( 11, 3, 11, 87.5),   -- Life Orientation (History)
    ( 11, 3, 12, 81.7),   -- Mathematics (Commerce)
    ( 11, 3, 13, 90.5),   -- English (Commerce)
    ( 11, 3, 14, 85.8),   -- Geography (Commerce)
    ( 12, 3, 8, 75.8),    -- IsiZulu (Science)
    ( 12, 3, 9, 88.2),    -- English (Science)
    ( 12, 3, 10, 92.0),   -- Mathematics Literacy (History)
    ( 12, 3, 11, 87.5),   -- Life Orientation (History)
    ( 12, 3, 12, 81.7),   -- Mathematics (Commerce)
    ( 12, 3, 13, 90.5),   -- English (Commerce)
    ( 12, 3, 14, 85.8),   -- Geography (Commerce)
    ( 13, 3, 8, 75.8),    -- IsiZulu (Science)
    ( 13, 3, 9, 88.2),    -- English (Science)
    ( 13, 3, 10, 92.0),   -- Mathematics Literacy (History)
    ( 13, 3, 11, 87.5),   -- Life Orientation (History)
    ( 13, 3, 12, 81.7),   -- Mathematics (Commerce)
    ( 13, 3, 13, 90.5),   -- English (Commerce)
    ( 13, 3, 14, 85.8),  -- Geography (Commerce)
    ( 14, 3, 8, 75.8),   -- IsiZulu (Science)
    ( 14, 3, 9, 88.2),   -- English (Science)
    ( 14, 3, 10, 92.0),  -- Mathematics Literacy (History)
    ( 14, 3, 11, 87.5),  -- Life Orientation (History)
    ( 14, 3, 12, 81.7),  -- Mathematics (Commerce)
    ( 14, 3, 13, 90.5),  -- English (Commerce)
    ( 14, 3, 14, 85.8);  -- Geography (Commerce)


INSERT INTO Grades ( StudentId, ClassId, CourseId, Grade)
VALUES
    ( 15, 3, 15, 93.7),    -- Mathematics (Science)
    ( 15, 3, 16, 87.9),    -- English (Science)
    ( 15, 3, 17, 80.0),    -- Life Sciences (Science)
    ( 15, 3, 18, 89.5),    -- History (History)
    ( 15, 3, 19, 86.2),    -- Business Studies (Commerce)
    ( 15, 3, 20, 92.4),    -- Economics (Commerce)
    ( 15, 3, 21, 84.8),    -- IsiZulu (Commerce)
    ( 16, 3, 15, 91.2),    -- Mathematics (Science)
    ( 16, 3, 16, 85.6),    -- English (Science)
    ( 16, 3, 17, 78.3),    -- Life Sciences (Science)
    ( 16, 3, 18, 88.7),    -- History (History)
    ( 16, 3, 19, 82.4),    -- Business Studies (Commerce)
    ( 16, 3, 20, 90.9),    -- Economics (Commerce)
    ( 16, 3, 21, 83.2),    -- IsiZulu (Commerce)
    ( 17, 3, 15, 89.5),    -- Mathematics (Science)
    ( 17, 3, 16, 83.2),    -- English (Science)
    ( 17, 3, 17, 76.9),    -- Life Sciences (Science)
    ( 17, 3, 18, 86.3),    -- History (History)
    ( 17, 3, 19, 80.1),    -- Business Studies (Commerce)
    ( 17, 3, 20, 88.6),    -- Economics (Commerce)
    ( 17, 3, 21, 81.9),    -- IsiZulu (Commerce)
    ( 18, 3, 15, 88.2),    -- Mathematics (Science)
    ( 18, 3, 16, 81.7),    -- English (Science)
    ( 18, 3, 17, 75.4),    -- Life Sciences (Science)
    ( 18, 3, 18, 85.8),    -- History (History)
    ( 18, 3, 19, 79.6),    -- Business Studies (Commerce)
    ( 18, 3, 20, 88.1),    -- Economics (Commerce)
    ( 18, 3, 21, 81.4),    -- IsiZulu (Commerce)
    ( 19, 3, 15, 86.7),    -- Mathematics (Science)
    ( 19, 3, 16, 80.3),    -- English (Science)
    ( 19, 3, 17, 73.8),    -- Life Sciences (Science)
    ( 19, 3, 18, 83.9),    -- History (History)
    ( 19, 3, 19, 77.7),    -- Business Studies (Commerce)
    ( 19, 3, 20, 86.4),    -- Economics (Commerce)
    ( 19, 3, 21, 79.7),    -- IsiZulu (Commerce)
    ( 20, 4, 15, 84.5),    -- Mathematics (Science)
    ( 20, 4, 16, 78.1),    -- English (Science)
    ( 20, 4, 17, 71.6),    -- Life Sciences (Science)
    ( 20, 4, 18, 81.7),    -- History (History)
    ( 20, 4, 19, 75.5),    -- Business Studies (Commerce)
    ( 20, 4, 20, 84.2),    -- Economics (Commerce)
    ( 20, 4, 21, 77.5),    -- IsiZulu (Commerce)
    ( 21, 4, 15, 82.8),    -- Mathematics (Science)
    ( 21, 4, 16, 76.4),    -- English (Science)
    ( 21, 4, 17, 69.9),    -- Life Sciences (Science)
    ( 21, 4, 18, 79.9),    -- History (History)
    ( 21, 4, 19, 73.7),    -- Business Studies (Commerce)
    ( 21, 4, 20, 82.4),    -- Economics (Commerce)
    ( 21, 4, 21, 75.7),    -- IsiZulu (Commerce)
    ( 22, 4, 15, 80.6),    -- Mathematics (Science)
    ( 22, 4, 16, 74.2),    -- English (Science)
    ( 22, 4, 17, 67.7),    -- Life Sciences (Science)
    ( 22, 4, 18, 77.7),    -- History (History)
    ( 22, 4, 19, 71.5),    -- Business Studies (Commerce)
    ( 22, 4, 20, 80.2),    -- Economics (Commerce)
    ( 22, 4, 21, 73.5),    -- IsiZulu (Commerce)
    ( 23, 4, 15, 78.3),    -- Mathematics (Science)
    ( 23, 4, 16, 71.9),    -- English (Science)
    ( 23, 4, 17, 65.4),    -- Life Sciences (Science)
    ( 23, 4, 18, 75.5),    -- History (History)
    ( 23, 4, 19, 69.3),    -- Business Studies (Commerce)
    ( 23, 4, 20, 78.0),    -- Economics (Commerce)
    ( 23, 4, 21, 71.3),    -- IsiZulu (Commerce)
    ( 24, 4, 15, 76.1),    -- Mathematics (Science)
    ( 24, 4, 16, 69.7),    -- English (Science)
    ( 24, 4, 17, 63.2),    -- Life Sciences (Science)
    ( 24, 4, 18, 73.3),    -- History (History)
    ( 24, 4, 19, 67.1),    -- Business Studies (Commerce)
    ( 24, 4, 20, 75.8),    -- Economics (Commerce)
    ( 24, 4, 21, 69.1),    -- IsiZulu (Commerce)
    ( 25, 4, 15, 73.9),    -- Mathematics (Science)
    ( 25, 4, 16, 67.5),    -- English (Science)
    ( 25, 4, 17, 61.0),    -- Life Sciences (Science)
    ( 25, 4, 18, 71.1),    -- History (History)
    ( 25, 4, 19, 64.9),    -- Business Studies (Commerce)
    ( 25, 4, 20, 73.6),    -- Economics (Commerce)
    ( 25, 4, 21, 67.9),    -- IsiZulu (Commerce)
    ( 26, 4, 15, 71.7),    -- Mathematics (Science)
    ( 26, 4, 16, 65.3),    -- English (Science)
    ( 26, 4, 17, 58.8),    -- Life Sciences (Science)
    ( 26, 4, 18, 68.9),    -- History (History)
    ( 26, 4, 19, 62.7),    -- Business Studies (Commerce)
    ( 26, 4, 20, 71.4),    -- Economics (Commerce)
    ( 26, 4, 21, 64.7);



INSERT INTO [dbo].[ClassRoom] ( [ClassName], [DepartmentId]) VALUES (N'Grade 10A', 1)
INSERT INTO [dbo].[ClassRoom] ( [ClassName], [DepartmentId]) VALUES (N'Grade 10B', 2)
INSERT INTO [dbo].[ClassRoom] ( [ClassName], [DepartmentId]) VALUES (N'Grade 10C', 3)
INSERT INTO [dbo].[ClassRoom] ( [ClassName], [DepartmentId]) VALUES (N'Grade 11A', 1)
INSERT INTO [dbo].[ClassRoom] ( [ClassName], [DepartmentId]) VALUES (N'Grade 11B', 2)
INSERT INTO [dbo].[ClassRoom] ( [ClassName], [DepartmentId]) VALUES (N'Grade 11C', 3)
INSERT INTO [dbo].[ClassRoom] ( [ClassName], [DepartmentId]) VALUES (N'Grade 12A', 1)
INSERT INTO [dbo].[ClassRoom] ( [ClassName], [DepartmentId]) VALUES (N'Grade 12B', 2)
INSERT INTO [dbo].[ClassRoom] ( [ClassName], [DepartmentId]) VALUES (N'Grade 12C', 3)
INSERT INTO [dbo].[ClassRoom] ( [ClassName], [DepartmentId]) VALUES ( N'Grade 10C', 3)
INSERT INTO [dbo].[ClassRoom] ( [ClassName], [DepartmentId]) VALUES ( N'Grade 11C', 3)
INSERT INTO [dbo].[ClassRoom] ( [ClassName], [DepartmentId]) VALUES ( N'Grade 12C', 3)