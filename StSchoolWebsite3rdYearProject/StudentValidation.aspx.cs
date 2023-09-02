using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StSchoolWebsite3rdYearProject
{
    public partial class StudentValidation : System.Web.UI.Page
    {
        DataAccess.Data db = new SchoolDatabaseManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindStudentData();

        }
        private void BindStudentData()
        {
           
                var students = db.GetAllNotApproved();

                foreach (var student in students)
                {
                    TableRow row = new TableRow();

                    TableCell idCell = new TableCell();
                    idCell.Text = student.StudentId.ToString();
                    row.Cells.Add(idCell);

                    TableCell nameCell = new TableCell();
                    nameCell.Text = $"{student.FirstName } {student.LastName}";
                    row.Cells.Add(nameCell);

                    TableCell emailCell = new TableCell();
                    emailCell.Text = student.LastName;
                    row.Cells.Add(emailCell);

                    TableCell statusCell = new TableCell();
                    statusCell.Text = "Not Approved";
                    row.Cells.Add(statusCell);

                    TableCell actionCell = new TableCell();
                    Button approveButton = new Button();
                    approveButton.CssClass = "btn btn-success btn-sm";
                    approveButton.Text = "Approve";
                    approveButton.Click += (s, e) => ApproveStudent(student.UserId);
                    actionCell.Controls.Add(approveButton);

                    Button rejectButton = new Button();
                    rejectButton.CssClass = "btn btn-danger btn-sm";
                    rejectButton.Text = "Reject";
                    rejectButton.Click += (s, e) => RejectStudent(student.UserId);
                    actionCell.Controls.Add(rejectButton);

                    row.Cells.Add(actionCell);

                    studentTable.Rows.Add(row);
                }
            
        }

        private void ApproveStudent(int studentID)
        {
            // Code to update the student's status as "Approved" in the database
            // Refresh the page or update the table using AJAX to reflect the changes
            db.ApproveStudent(studentID);
           

        }

        private void RejectStudent(int studentID)
        {
            // Code to update the student's status as "Rejected" in the database
            // Refresh the page or update the table using AJAX to reflect the changes

        }



    }
}
















