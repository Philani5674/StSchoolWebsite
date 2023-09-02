using StSchoolWebsite3rdYearProject.DataAccess;
using StSchoolWebsite3rdYearProject.models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Linq;

public class SchoolDatabaseManager:Data
{
    


    private const string connectionString = "Data Source=146.230.177.46;User ID=grouppmb10;Password=********;" +
        "Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;" +
        "ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

    DataContext dataContext = new DataContext(connectionString);


    public SchoolDatabaseManager()
    {
    }

    public string getCoString()
    {
        return connectionString;
    }


    // Courses Methods
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

    // Payment Methods
    public void updatePayment(int studentId, decimal amount)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {

            string query = "Update Registration set amountpaid = @amount where studentid = @Stud";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@amount", amount);
                command.Parameters.AddWithValue("@Stud", studentId);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }


    // Registration Methods
    public void AddRegistration(int studentId, int classid, decimal amount)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {

            string query = "INSERT INTO Registration ( StudentId, ClassId, RegistrationYear, Fees, AmountPaid) VALUES   (@Stud, @ci, @year, @amount, 0.00 )";
            using (SqlCommand command = new SqlCommand(query, connection))
            {

                command.Parameters.AddWithValue("@Stud", studentId);
                command.Parameters.AddWithValue("@ci", classid);
                command.Parameters.AddWithValue("@year", DateTime.Now.Year);
                command.Parameters.AddWithValue("@amount", amount);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public Registration GetRegistrationbyid(int studentid)
    {
        Registration reg = null;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM Registration WHERE StudentId = @id";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@id", studentid);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        int a = reader.GetInt32(0);
                        int b = reader.GetInt32(1);
                        int c = reader.GetInt32(2);
                        int d = reader.GetInt32(3);
                        decimal e = reader.GetDecimal(4);
                        decimal f= reader.GetDecimal(5);
                        reg = new Registration(a, b, c, d, e, f);
                        
                    }
                }

            }
        }

        return reg ;
        
    }


    //class methods
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


    // Department methods
    public string GetDepartmentNameById(int departmentId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query1 = "SELECT DepartmentName FROM Departments WHERE DepartmentId = @DepartmentId";
            using (SqlCommand command = new SqlCommand(query1, connection))
            {
                command.Parameters.AddWithValue("@DepartmentId", departmentId);

                connection.Open();
                string departmentName = (string)command.ExecuteScalar();
                return departmentName;
            }

            Table<Department> departments = dataContext.GetTable<Department>();

            var query = from department in departments
                        where department.DepartmentId == departmentId
                        select department.DepartmentName;
            return query.ToString();
        }
    }


    // student methods
    public Student GetStudentByUserId(int userId)
    {

        return GetAllStudents().FirstOrDefault(s =>s.UserId ==userId);
    }

    public void ApproveStudent(int userId)
    {


        using (var dataContext = new DataContext(connectionString))
        {
           
           
                    var student = dataContext.GetTable<Student>().FirstOrDefault(s => s.UserId == userId);
                    if (student != null)
                    {
                        
                        student.ClassGrade = 1;
                        updatestudent(student.ClassGrade,student.UserId);
                        dataContext.Connection.Open();
                        dataContext.SubmitChanges(); 
                        
                // Save changes to the database
                         // Commit the transaction
                    }
                
               
            
        }

    }

    public void updatestudent(int grade, int userid)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {

            string query = "Update Students set ClassGrade = @amount where UserId = @Stud";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@amount", grade);
                command.Parameters.AddWithValue("@Stud",userid );
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }



    public List<Student> GetAllStudents()
    {
        return dataContext.GetTable<Student>().ToList<Student>();
    }

    public List<Student> GetAllNotApproved()
    {
        return GetAllStudents().FindAll(s => s.ClassGrade ==0);
    }

    public DataTable GetAllStudentsDetails()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("StudentId", typeof(int));
        dt.Columns.Add("StudentName", typeof(string));
        dt.Columns.Add("AmountPaid", typeof(decimal));
        dt.Columns.Add("AmountOwed", typeof(decimal));
        dt.Columns.Add("Registration", typeof(int));
        dt.Columns.Add("Classroom", typeof(string));


        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            // Retrieve all student information from the Students table
            string query = "SELECT Students.StudentId, Students.FirstName, Students.LastName," +
                " Registration.Fees, Registration.AmountPaid, Registration.RegistrationYear," +
                " ClassRoom.ClassName FROM Students , Registration, ClassRoom " +
                "where Registration.StudentId = Students.StudentId and ClassRoom.ClassId = Registration.ClassId";
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
                        decimal amountOwed = studentReader.GetDecimal(3);
                        decimal amountPaid = studentReader.GetDecimal(4);
                        int registrationYear = studentReader.GetInt32(5);
                        string userId = studentReader.GetString(6);


                        dt.Rows.Add(studentId, firstName + " " + lastName, amountPaid, amountOwed, registrationYear, userId);
                        // Create a Student object with the retrieved data
                        
                    }

                    studentReader.Close();
                }
            }
        }

        return dt;
    }

    public DataTable GetAllStudentsDetails(string name)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("StudentId", typeof(int));
        dt.Columns.Add("StudentName", typeof(string));
        dt.Columns.Add("AmountPaid", typeof(decimal));
        dt.Columns.Add("AmountOwed", typeof(decimal));
        dt.Columns.Add("Registration", typeof(int));
        dt.Columns.Add("Classroom", typeof(string));


        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            // Retrieve all student information from the Students table
            string query = "SELECT Students.StudentId, Students.FirstName, Students.LastName," +
                " Registration.Fees, Registration.AmountPaid, Registration.RegistrationYear," +
                " ClassRoom.ClassName FROM Students , Registration, ClassRoom " +
                "where Registration.StudentId = Students.StudentId and ClassRoom.ClassId = Registration.ClassId and Students.FirstName = @search";
            using (SqlCommand studentCommand = new SqlCommand(query, connection))
            {   studentCommand.Parameters.AddWithValue("@search", name);
                connection.Open();
                using (SqlDataReader studentReader = studentCommand.ExecuteReader())
                {
                    
                    while (studentReader.Read())
                    {
                        int studentId = studentReader.GetInt32(0);
                        string firstName = studentReader.GetString(1);
                        string lastName = studentReader.GetString(2);
                        decimal amountOwed = studentReader.GetDecimal(3);
                        decimal amountPaid = studentReader.GetDecimal(4);
                        int registrationYear = studentReader.GetInt32(5);
                        string userId = studentReader.GetString(6);


                        dt.Rows.Add(studentId, firstName + " " + lastName, amountPaid, amountOwed, registrationYear, userId);
                        // Create a Student object with the retrieved data

                    }

                    studentReader.Close();
                }
            }
        }

        return dt;
    }

    public void AddStudent(string name, string address, int grade, int departmentId, int UserId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Students(FirstName, LastName, ParentHomeAddress, ClassGrade, DepartmentId, UserId) VALUES (@FirstName, @LastName, @ParentHomeAddress, @ClassGrade, @DepartmentId, @UserId)";
            using (SqlCommand command = new SqlCommand(query, connection))
            {

                command.Parameters.AddWithValue("@Firstname", name.Split()[0]);
                command.Parameters.AddWithValue("@LastName", name.Split()[1]);
                command.Parameters.AddWithValue("@ParentHomeAddress", address);
                command.Parameters.AddWithValue("@DepartmentId", departmentId);
                command.Parameters.AddWithValue("@UserId", UserId);
                command.Parameters.AddWithValue("@ClassGrade", grade);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public void registerStudent(string usrname, string password, int dpID, string name,string address, decimal amount, int classid  )
    {
        AddUser(usrname, password, "Student", dpID);
       
        int userID = GetUserByUsernameAndPassword(usrname, password).UserId; 
        AddStudent(name, address, 0, dpID, userID);
        int stuid = GetStudentByUserId(userID).StudentId;
        AddRegistration(stuid, classid, amount);
        List<Course> f = GetCoursesByDepartment(dpID);
        foreach(Course co in f)
        {
            Addgrades(stuid, classid, co.CourseId);
        }



    }


    // user methods
    public void AddUser(string username, string password, string role, int departmentId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Users (Username, Password, Role, DepartmentId) VALUES (@Username, @Password, @Role, @DepartmentId)";
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
            catch
            {
               
                
            }
        }

        return role;
    }


    // Teacher db Methods
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


    // Principal db Methods
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


    // Grade db Methods
    public void Addgrades(int studentId, int classid, int CourseId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {

            string query = "INSERT INTO Grades ( StudentId, ClassId, CourseId, Grade) VALUES (@StudentId, @classid, @courseId, 0)";
            using (SqlCommand command = new SqlCommand(query, connection))
            {

                command.Parameters.AddWithValue("@StudentId", studentId);
                command.Parameters.AddWithValue("@classid", classid);
                command.Parameters.AddWithValue("@courseId", CourseId);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public void AddGrade( int studentId, int courseId, decimal grade)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Grades ( StudentId, CourseId, Grade) VALUES ( @StudentId, @CourseId, @Grade)";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                
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










