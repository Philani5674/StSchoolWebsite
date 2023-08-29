using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StSchoolWebsite3rdYearProject.models;

namespace StSchoolWebsite3rdYearProject
{
    
    public partial class Loginn : System.Web.UI.Page
        
    {
        DataAccess.Data manager = new SchoolDatabaseManager();
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {
         
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Check if the credentials are valid
            if (AuthenticateUser(username, password))
            {
                // Redirect to the appropriate user page based on the role
                string role = GetUserRole(username, password);
                int id = manager.GetUserByUsernameAndPassword(username, password).UserId;
                if (role == "student")
                {
                    Session["UserId"] =id ;
                    int g = manager.GetStudentByUserId(id).ClassGrade;
                    if (g == 0)
                    {
                        Response.Redirect("WebForm1.aspx");
                    }
                    Response.Redirect("StudentPortal.aspx");
                }

                else if (role == "teacher")
                {
                    Session["UserId"] = manager.GetUserByUsernameAndPassword(username, password).UserId;
                    Response.Redirect("TeacherPortal.aspx");
                }

                else if (role == "principal")
                {
                    Session["UserId"] = manager.GetUserByUsernameAndPassword(username, password).UserId;
                    Response.Redirect("PrincipalPortal.aspx");
                }

                {
                    // Handle unknown role or other scenarios
                  
                }
            }
            else
            {
                
                if(username.ToLower() == "admin" && password.ToLower() == "admin@1" ){
                    Response.Redirect("AdminDashboard.aspx");
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }


     


           

            private bool AuthenticateUser(string username, string password)
            {
                // Implement your authentication logic here
                // You can use the SchoolDatabaseManager class to validate the user credentials against the database

                // Sample implementation: Check if the username and password match a user in the database
                User user = manager.GetUserByUsernameAndPassword(username, password);
                return (user != null);
            }

            private string GetUserRole(string username, string password)
            {
                // Implement your logic to retrieve the user role from the database
                // You can use the SchoolDatabaseManager class to fetch the user role based on the username

                // Sample implementation: Get the user role from the database based on the username
                string role = manager.GetRolebyPasswordAndUsername(username, password);
                if (role != null)
                {
                    return role;
                }

                return string.Empty;
            }
        }
    }



