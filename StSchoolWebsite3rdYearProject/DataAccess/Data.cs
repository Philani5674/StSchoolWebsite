using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StSchoolWebsite3rdYearProject.models;
using System.Data;


namespace StSchoolWebsite3rdYearProject.DataAccess
{
    
    public interface Data
    {
        string getCoString();

        List<Course> GetCoursesByDepartment(int departmentId);

        void updatePayment(int studentId, decimal amount);

        void AddRegistration(int studentId, int classid, decimal amount);

        Registration GetRegistrationbyid(int studentid);

        string GetClassNameById(int classId);

        Student GetStudentByUserId(int userId);

        List<Student> GetAllStudents();

        DataTable GetAllStudentsDetails();

        DataTable GetAllStudentsDetails(string name);

        void AddStudent(string name, string address, int grade, int departmentId, int UserId);

        void registerStudent(string usrname, string password, int dpID, string name, string address, decimal amount, int classid);

        void AddUser(string username, string password, string role, int departmentId);

        User GetUserById(int userId);

        User GetUserByUsernameAndPassword(string username, string password);

        string GetRolebyPasswordAndUsername(string username, string password);

        void AddTeacher(int teacherId, string firstName, string lastName, int departmentId, int userId);

        Teacher GetTeacherById(int teacherId);

        void AddPrincipal(int principalId, string firstName, string lastName, int userId);

        Principal GetPrincipalById(int principalId);

        void Addgrades(int studentId, int classid, int CourseId);

        List<Grade> GetGradesByStudent(int studentId);

        void AddGrade(int studentId, int courseId, decimal grade);
        
    }
}
