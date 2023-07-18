using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

public class SchoolDatabaseManager
{
    private const string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=SchoolWebsite;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

    public SchoolDatabaseManager()
    {
    }

    public string getCoString()
    {
        return connectionString;
    }

    // Department Methods

    

    

    // Course Methods

    

    public List<Course> GetCoursesByDepartment(int departmentId)
    {
        List<Course> courses = new List<Course>();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT CourseId, CourseName FROM Courses WHERE DepartmentId = @DepartmentId";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@DepartmentId", departmentId);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        int courseId = reader.GetInt32(0);
                        string courseName = reader.GetString(1);

                        Course course = new Course(courseId, courseName, departmentId);
                        courses.Add(course);
                    }
                }
            }
        }

        return courses;
    }

    // User Methods

    public void AddUser( string username, string password, string role, int departmentId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Users (Username, Password, Role, DepartmentId) VALUES (@UserId, @Username, @Password, @Role, @DepartmentId)";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                
                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@Password", password);
                command.Parameters.AddWithValue("@Role", role);
                command.Parameters.AddWithValue("@DepartmentId", departmentId);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public string GetClassNameById(int classId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT ClassName FROM ClassRoom WHERE ClassId = @ClassId";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ClassId", classId);

                connection.Open();
                string className = (string)command.ExecuteScalar();
                return className;
            }
        }
    }


    public string GetDepartmentNameById(int departmentId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT DepartmentName FROM Departments WHERE DepartmentId = @DepartmentId";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@DepartmentId", departmentId);

                connection.Open();
                string departmentName = (string)command.ExecuteScalar();
                return departmentName;
            }
        }
    }



    public User GetUserById(int userId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT UserId, Username, Password, Role, DepartmentId FROM Users WHERE UserId = @UserId";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@UserId", userId);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string username = reader.GetString(1);
                        string password = reader.GetString(2);
                        string role = reader.GetString(3);
                        int departmentId = reader.GetInt32(4);

                        User user = new User(userId, username, password, role, departmentId);
                        return user;
                    }
                }
            }
        }

        return null;
    }


    public Student GetStudentByUserId(int userId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
        
            // Retrieve additional student information from the Students table using the UserId
            String query = "SELECT StudentId, FirstName, LastName, ParentHomeAddress, ClassGrade, DepartmentId FROM Students WHERE Userid = @UserId";
            using (SqlCommand studentCommand = new SqlCommand(query, connection))
            {
                studentCommand.Parameters.AddWithValue("@UserId", userId);
                connection.Open();
                using (SqlDataReader studentReader = studentCommand.ExecuteReader())
                {
                    if (studentReader.Read())
                    {
                        int studentId = studentReader.GetInt32(0);
                        string firstName = studentReader.GetString(1);
                        string lastName = studentReader.GetString(2);
                        string parentHomeAddress = studentReader.GetString(3);
                        int classGrade = studentReader.GetInt32(4);
                        int studentDepartmentId = studentReader.GetInt32(5);

                        // Create a Student object with the retrieved data
                        Student student = new Student(studentId, firstName, lastName, parentHomeAddress, classGrade, studentDepartmentId, userId);
                        studentReader.Close();
                        return student;
                    }

                    return null;
                }
            }
        }
    }


    public List<Student> GetAllStudents()
    {
        List<Student> students = new List<Student>();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            // Retrieve all student information from the Students table
            string query = "SELECT StudentId, FirstName, LastName, ParentHomeAddress, ClassGrade, DepartmentId, UserId FROM Students";
            using (SqlCommand studentCommand = new SqlCommand(query, connection))
            {
                connection.Open();
                using (SqlDataReader studentReader = studentCommand.ExecuteReader())
                {
                    while (studentReader.Read())
                    {
                        int studentId = studentReader.GetInt32(0);
                        string firstName = studentReader.GetString(1);
                        string lastName = studentReader.GetString(2);
                        string parentHomeAddress = studentReader.GetString(3);
                        int classGrade = studentReader.GetInt32(4);
                        int studentDepartmentId = studentReader.GetInt32(5);
                        int userId = studentReader.GetInt32(6);

                        // Create a Student object with the retrieved data
                        Student student = new Student(studentId, firstName, lastName, parentHomeAddress, classGrade, studentDepartmentId, userId);
                        students.Add(student);
                    }

                    studentReader.Close();
                }
            }
        }

        return students;
    }






    public User GetUserByUsernameAndPassword(string username, string password)
    {
        User user = null;

        // Implement your database query logic here to fetch the user based on the username and password
        // You can use ADO.NET or any ORM (Object-Relational Mapping) framework to interact with the database

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM Users WHERE Username = @Username AND Password = @Password";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Username", username);
            command.Parameters.AddWithValue("@Password", password);

            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    int userId = Convert.ToInt32(reader["UserId"]);
                    string role = reader["Role"].ToString();
                    int departmentId = Convert.ToInt32(reader["DepartmentId"]);

                    // Create a new User object with the retrieved data
                    user = new User(userId, username, password, role, departmentId);
                }
            }
            catch (Exception ex)
            {
                // Handle the exception or log the error
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }

        return user;
    }


    public string GetRolebyPasswordAndUsername(string username, string password)
    {
        string role = "";

        // Implement your database query logic here to fetch the user role based on the username and password
        // You can use ADO.NET or any ORM (Object-Relational Mapping) framework to interact with the database

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT Role FROM Users WHERE Username = @Username AND Password = @Password";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Username", username);
            command.Parameters.AddWithValue("@Password", password);

            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    role = reader["Role"].ToString();
                }
            }
            catch (Exception ex)
            {
                // Handle the exception or log the error
                
            }
        }

        return role;
    }


    // Teacher Methods

    public void AddTeacher(int teacherId, string firstName, string lastName, int departmentId, int userId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Teachers (TeacherId, FirstName, LastName, DepartmentId, UserId) VALUES (@TeacherId, @FirstName, @LastName, @DepartmentId, @UserId)";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@TeacherId", teacherId);
                command.Parameters.AddWithValue("@FirstName", firstName);
                command.Parameters.AddWithValue("@LastName", lastName);
                command.Parameters.AddWithValue("@DepartmentId", departmentId);
                command.Parameters.AddWithValue("@UserId", userId);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public Teacher GetTeacherById(int teacherId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT TeacherId, FirstName, LastName, DepartmentId, UserId FROM Teachers WHERE TeacherId = @TeacherId";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@TeacherId", teacherId);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string firstName = reader.GetString(1);
                        string lastName = reader.GetString(2);
                        int departmentId = reader.GetInt32(3);
                        int userId = reader.GetInt32(4);

                        Teacher teacher = new Teacher(teacherId, firstName, lastName, departmentId, userId);
                        return teacher;
                    }
                }
            }
        }

        return null;
    }

    // Principal Methods

    public void AddPrincipal(int principalId, string firstName, string lastName, int userId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Principal (PrincipalId, FirstName, LastName, UserId) VALUES (@PrincipalId, @FirstName, @LastName, @UserId)";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@PrincipalId", principalId);
                command.Parameters.AddWithValue("@FirstName", firstName);
                command.Parameters.AddWithValue("@LastName", lastName);
                command.Parameters.AddWithValue("@UserId", userId);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public Principal GetPrincipalById(int principalId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT PrincipalId, FirstName, LastName, UserId FROM Principal WHERE PrincipalId = @PrincipalId";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@PrincipalId", principalId);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string firstName = reader.GetString(1);
                        string lastName = reader.GetString(2);
                        int userId = reader.GetInt32(3);

                        Principal principal = new Principal(principalId, firstName, lastName, userId);
                        return principal;
                    }
                }
            }
        }

        return null;
    }

    // Grade Methods

    public void AddGrade(int gradeId, int studentId, int courseId, decimal grade)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Grades (GradeId, StudentId, CourseId, Grade) VALUES (@GradeId, @StudentId, @CourseId, @Grade)";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@GradeId", gradeId);
                command.Parameters.AddWithValue("@StudentId", studentId);
                command.Parameters.AddWithValue("@CourseId", courseId);
                command.Parameters.AddWithValue("@Grade", grade);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public List<Grade> GetGradesByStudent(int studentId)
    {
        List<Grade> grades = new List<Grade>();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT GradeId, StudentId, CourseId, Grade FROM Grades WHERE StudentId = @StudentId";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@StudentId", studentId);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        int gradeId = reader.GetInt32(0);
                        int courseId = reader.GetInt32(2);
                        decimal grade = reader.GetDecimal(3);

                        Grade grade1 = new Grade(gradeId, studentId, courseId, grade);
                        grades.Add(grade1);
                    }
                }
            }
        }

        return grades;
    }
}

public class Department
{
    public int DepartmentId { get; set; }
    public string DepartmentName { get; set; }

    public Department(int departmentId, string departmentName)
    {
        DepartmentId = departmentId;
        DepartmentName = departmentName;
    }
}

public class Course
{
    public int CourseId { get; set; }
    public string CourseName { get; set; }
    public int DepartmentId { get; set; }

    public Course(int courseId, string courseName, int departmentId)
    {
        CourseId = courseId;
        CourseName = courseName;
        DepartmentId = departmentId;
    }
}

public class User
{
    public int UserId { get; set; }
    public string Username { get; set; }
    public string Password { get; set; }
    public string Role { get; set; }
    public int DepartmentId { get; set; }

    public User(int userId, string username, string password, string role, int departmentId)
    {
        UserId = userId;
        Username = username;
        Password = password;
        Role = role;
        DepartmentId = departmentId;
    }
}

public class Teacher
{
    public int TeacherId { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public int DepartmentId { get; set; }
    public int UserId { get; set; }

    public Teacher(int teacherId, string firstName, string lastName, int departmentId, int userId)
    {
        TeacherId = teacherId;
        FirstName = firstName;
        LastName = lastName;
        DepartmentId = departmentId;
        UserId = userId;
    }
}

public class Principal
{
    public int PrincipalId { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public int UserId { get; set; }

    public Principal(int principalId, string firstName, string lastName, int userId)
    {
        PrincipalId = principalId;
        FirstName = firstName;
        LastName = lastName;
        UserId = userId;
    }
}

public class Grade
{
    public int GradeId { get; set; }
    public int StudentId { get; set; }
    public int CourseId { get; set; }
    public decimal GradeValue { get; set; }

    public Grade(int gradeId, int studentId, int courseId, decimal gradeValue)
    {
        GradeId = gradeId;
        StudentId = studentId;
        CourseId = courseId;
        GradeValue = gradeValue;
    }



   
    }




public class Student
{
    public int StudentId { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string ParentHomeAddress { get; set; }
    public int ClassGrade { get; set; }
    public int DepartmentId { get; set; }
    public int UserId { get; set; }
   

    public Student(int studentId, string firstName, string lastName, string parentHomeAddress, int classGrade, int departmentId, int userId)
    {
        StudentId = studentId;
        FirstName = firstName;
        LastName = lastName;
        ParentHomeAddress = parentHomeAddress;
        ClassGrade = classGrade;
        DepartmentId = departmentId;
        UserId = userId;
        
    }
}

