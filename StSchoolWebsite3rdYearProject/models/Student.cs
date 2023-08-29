using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;


namespace StSchoolWebsite3rdYearProject.models

{   [Table(Name = "Students")]
    public class Student
    {
        [Column(Name = "StudentID")]
        public int StudentId { get; set; }
        [Column(Name = "FirstName")]
        public string FirstName { get; set; }
        [Column(Name = "LastName")]
        public string LastName { get; set; }
        [Column(Name = "ParentHomeAddress")]
        public string ParentHomeAddress { get; set; }
        [Column(Name = "ClassGrade")]
        public int ClassGrade { get; set; }
        [Column(Name = "DepartmentId")]
        public int DepartmentId { get; set; }
        [Column(Name = "UserId")]
        public int UserId { get; set; }
        public Student()
        {

        }
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
}