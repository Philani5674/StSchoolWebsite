using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;

namespace StSchoolWebsite3rdYearProject.models
{
    [Table(Name = "ClassRoom")]
    public class ClassRoom
    {
        [Column(Name = "ClassId")]
        public int ClassId { get; set; }
        [Column(Name = "ClassName")]
        public string ClassName { get; set; }
        [Column(Name = "DepartmentId")]
        public int DepartmentId { get; set; }
    }
}