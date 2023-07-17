<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dropdownandchekcbox.aspx.cs" Inherits="dropdownandchekcbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>Select Counrty</asp:ListItem>
            <asp:ListItem Value="1">India</asp:ListItem>
            <asp:ListItem Value="2">sirlanka</asp:ListItem>
            <asp:ListItem Value="3">uk</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>
