using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StSchoolWebsite3rdYearProject.models;

namespace StSchoolWebsite3rdYearProject
{
    public partial class StudentPortal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userId;
            
            try
            {
                userId = (int) Session["UserId"];
            }
            catch {
                Response.Redirect("loginn.aspx");

                userId = (int)Session["UserId"];
            }
          
            User student = new SchoolDatabaseManager().GetUserById(userId);
            Student stu = new SchoolDatabaseManager().GetStudentByUserId(student.UserId);
            userLogged.InnerHtml = stu.FirstName + " " + stu.LastName +"  ";

            name.InnerHtml = stu.FirstName + " " + stu.LastName + "  ";
            address.InnerHtml = stu.ParentHomeAddress;
            grade.InnerHtml = new SchoolDatabaseManager().GetClassNameById(stu.ClassGrade);
            dep.InnerHtml = new SchoolDatabaseManager().GetDepartmentNameById(stu.DepartmentId);




        }
    }
}