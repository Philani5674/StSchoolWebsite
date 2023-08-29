<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="StSchoolWebsite3rdYearProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Content/Static/favicon.ico" rel="shortcut icon" type="image/x-icon"/>
     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="card text-center">
    <div class="card-body">
        <img height="300" src="~/Content/Static/waiting.svg" runat="server" />

        <p class="h1">
            This registration has not been approved yet
        </p>
        <p class="h3 mt-3">Reason</p>
        <p id="NotApprovedReason" runat="server" class="h4 text-danger fst-italic"></p>
        <hr />
        <asp:PlaceHolder runat="server" ID="NumMissing" Visible="false">
            <p class="d-flex justify-content-center">
                <span class="material-icons-outlined md-24">notifications</span> Get notified about registration status
            </p>
            <a href="~/Account/AddPhoneNumber.aspx" class="btn btn-outline-secondary rounded-pill" runat="server">add phone number</a>
        </asp:PlaceHolder>
        <p class="text-muted tiny-text mt-3 text-center">
            Access to Student Portal will be available once the registartion has been approved
        </p>
    </div>
</div>
    </form>
</body>
</html>
