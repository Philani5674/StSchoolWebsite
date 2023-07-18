<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="StSchoolWebsite3rdYearProject.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f5f5;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 40px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .container h2 {
            text-align: center;
            color: #333333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            color: #555555;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            background-color: #f9f9f9;
            color: #333333;
        }

        .card-group {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .card {
            width: calc(33% - 10px);
            background-color: #f9f9f9;
            border: none;
        }

        .card:hover {
            background-color: #e9e9e9;
            cursor: pointer;
        }

        .card-title {
            color: #333333;
        }

        .card-text {
            color: #777777;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>User Registration</h2>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" runat="server" required />
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" runat="server" required />
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" runat="server" required />
            </div>
            <div class="form-group">
                <label for="role">Role</label>
                <select class="form-control" id="role" name="role" runat="server" required >
                    <option value="">Select Role</option>
                    <option value="Student">Student</option>
                    <option value="Teacher">Teacher</option>
                    <option value="Principal">Principal</option>
                </select>
            </div>
            <div class="form-group">
                <label for="departmentId">Department</label>
                <div class="card-group">
                    <div class="card">
                        <input type="radio" class="card-input-element" id="departmentScience" name="departmentId" value="Science" runat="server" required>
                        <label class="card-body" for="departmentScience">
                            <h5 class="card-title">Science</h5>
                            <p class="card-text">Department of Science</p>
                        </label>
                    </div>
                    <div class="card">
                        <input type="radio" class="card-input-element" id="departmentHistory" name="departmentId" value="History" runat="server" required>
                        <label class="card-body" for="departmentHistory">
                            <h5 class="card-title">History</h5>
                            <p class="card-text">Department of History</p>
                        </label>
                    </div>
                    <div class="card">
                        <input type="radio" class="card-input-element" id="departmentCommerce" name="departmentId" value="Commerce" runat="server" required>
                        <label class="card-body" for="departmentCommerce">
                            <h5 class="card-title">Commerce</h5>
                            <p class="card-text">Department of Commerce</p>
                        </label>
                    </div>
                </div>
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
        </div>
    </form>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


