<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentPortal.aspx.cs" Inherits="StSchoolWebsite3rdYearProject.StudentPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Add custom styles here */
        .card {
            margin-bottom: 20px;
        }

        .table-container {
            margin-top: 20px;
        }

        /* Custom styles for alerts */
        .alert-work {
            background-color: #f8d7da; /* Red background */
        }

        .alert-date {
            background-color: #cce5ff; /* Blue background */
        }
    </style>

    
    <!-- Page content -->
    <div class="content">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <h5>Student Portal</h5>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a id="personalDetailsNav" class="nav-link" href="#">Personal Details</a>
                    </li>
                    <li class="nav-item">
                        <a id="registrationNav" class="nav-link" href="#">Registration</a>
                    </li>
                    <li class="nav-item">
                        <a id="reportsNav" class="nav-link" href="#">Reports</a>
                    </li>
                    <li class="nav-item">
                        <a id="subjectsNav" class="nav-link" href="#">My Subjects</a>
                    </li>
                </ul>
            </div>
            <div class="ml-auto">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-bell">
                            <span class="bg-danger rounded-pill text-white notification-badge">5</span>
                        </i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span runat="server" id="userLogged" class="user-name"></span></a>
                    </li>
                    <li class="nav-item">
                        <asp:Button runat="server" ID="logoutButton" CssClass="btn btn-primary align-content-center" OnClick="logoutButton_Click" Text="Logout" />
                    </li>
                </ul>
            </div>
        </nav>


        <hr />

        <!-- Main content -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5">
                    <div class="card bg-light">
                        <div class="card-body">
                            <h5 class="card-title">Incoming Work</h5>
                            <div class="alert alert-work" role="alert">
                                Task 1 - Complete Math Assignment
                            </div>
                            <div class="alert alert-work" role="alert">
                                Task 2 - Read Chapter 5 of History Book
                            </div>
                            <div class="alert alert-work" role="alert">
                                Task 3 - Submit English Essay
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="card bg-light">
                        <div class="card-body">
                            <h5 class="card-title">Upcoming Dates</h5>
                            <div class="alert alert-date" role="alert">
                                May 30, 2023 - Field Trip to Museum
                            </div>
                            <div class="alert alert-date" role="alert">
                                June 5, 2023 - Parent-Teacher Meeting
                            </div>
                            <div class="alert alert-date" role="alert">
                                June 10, 2023 - Last Day of School
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Additional content sections -->
        <div id="personalDetails" style="display: none;">
            <div class="container">
                <h1>Personal Details</h1>
                <div class="row">
                    <div class="col-4">
                        <label for="name" class="form-label font-weight-bold">Name:</label>
                    </div>
                    <div class="col-8">
                        <p id="name" runat="server">John Doe</p>
                    </div>

                </div>

                <div class=" row">
                    <div class="col-4">
                        <label for="address" class="form-label font-weight-bold">Address:</label>
                    </div>
                    <div class="col-8">
                        <p id="address" runat="server">123 Street, City</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <label for="grade" class="form-label font-weight-bold">Grade:</label>
                    </div>
                    <div class="col-8">
                        <p id="grade" runat="server">10</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <label for="dep" class="form-label font-weight-bold">Department:</label>

                    </div>
                    <div class="col-8">
                        <p id="dep" runat="server">Computer Science</p>
                    </div>
                </div>




                <div>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateDetailsModal">Update Details</button>
                </div>
            </div>
        </div>



       





        <!-- Update Details Modal -->
        <div class="modal fade" id="updateDetailsModal" tabindex="-1" role="dialog" aria-labelledby="updateDetailsModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateDetailsModalLabel">Update Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="nameInput">Name</label>
                                <input type="text" class="form-control" id="nameInput1" placeholder="Enter your name">
                            </div>
                            <div class="form-group">
                                <label for="addressInput">Address</label>
                                <input type="text" class="form-control" id="addressInput1" placeholder="Enter your address">
                            </div>
                            <div class="form-group">
                                <label for="gradeInput">Grade</label>
                                <input type="text" class="form-control" id="gradeInput1" placeholder="Enter your grade">
                            </div>
                            <div class="form-group">
                                <label for="departmentInput">Department</label>
                                <input type="text" class="form-control" id="departmentInput" placeholder="Enter your department">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save Changes</button>
                    </div>
                </div>
            </div>
        </div>









        <!--registration content-->

        <div id="registration" style="display: none;">
            <div class="container">
                <h1>Registration</h1>
                <!-- Add your registration form or content here -->
            </div>
        </div>

        <!--Reports content -->

 
       <div id="reports" style="display: none;">
    <style>
        /* Custom styles */
        .school-logo {
            width: 150px;
            height: 150px;
            margin-bottom: 20px;
        }
        
        .reportss {
            border: 1px solid #000;
            padding: 20px;
        }

        .student-details {
            text-align: left;
            margin-bottom: 30px;
        }

        .download-button {
            margin-top: 20px;
        }
    </style>
    <div class="container reportss" id="reportss">
        <h1>Student Reports</h1>
        <div class="student-details row">
            <div class="col-6 text-start">
                <h2>Student Details</h2>
                <p><strong>Name:</strong> <%= name.InnerHtml %></p>
                <p><strong>Grade:</strong> <%=grade.InnerHtml %></p>
                <p ><strong>Student ID:</strong><p runat="server" id="ids"></p> </p>
            </div>
            <div class="col-6 text-start">
                <img src="https://static.vecteezy.com/system/resources/previews/008/040/410/original/school-logo-design-template-free-vector.jpg" alt="School Logo" class="school-logo">
            </div>
        </div>
        <div class="row" ID ="repo">
            <div class="col-md-12">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Course Name</th>
                            <th>Grade (%)</th>
                            <th>Pass/Fail</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%foreach ( StSchoolWebsite3rdYearProject.models.Grade grades in new SchoolDatabaseManager().GetGradesByStudent(int.Parse(ids.InnerHtml))){ %>
                        <tr>
                            <td><%=new SchoolDatabaseManager().GetCourseByCourseId(grades.CourseId).CourseName %></td>
                            <td><%=grades.GradeValue.ToString() + "%" %></td>
                            <td><i class="fas fa-check-circle text-success"></i></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
                <button type="button" id="downloadButton" class="btn btn-primary download-button" onclick="generatePDF()">Download PDF</button>
           
            </div>
        </div>
    </div>

    <!-- html2pdf library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <!-- Font Awesome JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    

</div>


        <!--My subjects content-->

        <div id="mysubjects" style="display: none">
            <div class="container">
                <h1>My Subjects</h1>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- html2pdf library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script>
        // Function to show selected content and hide others
        function showContent(sectionId) {
            document.getElementById('personalDetails').style.display = 'none';
            document.getElementById('registration').style.display = 'none';
            document.getElementById('reports').style.display = 'none';
            document.getElementById('mysubjects').style.display = "none";

            document.getElementById(sectionId).style.display = 'block';
        }

        // Event listeners for navigation clicks



        document.getElementById('personalDetailsNav').addEventListener('click', function () {
            showContent('personalDetails');
        })

        document.getElementById('registrationNav').addEventListener('click', function () {
            showContent('registration');
        });

        document.getElementById('reportsNav').addEventListener('click', function () {
            showContent('reports');
        });

        document.getElementById('subjectsNav').addEventListener('click', function () {
            showContent('mysubjects')
        })
    </script>

     <script>
         function generatePDF() {
             const button = document.getElementById('downloadButton');
             button.disabled = true; // Disable the button while generating the PDF

             var element = document.getElementById('repo');
             html2pdf()
                 .set({ filename: 'student_grades.pdf', margin: 50 })
                 .from(element)
                 .save()
                 .then(() => {
                     button.disabled = false; // Enable the button after generating the PDF
                 })
                 .catch((error) => {
                     button.disabled = false; // Enable the button even if an error occurs
                     console.error('Error generating PDF:', error);
                 });
         }
     </script>
</asp:Content>
