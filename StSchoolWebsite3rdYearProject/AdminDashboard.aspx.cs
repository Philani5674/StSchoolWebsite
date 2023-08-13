using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StSchoolWebsite3rdYearProject
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Assuming the admin data is available, set the profile information
                lblAdminName.Text = "John Doe"; // Replace with actual admin name
                lblAdminEmail.Text = "admin@example.com"; // Replace with actual admin email
                lblAdminRole.Text = "Administrator"; // Replace with actual admin role

                BindStudentsGrid();
                BindTeachersDropDown();
                BindCoursesDropDown();
                BindStudentsDropDown();
                BindClassesDropDown();
            }
        }

        private DataTable GetSampleStudentsData()
        {
            // Add more sample data here
            return new SchoolDatabaseManager().GetAllStudentsDetails();
        }

        private void BindStudentsGrid()
        {
            DataTable dtStudents = GetSampleStudentsData();
            gvStudents.DataSource = dtStudents;
            gvStudents.DataBind();
        }

        private void BindTeachersDropDown()
        {
            // Implement logic to fetch teachers from the database and bind to ddlTeachers
        
        }

        private void BindCoursesDropDown()
        {
            // Implement logic to fetch courses from the database and bind to ddlCourses
     
        }

        private void BindStudentsDropDown()
        {
            foreach (Student stu in new SchoolDatabaseManager().GetAllStudents())
            {
                ddlStudents.Items.Add(new ListItem(stu.FirstName + " " + stu.LastName, stu.StudentId.ToString()));
            }
        }
        private void BindClassesDropDown()
        {
            // Implement logic to fetch classes from the database and bind to ddlClasses
        }

        protected void btnRegisterStudent_Click(object sender, EventArgs e)
        {

            string studentusrname = txtStudentusrName.Text;
            string studentpassword = txtpassword.Text;
            string address = txtHomeAddress.Text;
            string studentName = txtStudentName.Text;
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
            BindStudentsGrid();
            BindStudentsGrid();



            // Show a success message
            ClientScript.RegisterStartupScript(this.GetType(), "RegistrationSuccess", "alert('Student registered successfully!');", true);
        }

        

        protected void btnAddStudentToClass_Click(object sender, EventArgs e)
        {
            decimal amount = decimal.Parse(amoundt.Text);
           
            int studentId = int.Parse(ddlStudents.SelectedItem.Value);
            string studentname = "";
            List<Student> students = new SchoolDatabaseManager().GetAllStudents();
            foreach (Student stu in students)
            {
                if (stu.StudentId == studentId)
                {
                    studentname = stu.FirstName + " " + stu.LastName;
                }
            }
            if(new SchoolDatabaseManager().GetRegistrationbyid(studentId).pay(amount)){
                BindStudentsGrid();
                ClientScript.RegisterStartupScript(this.GetType(), "PaymentSuccess", "alert('Payment of "+studentname+" is successful!');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "PaymentFailed", "alert('Payment of "+studentname+" failed!');", true);
            }
           

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

        protected void ddlClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        private DataTable GetClassesByPlan(int planId)
        {
            // Implement logic to fetch classes based on the selected plan from the database
            // For this example, we'll create a sample DataTable with class data
            DataTable dtClasses = new DataTable();
            dtClasses.Columns.Add("ClassId", typeof(int));
            dtClasses.Columns.Add("ClassName", typeof(string));

            // Sample data - Replace this with your actual data retrieval logic
            if (planId == 1) // Commerce
            {
                dtClasses.Rows.Add(1, "Commerce Grade 10");
                dtClasses.Rows.Add(2, "Commerce Grade 11");
                dtClasses.Rows.Add(2, "Commerce Grade 12");
            }
            else if (planId == 2) // Science
            {
                dtClasses.Rows.Add(3, "Science Grade 10");
                dtClasses.Rows.Add(4, "Science Grade 11");
                dtClasses.Rows.Add(2, "Science Grade 12");
            }
            else if (planId == 3) // History
            {
                dtClasses.Rows.Add(5, "History Grade 10");
                dtClasses.Rows.Add(6, "History Grade 11");
                dtClasses.Rows.Add(6, "History Grade 12");

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

        protected void btnConfirmPayment_Click(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Implement logout logic here (e.g., redirect to login page)
            Response.Redirect("~/Loginn.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable j = new SchoolDatabaseManager().GetAllStudentsDetails(txtsearch.Text);



            if (j.Rows.Count == 0)
            {
                j = new SchoolDatabaseManager().GetAllStudentsDetails(); 
                gvStudents.DataSource = j;
                gvStudents.DataBind();
            }

        }

        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            DataTable j = new SchoolDatabaseManager().GetAllStudentsDetails(txtsearch.Text);
            gvStudents.DataSource = j;
            gvStudents.DataBind();
        }
    }
}





