<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="AssignmentEC.ThankYou" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>thank you</title>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    </form>
</body>
</html>
<script>
        $(document).ready(function () {
            alert("Thank you");
            window.location.href = "Home.aspx";
        });
    </script>
