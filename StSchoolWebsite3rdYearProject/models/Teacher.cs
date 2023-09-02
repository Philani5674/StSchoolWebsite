using System.Data.Linq.Mapping;

namespace StSchoolWebsite3rdYearProject.models
{
    [Table(Name = "Teachers")]
    public class Teacher
    {
        [Column(Name = "TeacherId")]
        public int TeacherId { get; set; }

        [Column(Name = "FirstName")]
        public string FirstName { get; set; }

        [Column(Name = "LastName")]
        public string LastName { get; set; }

        [Column(Name = "DepartmentId")]
        public int DepartmentId { get; set; }

        [Column(Name = "UserId")]
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