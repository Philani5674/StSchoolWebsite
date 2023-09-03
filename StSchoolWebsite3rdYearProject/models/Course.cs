using System.Data.Linq.Mapping;

namespace StSchoolWebsite3rdYearProject.models
{
    [Table(Name = "Courses")]
    public class Course
    {
        [Column(Name = "CourseId")]
        public int CourseId { get; set; }
        [Column(Name = "CourseName")]
        public string CourseName { get; set; }
        [Column(Name = "DepartmentId")]
        public int DepartmentId { get; set; }

        public Course(int courseId, string courseName, int departmentId)
        {
            CourseId = courseId;
            CourseName = courseName;
            DepartmentId = departmentId;
        }
        public Course()
        {

        }
    }
}