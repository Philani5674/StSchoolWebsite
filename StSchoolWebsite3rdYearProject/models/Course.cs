using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StSchoolWebsite3rdYearProject.models
{
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
}