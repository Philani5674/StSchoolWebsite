<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="studentReg.aspx.cs" Inherits="StSchoolWebsite3rdYearProject.studentReg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


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


</asp:Content>
