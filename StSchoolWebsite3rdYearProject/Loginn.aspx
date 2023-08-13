<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginn.aspx.cs" Inherits="StSchoolWebsite3rdYearProject.Loginn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>
    <section class="vh-100">
        <div class="container py-5 h-100">
            <div class="row d-flex align-items-center justify-content-center h-100">
                <div class="col-md-8 col-lg-7 col-xl-6">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg" class="img-fluid" alt="Phone image" />
                </div>
                <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                    <form runat="server">
                        <!-- Username input -->
                        <div class="form-outline mb-4">
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
                            <label class="form-label" for="txtUsername">Username</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control form-control-lg"></asp:TextBox>
                            <label class="form-label" for="txtPassword">Password</label>
                        </div>

                        <div class="d-flex justify-content-around align-items-center mb-4">
                            <!-- Checkbox -->
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="form1Example3" checked />
                                <label class="form-check-label" for="form1Example3">Remember me </label>
                            </div>
                            <a href="#!">Forgot password?</a>
                        </div>

                        <!-- Submit button -->
                        <asp:Button ID="btnLogin" runat="server" Text="Sign in" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnLogin_Click" />

                        <div class="divider d-flex align-items-center my-4">
                            <p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
                        </div>

                        <a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998" href="Register.aspx"
                            role="button">
                            Register
                        </a>
                        <a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee" href="studentReg.aspx"
                            role="button">
                            <i class="fab fa-twitter me-2"></i>Register as a student</a>

                    </form>
                </div>
            </div>
        </div>
    </section>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
