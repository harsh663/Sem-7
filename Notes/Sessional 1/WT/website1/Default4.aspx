<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="1">
        <tr><td>Enter your name</td><td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td></tr>
         <tr><td>Enter your surname</td><td>
             <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td></tr>
         <tr><td>your name is </td><td>
             <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td></tr>
        <tr><td colspan="2" align="center">
            <asp:Button ID="Button1" runat="server" Text="show full name" OnClick="Button1_Click" /></td></tr>
    </table>
    </div>
    </form>
</body>
</html>
