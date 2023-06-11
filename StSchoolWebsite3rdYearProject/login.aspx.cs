using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StSchoolWebsite3rdYearProject
{
    public partial class Login : Page
    {
        private string connectionString = new SchoolDatabaseManager("").getCoString();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
            
        {
            TextBox lblErrorMessage = (TextBox)FindControl("lblErrorMessage");
            TextBox txtUsername = (TextBox)FindControl("txtUsername");
            TextBox txtPassword = (TextBox)FindControl("txtPassword");
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            try
            {
                string role = AuthenticateUser(username, password);

                if (role == "Admin")
                {
                    // Redirect to the admin page
                    Response.Redirect("AdminPage.aspx");
                }
                else if (role == "Teacher")
                {
                    // Redirect to the teacher page
                    Response.Redirect("TeacherPage.aspx");
                }
                else if (role == "Student")
                {
                    // Redirect to the student page
                    Response.Redirect("StudentPage.aspx");
                }
                else
                {
                   // (TextBox)FindControl("lblErrorMessage") = 
                    // Invalid role, display an error message
                    lblErrorMessage.Text = "Invalid user role";
                }
            }
            catch (Exception ex)
            {
                // Handle and log the exception
                lblErrorMessage.Text = "An error occurred during authentication.";
                // Log the exception using a logging framework or write to a log file
                // Example: LogException(ex);
            }
        }

        private string AuthenticateUser(string username, string password)
        {
            string role = string.Empty;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Role FROM [User] WHERE Username = @Username AND Password = @Password";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@Password", password);

                connection.Open();
                object result = command.ExecuteScalar();

                if (result != null)
                {
                    role = result.ToString();
                }
            }

            return role;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Redirect to the registration page
            Response.Redirect("Register.aspx");
        }
    }
}
