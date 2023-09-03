<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="StSchoolWebsite3rdYearProject.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top: 20px;">



        <!-- Admin Profile Section -->
        <div  class="container-fluid badge-dark hero">
            <div class="container-fluid">
                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
                    <div>
                        <h3 style="font-size: 24px;">Welcome,
                        <asp:Label ID="lblAdminName" runat="server" Text="Administrator" /></h3>
                        <p>
                            <span class="badge bg-danger">
                                <asp:Label ID="lblAdminEmail" runat="server" Text="admin@example.com" /></span>

                        </p>
                        <p>
                            <span class="badge bg-danger">
                                <asp:Label ID="lblAdminRole" runat="server" Text="Administrator" /></span>

                        </p>
                    </div>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-secondary bg-danger" OnClick="btnLogout_Click" />
                </div>
            </div>
        </div>

        <br />
           <div class="row">
        <div class="col-sm-6 col-md-4">
            <div class="card bg-light text-dark">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-info md-64">groups</span>
                        </div>
                        <div class="text-end">
                            <h3 id="TotalStudents" runat="server">0</h3>
                            <p class="mb-0 no-text-wrap">Total students</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="card bg-success text-light">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-white md-64">verified_user</span>
                        </div>
                        <div class="text-end">
                            <h3 id="TotalApproved" runat="server">0</h3>
                            <p class="mb-0 no-text-wrap">Approved Students</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="card bg-danger">
                <div class="card-body">
                    <div class="d-flex justify-content-between px-md-1">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-white md-64">gpp_maybe</span>
                        </div>
                        <div class="text-end">
                            <h3 class=" text-white" id="TotalUnapproved" runat="server">0</h3>
                            <a href="StudentValidation.aspx" target="_blank" class="mb-0 text-white no-text-wrap">Unapproved students</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <br />
        <!-- Make Payment Section -->
        <div class="container-fluid badge-light">

            <h3 style="margin-top: 30px;">All Students</h3>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-10 col-lg-10">
                        <label for="txtsearch">Search</label>
                        <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" BorderStyle="Solid" BorderWidth="2px" OnTextChanged="txtsearch_TextChanged"></asp:TextBox>
                    </div>
                    <div class="col-md-2 col-lg-2 col-sm-2">
                      <label for="Button1"></label>
                   <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary form-control" Text="Search by Name" OnClick="Button1_Click" />

                    </div>

                </div>
            </div>
            <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
                <Columns>
                    <asp:BoundField DataField="StudentId" HeaderText="Student ID" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                    <asp:BoundField DataField="AmountPaid" HeaderText="Amount Paid" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="AmountOwed" HeaderText="Amount Owed" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Registration" HeaderText="Registration" />
                    <asp:BoundField DataField="Classroom" HeaderText="Classroom" />
                </Columns>
            </asp:GridView>

        </div>


        <br />
        <!-- Register Student Section -->
        <div class="container-fluid badge-light">
            <!-- Register Student Section -->
            <h3 style="margin-top: 30px;">Register Student</h3>
            <div class="form-group">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <label for="txtStudentName">First Name</label>
                        <asp:TextBox ID="txtStudentName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <label for="txtStudentName">Last Name</label>
                        <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    
                </div>

                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <label for="txtStudentusrName">Username</label>
                        <asp:TextBox ID="txtStudentusrName" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </div>


                    <div class="col-lg-6 col-md-6">
                        <label for="txtpassword">Password</label>
                        <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                </div>


            </div>

            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <label for="ddlPlan">Select Department:</label>

                        <asp:DropDownList ID="ddlPlan" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPlan_SelectedIndexChanged">
                            <asp:ListItem Text="Select Plan" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Commerce Department" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Science Department" Value="1"></asp:ListItem>
                            <asp:ListItem Text="History Department" Value="2"></asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <label for="ddlClass">Select Student Grade:</label>
                        <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <label for="txtAmountOwed">Student Total Fees:</label>
                        <asp:TextBox ID="txtAmountOwed" runat="server" Text="0" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                        <label for="txtStudentName">Home Address</label>
                        <asp:TextBox ID="txtHomeAddress" runat="server"  CssClass="form-control"></asp:TextBox>
                    </div>
            </div>

            <div class="step-content ms-4 me-2" style="height: 100%">
                <div class="container mb-5">
                    <div style="background-color: gray" class="row">
                        <h1 class="lead text-center col-lg-12 col-md-12">Subjects selected</h1>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <ul class="list-group badge-light" id="Ul1" runat="server">

                                <%foreach (var co in new SchoolDatabaseManager().GetCoursesByDepartment(int.Parse(ddlPlan.SelectedItem.Value)))
                                    {%>
                                <li style="font-size: medium; background-color: none" class="row list-group-item d-flex justify-content-between align-items-center">
                                    <label class="col-md-4"><span style="font-size: smaller; background-color: darkred" class="badge purple white-text bg-danger rounded-pill px-3"><%=co.CourseId %></span> </label>
                                    <label class="col-md-4 text-start"><span style="font-size: smaller; background-color: green" class="badge purple white-text bg-danger rounded-pill px-3"><%=co.CourseName %></span></label>
                                    <label class="col-md-4 text-start"><span style="font-size: smaller; background-color: blue" class="white-text badge bg-primary rounded-pill px-3"><%=new SchoolDatabaseManager().GetDepartmentNameById(co.DepartmentId) %></span></label>
                                </li>

                                <%}%>
                                <li style="background-color: none; border-bottom-style: dashed, solid; border-bottom-color: red; border-bottom-width: 5px" class="row list-group-item d-flex justify-content-between align-items-center">
                                    <label class="text-start col-lg-4 col-md-4"></label>
                                    <label class="text-start col-lg-4 col-md-4"><span style="font-size: medium; font-family: 'Segoe UI'" class="badge purple white-text text-center rounded-pill px-3"><%= "Total Cost" %></span></label>
                                    <label class="text-start col-lg-4 col-md-4"><span style="font-size: medium; background-color: green" class="badge purple white-text text-center rounded-pill px-3"><%=decimal.Parse(txtAmountOwed.Text).ToString("C") %></span></label>

                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-0 col-lg-0 col-sm-0">
                    <asp:Button ID="CancelBtn" runat="server" Text="Cancel Registration" CssClass="btn btn-danger" Visible="false" />
                </div>
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <asp:Button ID="btnRegisterStudent" type="Button" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegisterStudent_Click" />
                </div>
            </div>


        </div>


        <br />
        <!-- Add Student to Class Section -->
        <div class="container-fluid badge-light">
            <h3 style="margin-top: 30px;">Make Student Payment</h3>
            <div class="form-group">
                <label for="ddlStudents">Select Student:</label>
                 
                <%foreach (var stu in new SchoolDatabaseManager().GetAllStudents()) { ddlStudents.Items.Add(new ListItem(stu.FirstName + " " + stu.LastName, stu.StudentId.ToString())); }%>
                <asp:DropDownList ID="ddlStudents" runat="server" AutoPostBack="false" CssClass="form-control" OnSelectedIndexChanged="ddlClasses_SelectedIndexChanged">
                </asp:DropDownList>

            </div>
            <div class="form-group">
                <label for="amount">Enter Amount:</label>
                <asp:TextBox ID="amoundt" BorderStyle="Solid" AutoPostBack="false" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <asp:Button ID="btnAddStudentToClass" runat="server" Text="Pay for student" CssClass="btn btn-primary" OnClick="btnAddStudentToClass_Click" />

        </div>
    </div>


    <!-- Add Bootstrap 5 JS and jQuery links -->

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Add script for Make Payment functionality -->

</asp:Content>
