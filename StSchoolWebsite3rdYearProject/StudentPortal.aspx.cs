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

        DataAccess.Data db = new SchoolDatabaseManager();
        int userId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            int userId;
            if (IsPostBack)
            {
            userId = (int) Session["UserId"];
            }
            try
            {
                userId = (int) Session["UserId"];
            }
            catch {
                Response.Redirect("loginn.aspx");

                userId = (int)Session["UserId"];
            }
            
            this.userId = userId;
            ids.InnerHtml = userId.ToString();
          
            User user = db.GetUserById(userId);
            Student student = db.GetStudentByUserId(user.UserId);
            userLogged.InnerHtml = student.FirstName + " " + student.LastName +"  ";

            name.InnerHtml = student.FirstName + " " + student.LastName + "  ";
            userLogged.InnerHtml = name.InnerHtml;
            address.InnerHtml = student.ParentHomeAddress;
            grade.InnerHtml = db.GetClassNameById(student.ClassGrade);
            dep.InnerHtml = new SchoolDatabaseManager().GetDepartmentNameById(student.DepartmentId);


           
           




        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("loginn.aspx");
        }
    }
}