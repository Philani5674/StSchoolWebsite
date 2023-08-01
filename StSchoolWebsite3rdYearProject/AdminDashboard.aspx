<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="StSchoolWebsite3rdYearProject.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top: 20px;">



        <!-- Admin Profile Section -->
        <div class="container-fluid badge-dark">
        <div class="container-fluid bg-secondary rounded-pill">

            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
                <div>
                    <h3 style="font-size: 24px;">Welcome,
                        <asp:Label ID="lblAdminName" runat="server" Text="Admin" /></h3>
                    <p>
                       
                        <span class="badge bg-danger"><asp:Label ID="lblAdminEmail" runat="server" Text="admin@example.com" /></span>
                       
                    </p>
                    <p>
                        <span class="badge bg-danger"><asp:Label ID="lblAdminRole" runat="server" Text="Administrator" /></span>
                       
                    </p>
                </div>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-secondary bg-danger" OnClick="btnLogout_Click" />
            </div>
        </div></div>


        <br />
        <!-- Make Payment Section -->
        <div class="container-fluid badge-light">

            <h3 style="margin-top: 30px;">Make Payment</h3>
            <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
                <Columns>
                    <asp:BoundField DataField="StudentId" HeaderText="Student ID" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                    <asp:BoundField DataField="AmountPaid" HeaderText="Amount Paid" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="AmountOwed" HeaderText="Amount Owed" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Registration" HeaderText="Registration" />
                    <asp:BoundField DataField="Classroom" HeaderText="Classroom" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button runat="server" type="button" CssClass="btn btn-primary" Text="Make Payment" OnClientClick='<%# "makePayment(" + Eval("StudentId") + ");" %>' data-toggle="modal" data-target="#paymentModal" />                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>


        <br />
        <!-- Register Student Section -->
        <div class="container-fluid badge-light">
            <!-- Register Student Section -->
            <h3 style="margin-top: 30px;">Register Student</h3>
            <div class="form-group">
                <label for="txtStudentName">Student Name</label>
                <asp:TextBox ID="txtStudentName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlPlan">Select Plan:</label>
                <asp:DropDownList ID="ddlPlan" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPlan_SelectedIndexChanged">
                    <asp:ListItem Text="Select Plan" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Commerce" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Science" Value="2"></asp:ListItem>
                    <asp:ListItem Text="History" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlClass">Select Class:</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control">
                    
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtAmountOwed">Amount Owed:</label>
                <asp:TextBox ID="txtAmountOwed" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
            </div>
            <asp:Button ID="btnRegisterStudent" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegisterStudent_Click" />

        </div>


        <br />
        <!-- Assign Teacher to Course Section -->
        <div class="container-fluid badge-light">
            <h3 style="margin-top: 30px;">Assign Teacher to Course</h3>
            <div class="form-group">
                <label for="ddlTeachers">Select Teacher:</label>
                <asp:DropDownList ID="ddlTeachers" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlCourses">Select Course:</label>
                <asp:DropDownList ID="ddlCourses" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnAssignTeacherToCourse" runat="server" Text="Assign" CssClass="btn btn-primary" OnClick="btnAssignTeacherToCourse_Click" />
        </div>


        <br />
        <!-- Add Student to Class Section -->
        <div class="container-fluid badge-light">
            <h3 style="margin-top: 30px;">Add Student to Class</h3>
            <div class="form-group">
                <label for="ddlStudents">Select Student:</label>
                <asp:DropDownList ID="ddlStudents" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlClasses">Select Class:</label>
                <asp:DropDownList ID="ddlClasses" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnAddStudentToClass" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAddStudentToClass_Click" />
        </div>


        <br />
        <!-- Payment Modal -->
        <div class="container-fluid badge-light">
            <div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="paymentModalLabel">Make Payment</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h6>Student ID: <span id="modalStudentId" runat="server"></span></h6>
                            <h6>Student Name: <span id="modalStudentName" runat="server"></span></h6>
                            <div class="form-group">
                                <label for="txtPaymentAmount">Payment Amount:</label>
                                <asp:TextBox ID="txtPaymentAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPaymentAmount" runat="server" ControlToValidate="txtPaymentAmount" ErrorMessage="Payment amount is required." ValidationGroup="paymentValidation"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revPaymentAmount" runat="server" ControlToValidate="txtPaymentAmount" ErrorMessage="Invalid payment amount format." ValidationExpression="^\d+(\.\d{1,2})?$" ValidationGroup="paymentValidation"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <asp:Button ID="btnConfirmPayment" runat="server" Text="Confirm Payment" CssClass="btn btn-primary" ValidationGroup="paymentValidation" OnClick="btnConfirmPayment_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



<!-- Add Bootstrap 5 JS and jQuery links -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>




<!-- Add script for Make Payment functionality -->

</asp:Content>
