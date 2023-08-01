using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StSchoolWebsite3rdYearProject
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string usernam = username.Value;
            string passwor = password.Value;
            string confirmPasswor = confirmPassword.Value;
            string rol = role.Value;
            
            string departmentName = Request.Form["departmentId"];

            int departmentIdL = 0;
            switch (departmentName)
            {
                case "Science":
                    departmentIdL = 1;
                    break;
                case "History":
                    departmentIdL = 2;
                    break;
                case "Commerce":
                    departmentIdL = 3;
                    break;
                default:
                    // Handle invalid department name
                    break;
            }

            new SchoolDatabaseManager().AddUser(usernam,passwor,rol, departmentIdL);


        }
    }
}