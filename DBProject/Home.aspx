<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DBProject.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:BulletedList ID="BulletedList1" runat="server" OnClick="BulletedList1_Click">
            <asp:ListItem>hi</asp:ListItem>
            <asp:ListItem>hello</asp:ListItem>
            <asp:ListItem>welcome</asp:ListItem>
        </asp:BulletedList>
    </form>
</body>
</html>
