<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Enter first value"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="TxtFirstvalue" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Enter Second Value"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="TxtSecond" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Answer"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="Txtthird" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" CommandArgument="add" CommandName="math" OnCommand="Calc" Text="Add" />
&nbsp;
        <asp:Button ID="Button2" runat="server" CommandArgument="sub" CommandName="math" OnCommand="Calc" Text="sub" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" CommandArgument="multi" CommandName="math" OnCommand="Calc" Text="multiplication" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" CommandArgument="div" CommandName="math" OnCommand="Calc" Text="division" />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
