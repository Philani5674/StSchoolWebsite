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
            string rol = role.Value;
            

           
          

            new SchoolDatabaseManager().AddUser(usernam,passwor,rol, 1);


        }
    }
}