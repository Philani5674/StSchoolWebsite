using System;
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
            DataTable dt = new DataTable();
            dt.Columns.Add("StudentId", typeof(int));
            dt.Columns.Add("StudentName", typeof(string));
            dt.Columns.Add("AmountPaid", typeof(decimal));
            dt.Columns.Add("AmountOwed", typeof(decimal));
            dt.Columns.Add("Registration", typeof(string));
            dt.Columns.Add("Classroom", typeof(string));

            // Add some sample student data for demonstration purposes
            dt.Rows.Add(1, "John Doe", 100.00, 500.00, "Registered", "Class A");
            dt.Rows.Add(2, "Jane Smith", 200.00, 300.00, "Registered", "Class B");
            dt.Rows.Add(3, "Michael Johnson", 0.00, 1000.00, "Not Registered", "Class C");
            dt.Rows.Add(4, "Emily Adams", 400.00, 100.00, "Registered", "Class A");
            dt.Rows.Add(5, "William Anderson", 0.00, 500.00, "Not Registered", "Class B");
            // Add more sample data here

            return dt;
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
            // For this example, we'll add some sample data
            ddlTeachers.Items.Clear();
            ddlTeachers.Items.Add(new ListItem("Teacher 1", "1"));
            ddlTeachers.Items.Add(new ListItem("Teacher 2", "2"));
            // Add more sample data here
        }

        private void BindCoursesDropDown()
        {
            // Implement logic to fetch courses from the database and bind to ddlCourses
            // For this example, we'll add some sample data
            ddlCourses.Items.Clear();
            ddlCourses.Items.Add(new ListItem("Course 1", "1"));
            ddlCourses.Items.Add(new ListItem("Course 2", "2"));
            // Add more sample data here
        }

        private void BindStudentsDropDown()
        {
            // Implement logic to fetch students from the database and bind to ddlStudents
            // For this example, we'll add some sample data
            ddlStudents.Items.Clear();
            ddlStudents.Items.Add(new ListItem("John Doe", "1"));
            ddlStudents.Items.Add(new ListItem("Jane Smith", "2"));
            ddlStudents.Items.Add(new ListItem("Michael Johnson", "3"));
            ddlStudents.Items.Add(new ListItem("Emily Adams", "4"));
            ddlStudents.Items.Add(new ListItem("William Anderson", "5"));
            // Add more sample data here
        }

        private void BindClassesDropDown()
        {
            // Implement logic to fetch classes from the database and bind to ddlClasses
            // For this example, we'll add some sample data
            ddlClasses.Items.Clear();
            ddlClasses.Items.Add(new ListItem("Class 1", "1"));
            ddlClasses.Items.Add(new ListItem("Class 2", "2"));
            // Add more sample data here
        }

        protected void btnRegisterStudent_Click(object sender, EventArgs e)
        {
            string studentName = txtStudentName.Text;

            // Implement logic to save the student registration data to the database
            // For this example, we'll simply show an alert message
            // Replace the following code with actual database operations
            DataTable dtStudents = GetSampleStudentsData();
            int studentId = dtStudents.Rows.Count + 1;
            decimal amount = decimal.Parse(txtAmountOwed.Text);
            if (amount == 0)
            {
                amount= 850;
            }

            string classroom = ddlClass.SelectedItem.Value;
            dtStudents.Rows.Add(studentId, studentName, 0.00, amount, "Registered", classroom);

            // Clear the form fields after successful registration
            txtStudentName.Text = string.Empty;

            // Refresh the GridView to display the updated student list
            gvStudents.DataSource = dtStudents;
            gvStudents.DataBind();

            // Show a success message
            ClientScript.RegisterStartupScript(this.GetType(), "RegistrationSuccess", "alert('Student registered successfully!');", true);
        }

        protected void btnAssignTeacherToCourse_Click(object sender, EventArgs e)
        {
            int selectedTeacherId = Convert.ToInt32(ddlTeachers.SelectedValue);
            int selectedCourseId = Convert.ToInt32(ddlCourses.SelectedValue);
            // Implement logic to save the teacher-course association to the database
            // For this example, we'll simply show an alert message

            // Show a success message
            ClientScript.RegisterStartupScript(this.GetType(), "AssignSuccess", "alert('Teacher assigned to course successfully!');", true);
        }

        protected void btnAddStudentToClass_Click(object sender, EventArgs e)
        {
            int selectedStudentId = Convert.ToInt32(ddlStudents.SelectedValue);
            int selectedClassId = Convert.ToInt32(ddlClasses.SelectedValue);
            // Implement logic to save the student-class association to the database
            // For this example, we'll simply show an alert message

            // Show a success message
            ClientScript.RegisterStartupScript(this.GetType(), "AddSuccess", "alert('Student added to class successfully!');", true);
        }

        protected void btnMakePayment_Click(object sender, EventArgs e)
        {
            Button btnMakePayment = (Button)sender;
            int studentId = Convert.ToInt32(btnMakePayment.CommandArgument);

            // Get the student details from the DataTable based on the StudentId
            DataTable dtStudents = GetSampleStudentsData();
            DataRow[] studentRows = dtStudents.Select("StudentId = " + studentId);
            if (studentRows.Length > 0)
            {
                DataRow studentRow = studentRows[0];
                // Display student details in the payment modal
                modalStudentId.InnerHtml = studentRow["StudentId"].ToString();
                modalStudentName.InnerHtml = studentRow["StudentName"].ToString();
               
                txtPaymentAmount.Text = string.Empty; // Clear the payment amount field
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
                dtClasses.Rows.Add(1, "Commerce Class A");
                dtClasses.Rows.Add(2, "Commerce Class B");
            }
            else if (planId == 2) // Science
            {
                dtClasses.Rows.Add(3, "Science Class A");
                dtClasses.Rows.Add(4, "Science Class B");
            }
            else if (planId == 3) // History
            {
                dtClasses.Rows.Add(5, "History Class A");
                dtClasses.Rows.Add(6, "History Class B");
            }

            return dtClasses;
        }


        private decimal CalculateAmountOwed(int planId)
        {
            // Implement logic to calculate the amount owed based on the selected plan
            // For this example, we'll use a sample amount calculation
            if (planId == 1) // Commerce
            {
                return 1500.00m;
            }
            else if (planId == 2) // Science
            {
                return 1800.00m;
            }
            else if (planId == 3) // History
            {
                return 1200.00m;
            }

            return 0.00m;
        }







        protected void btnConfirmPayment_Click(object sender, EventArgs e)
        {
            int studentId = Convert.ToInt32(modalStudentId.InnerHtml);
            decimal paymentAmount = Convert.ToDecimal(txtPaymentAmount.Text);

            // Implement logic to update the payment amount in the DataTable
            // For this example, we'll update the DataTable directly
            DataTable dtStudents = GetSampleStudentsData();
            DataRow[] studentRows = dtStudents.Select("StudentId = " + studentId);
            if (studentRows.Length > 0)
            {
                DataRow studentRow = studentRows[0];
                studentRow["AmountPaid"] = Convert.ToDecimal(studentRow["AmountPaid"]) + paymentAmount;
                studentRow["AmountOwed"] = Convert.ToDecimal(studentRow["AmountOwed"]) - paymentAmount;
            }

            // Refresh the GridView to display the updated student list
            gvStudents.DataSource = dtStudents;
            gvStudents.DataBind();

            // Hide the modal after payment is confirmed
            ScriptManager.RegisterStartupScript(this, GetType(), "HideModalScript", "$('#paymentModal').modal('hide');", true);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Implement logout logic here (e.g., redirect to login page)
            Response.Redirect("~/Loginn.aspx");
        }
    }
}





