using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StSchoolWebsite3rdYearProject.models
{
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
}