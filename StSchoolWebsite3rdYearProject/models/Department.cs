using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.Data.Linq.Mapping;

namespace StSchoolWebsite3rdYearProject.models
{
    [Table(Name = "Departments")]
    public class Department
    {   
        [Column(Name = "DepartmentId")]
        public int DepartmentId { get; set; }
        [Column(Name = "DepartmentName")]
        public string DepartmentName { get; set; }

        public Department(int departmentId, string departmentName)
        {
            DepartmentId = departmentId;
            DepartmentName = departmentName;
        }
    }
}