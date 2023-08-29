using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StSchoolWebsite3rdYearProject.models
{
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
}