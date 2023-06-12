<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrincipalPortal.aspx.cs" Inherits="StSchoolWebsite3rdYearProject.PrincipalPortal" %>
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

    <hr>
    <hr>
    <hr>
    <!-- Page content -->
    <div class="content">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <h5>Principal Portal</h5>
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
                        <a id="reportsNav" class="nav-link" href="#">Teachers</a>
                    </li>
                    <li class="nav-item">
                        <a id="subjectsNav" class="nav-link" href="#">Students</a>
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
                        <a class="nav-link" href="#"><span class="user-name">John Doe</span></a>
                    </li>
                    <li class="nav-item">
                        <asp:Button runat="server" ID="logoutButton" href="Loginn.aspx" CssClass="btn btn-primary" Text="Logout" />
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
                <p id="name">Name: John Doe</p>
                <p id="address">Address: 123 Street, City</p>
                <p id="grade">Grade: 10</p>
                <p>Department: Computer Science</p>

                <div>
                    <button class="btn btn-primary" id="updateb" type="button" data-toggle="collapse" data-target="#updateDetailsCollapse" aria-expanded="false" aria-controls="updateDetailsCollapse">
                        Update Details
                    </button>
                </div>

                <div class="collapse" id="updateDetailsCollapse">
                    <div class="card card-body">
                        <form action="#" method="post">
                            <div class="form-group">
                                <label for="nameInput">Name</label>
                                <input type="text" class="form-control" id="nameInput" name="name" placeholder="Enter your name">
                            </div>
                            <div class="form-group">
                                <label for="addressInput">Address</label>
                                <input type="text" class="form-control" id="addressInput" name="address" placeholder="Enter your address">
                            </div>
                            <div class="form-group">
                                <label for="gradeInput">Grade</label>
                                <input type="text" class="form-control" id="gradeInput" name="grade" placeholder="Enter your grade">
                            </div>

                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>




        <!--registration content-->

        <div id="registration" style="display: none;">
            <div class="hero-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card bg-danger">
                                <div class="card-body">
                                    <h5 class="card-title">Total Amount</h5>
                                    <p class="card-text">R <span id="totalAmount">15000.00</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card bg-primary">
                                <div class="card-body">
                                    <h5 class="card-title">Total Paid</h5>
                                    <p class="card-text">R <span id="totalPaid">12000.00</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="card col-12">
                            <div class="card-header">
                                <h3 class="card-title">Payment History</h3>
                            </div>

                            <div class="table-responsive">
                                <table id="paymentTable" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Date of Payment</th>
                                            <th>Department</th>
                                            <th>Amount Paid (ZAR)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>

                            <div class="card-body">
                                <div id="paymentGraphContainer">
                                    <canvas id="paymentGraph"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <!--Reports content -->

        <div id="reports" style="display: none;">
            <div class="container">
                <h3>Grade Chart</h3>
                <div>
                    <canvas id="chart"></canvas>
                </div>
            </div>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                $(document).ready(function () {
                    // Hardcoded data
                    var grades = [
                        { Course: "IsiZulu (Science)", Grade: 75.8, PassGrade: 50 },
                        { Course: "English (Science)", Grade: 88.2, PassGrade: 60 },
                        // Add more grades here (30 lines)
                        { Course: "Course 3", Grade: 90.5, PassGrade: 70 },
                        { Course: "Course 4", Grade: 82.3, PassGrade: 60 },
                        { Course: "Course 5", Grade: 93.1, PassGrade: 80 },
                        { Course: "Course 6", Grade: 79.6, PassGrade: 50 },
                        { Course: "Course 7", Grade: 87.4, PassGrade: 60 },
                        { Course: "Course 8", Grade: 91.2, PassGrade: 70 },
                        { Course: "Course 9", Grade: 78.5, PassGrade: 50 },
                        { Course: "Course 10", Grade: 84.9, PassGrade: 60 },
                        { Course: "Course 11", Grade: 92.7, PassGrade: 70 },
                        { Course: "Course 12", Grade: 76.2, PassGrade: 50 },
                        { Course: "Course 13", Grade: 86.3, PassGrade: 60 },
                        { Course: "Course 14", Grade: 93.8, PassGrade: 80 },
                        { Course: "Course 15", Grade: 79.8, PassGrade: 50 },
                        { Course: "Course 16", Grade: 88.1, PassGrade: 60 },
                        { Course: "Course 17", Grade: 90.5, PassGrade: 70 },
                        { Course: "Course 18", Grade: 77.6, PassGrade: 50 },
                        { Course: "Course 19", Grade: 85.2, PassGrade: 60 },
                        { Course: "Course 20", Grade: 91.9, PassGrade: 80 },
                        { Course: "Course 21", Grade: 76.4, PassGrade: 50 },
                        { Course: "Course 22", Grade: 84.7, PassGrade: 60 },
                        { Course: "Course 23", Grade: 92.4, PassGrade: 70 },
                        { Course: "Course 24", Grade: 79.1, PassGrade: 50 },
                        { Course: "Course 25", Grade: 87.8, PassGrade: 60 },
                        { Course: "Course 26", Grade: 89.5, PassGrade: 70 },
                        { Course: "Course 27", Grade: 75.9, PassGrade: 50 },
                        { Course: "Course 28", Grade: 82.6, PassGrade: 60 },
                        { Course: "Course 29", Grade: 93.2, PassGrade: 80 },
                        { Course: "Course 30", Grade: 77.3, PassGrade: 50 }
                    ];

                    // Prepare chart data
                    var labels = grades.map(function (grade) {
                        return grade.Course;
                    });

                    var gradeData = grades.map(function (grade) {
                        return grade.Grade;
                    });

                    var passGradeData = grades.map(function (grade) {
                        return grade.PassGrade;
                    });

                    var chartData = {
                        labels: labels,
                        datasets: [
                            {
                                label: 'Grade',
                                data: gradeData,
                                backgroundColor: 'rgba(255, 99, 132, 0.5)',
                                borderColor: 'rgba(255, 99, 132, 1)',
                                borderWidth: 1
                            },
                            {
                                label: 'Pass Grade',
                                data: passGradeData,
                                backgroundColor: 'rgba(75, 192, 192, 0.5)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1
                            }
                        ]
                    };

                    // Render chart
                    var ctx = document.getElementById('chart').getContext('2d');
                    var chart = new Chart(ctx, {
                        type: 'bar',
                        data: chartData,
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    });
                });
            </script>


            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var ctx = document.getElementById("paymentGraph").getContext("2d");

                    var paymentData = {
                        labels: ["Year 1", "Year 2", "Year 3"],
                        datasets: [{
                            label: "Amount Paid",
                            data: [5000, 6000, 7500],
                            backgroundColor: "rgba(54, 162, 235, 0.5)",
                            borderColor: "rgba(54, 162, 235, 1)",
                            borderWidth: 1
                        }]
                    };

                    var paymentChart = new Chart(ctx, {
                        type: "bar",
                        data: paymentData,
                        options: {
                            responsive: true,
                            scales: {
                                y: {
                                    beginAtZero: true,
                                    title: {
                                        display: true,
                                        text: "Amount (Rands)"
                                    }
                                },
                                x: {
                                    title: {
                                        display: true,
                                        text: "Year"
                                    }
                                }
                            }
                        }
                    });
                });
            </script>


            <script>
                // Hardcoded payment data
                var paymentData = [
                    { name: "John Doe", date: "2022-01-01", department: "Science", amountPaid: 500.00 },
                    { name: "Jane Smith", date: "2022-02-05", department: "Commerce", amountPaid: 750.00 },
                    { name: "Michael Johnson", date: "2022-03-10", department: "History", amountPaid: 1000.00 },
                    { name: "Emily Davis", date: "2022-04-15", department: "Science", amountPaid: 600.00 },
                    { name: "William Brown", date: "2022-05-20", department: "Commerce", amountPaid: 800.00 },
                    { name: "Olivia Wilson", date: "2022-06-25", department: "History", amountPaid: 900.00 },
                    { name: "James Taylor", date: "2022-07-30", department: "Science", amountPaid: 550.00 },
                    { name: "Sophia Clark", date: "2022-08-05", department: "Commerce", amountPaid: 700.00 },
                    { name: "Benjamin Lewis", date: "2022-09-10", department: "History", amountPaid: 950.00 },
                    { name: "Mia Anderson", date: "2022-10-15", department: "Science", amountPaid: 400.00 },
                    { name: "Henry Rodriguez", date: "2022-11-20", department: "Commerce", amountPaid: 850.00 },
                    { name: "Ava Martinez", date: "2022-12-25", department: "History", amountPaid: 750.00 },
                    { name: "Joseph Hernandez", date: "2023-01-01", department: "Science", amountPaid: 700.00 },
                    { name: "Charlotte Young", date: "2023-02-05", department: "Commerce", amountPaid: 600.00 },
                    { name: "David Lee", date: "2023-03-10", department: "History", amountPaid: 900.00 },
                    { name: "Sofia Turner", date: "2023-04-15", department: "Science", amountPaid: 650.00 },
                    { name: "Alexander Walker", date: "2023-05-20", department: "Commerce", amountPaid: 750.00 },
                    { name: "Scarlett Hill", date: "2023-06-25", department: "History", amountPaid: 800.00 },
                    { name: "Daniel Green", date: "2023-07-30", department: "Science", amountPaid: 500.00 },
                    { name: "Grace Adams", date: "2023-08-05", department: "Commerce", amountPaid: 700.00 }
                ];

                // Function to dynamically populate the payment table
                function loadPaymentData() {
                    var tableBody = document.getElementById("paymentTable").getElementsByTagName("tbody")[0];

                    for (var i = 0; i < paymentData.length; i++) {
                        var payment = paymentData[i];
                        var row = tableBody.insertRow();
                        var nameCell = row.insertCell();
                        var dateCell = row.insertCell();
                        var departmentCell = row.insertCell();
                        var amountCell = row.insertCell();

                        nameCell.textContent = payment.name;
                        dateCell.textContent = payment.date;
                        departmentCell.textContent = payment.department;
                        amountCell.textContent = payment.amountPaid.toFixed(2);
                    }
                }

                // Call the function to load the payment data on page load
                loadPaymentData();
            </script>
        </div>

        <!--My subjects content-->

        <div id="mysubjects" style="display: none">
            <div class="container">
                <h1>Students</h1>
                <div class="row">
                    <asp:Repeater ID="studentRepeater" runat="server">
                        <ItemTemplate>
                            <div class="col-3">
                                <div class="card bg-success">
                                    <div class="card-header text-center">
                                        <span class="badge rounded-pill bg-primary text-black-50 p-3">
                                            <h5 class="mb-0">
                                                <%# (Eval("FirstName").ToString().Substring(0, 1) + Eval("LastName").ToString().Substring(0, 1)).ToUpper() %>
                                            </h5>
                                        </span>
                                    </div>
                                    <div class="card-body">
                                        <h6 class="card-subtitle mb-2 text-center">
                                            <span class="badge badge-primary">
                                                <%# Eval("FirstName") %> <%# Eval("LastName") %>
                                            </span>
                                        </h6>

                                        <p class="card-text text-white">Class: <%# Eval("ClassGrade") %></p>
                                        <p class="card-text text-white">Department: <%# Eval("Departmentid") %></p>
                                    </div>
                                    <div class="card-footer text-center">
                                        <button type="button" class="btn btn-primary rounded-pill" data-toggle="modal" data-target="#studentModal_<%# Eval("StudentId") %>">Show Details</button>
                                    </div>
                                </div>
                            </div>

                            <!-- Student Details Modal -->
                            <div class="modal fade" id="studentModal_<%# Eval("StudentId") %>" tabindex="-1" role="dialog" aria-labelledby="studentModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="studentModalLabel">
                                                <%# Eval("FirstName") %> <%# Eval("LastName") %>
                                            </h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p><strong>Class:</strong> <%# Eval("ClassGrade") %></p>
                                            <p><strong>Department:</strong> <%# Eval("Departmentid") %></p>
                                            <!-- Add more student details here -->
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

            </div>
        </div>


    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
</asp:Content>
