using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StSchoolWebsite3rdYearProject.models;
namespace StSchoolWebsite3rdYearProject
{
    public partial class PrincipalPortal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Student> students = new SchoolDatabaseManager().GetAllStudents();

            studentRepeater.DataSource = students;
            studentRepeater.DataBind();
        }
    }
}