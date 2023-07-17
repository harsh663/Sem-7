<%@ Page Language="C#" AutoEventWireup="true" CodeFile="prgcheckboxlist.aspx.cs" Inherits="prgcheckboxlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Chinese manchurian" />
        <br />
        <br />
        <br />
        <asp:CheckBox ID="CheckBox2" runat="server" Text="Pizza" />
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <br />
        <br />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            <asp:ListItem>Chinese</asp:ListItem>
            <asp:ListItem>Pizza</asp:ListItem>
            <asp:ListItem>pav bhaji</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
