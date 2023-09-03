<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="StSchoolWebsite3rdYearProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="card text-center">
            <div class="card-body">
                <img height="300" width="800" src="~/Content/Static/waiting.svg" runat="server" />


                <div class="badge badge-danger">
                    <p class="h3">
                        This registration has not been approved yet
                    </p>
                </div>

                <p class="h3 mt-3">Reason</p>
                <p id="NotApprovedReason" runat="server" class="h4 text-danger fst-italic"></p>
                <hr />
                <asp:PlaceHolder runat="server" ID="NumMissing" Visible="true">
                    <div class="row">
                        <div class="col-12 text-center">
                            <a href="Loginn.aspx" class="btn   btn-outline-success rounded-pill" runat="server">Back 2 Login</a>
                        </div>

                    </div>
                </asp:PlaceHolder>

                <div class="row">
                    <p class=" col-12  mt-3 text-center btn btn-secondary text-white">
                        Access to Student Portal will be available once the registartion has been approved
                    </p>
                </div>

            </div>
        </div>
    </form>



</body>
</html>

















