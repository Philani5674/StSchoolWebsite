using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StSchoolWebsite3rdYearProject
{
    public partial class studentReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnRegisterStudent_Click(object sender, EventArgs e)
        {

            string studentusrname = txtStudentusrName.Text;
            string studentpassword = txtpassword.Text;
            string address = txtHomeAddress.Text;
            string studentName = txtStudentName.Text + " " + txtSurname.Text;
            int departmentId = int.Parse(ddlClass.SelectedItem.Value);
            decimal amount = decimal.Parse(txtAmountOwed.Text);
            int g = int.Parse(ddlClass.Text);

            new SchoolDatabaseManager().registerStudent(studentusrname, studentpassword,
                departmentId, studentName, address, amount, g);
            txtStudentName.Text = string.Empty;
            txtpassword.Text = string.Empty;
            txtpassword.Text = string.Empty;
            ddlClass.SelectedIndex = -1;
            txtHomeAddress.Text = null;
            Response.Redirect("WebForm1.aspx");
            // Show a success message
        }



        protected void ddlPlan_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Populate the class options based on the selected plan
            int selectedPlan = Convert.ToInt32(ddlPlan.SelectedValue);
            DataTable dtClasses = GetClassesByPlan(selectedPlan);
            ddlClass.DataSource = dtClasses;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();

            // Calculate the amount owed based on the selected plan
            decimal amountOwed = CalculateAmountOwed(selectedPlan);
            txtAmountOwed.Text = amountOwed.ToString();
        }

        private DataTable GetClassesByPlan(int planId)
        {
            // Implement logic to fetch classes based on the selected plan from the database
            // For this example, we'll create a sample DataTable with class data
            DataTable dtClasses = new DataTable();
            dtClasses.Columns.Add("ClassId", typeof(int));
            dtClasses.Columns.Add("ClassName", typeof(string));

            // Sample data - Replace this with your actual data retrieval logic
            if (planId == 3) // Commerce
            {
                dtClasses.Rows.Add(3, "Commerce Grade 10");
                dtClasses.Rows.Add(3, "Commerce Grade 11");
                dtClasses.Rows.Add(3, "Commerce Grade 12");
            }
            else if (planId == 1) // Science
            {
                dtClasses.Rows.Add(1, "Science Grade 10");
                dtClasses.Rows.Add(1, "Science Grade 11");
                dtClasses.Rows.Add(1, "Science Grade 12");
            }
            else if (planId == 2) // History
            {
                dtClasses.Rows.Add(2, "History Grade 10");
                dtClasses.Rows.Add(2, "History Grade 11");
                dtClasses.Rows.Add(2, "History Grade 12");

            }

            return dtClasses;
        }
        private decimal CalculateAmountOwed(int planId)
        {
            // Implement logic to calculate the amount owed based on the selected plan
            // For this example, we'll use a sample amount calculation
            if (planId == 1) // Commerce
            {
                return 15000.00m;
            }
            else if (planId == 2) // Science
            {
                return 18000.00m;
            }
            else if (planId == 3) // History
            {
                return 12000.00m;
            }

            return 0.00m;
        }

    }
}