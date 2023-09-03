using System.Data.Linq.Mapping;

namespace StSchoolWebsite3rdYearProject.models
{
    [Table(Name = "Grades")]
    public class Grade
    {
        [Column(Name = "GradeId")]
        public int GradeId { get; set; }
        [Column(Name = "StudentId")]
        public int StudentId { get; set; }
        [Column(Name = "CourseId")]
        public int CourseId { get; set; }
        [Column(Name = "Grade")]
        public decimal GradeValue { get; set; }

        public Grade(int gradeId, int studentId, int courseId, decimal gradeValue)
        {
            GradeId = gradeId;
            StudentId = studentId;
            CourseId = courseId;
            GradeValue = gradeValue;
        }


        Grade()
        {

        }

    }
}