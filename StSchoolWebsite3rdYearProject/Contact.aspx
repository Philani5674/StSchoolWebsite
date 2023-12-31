﻿<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="StSchoolWebsite3rdYearProject.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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
                        <a class="nav-link" href="#"><span class="user-name">John Doe</span></a>
                    </li>
                    <li class="nav-item">
                        <asp:Button runat="server" ID="logoutButton" CssClass="btn btn-primary" Text="Logout" />
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
            <div class="container">
                <h1>Registration</h1>
                <!-- Add your registration form or content here -->
            </div>
        </div>

        <!--Reports content -->

        <div id="reports" style="display: none;">
            <div class="container">
                <h1>Reports</h1>
                <!-- Add your reports content or display reports here -->
            </div>
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
w