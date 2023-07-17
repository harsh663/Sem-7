<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Lab10.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Style="z-index: 1; left: 8px; top: 43px; position: absolute"
                Text="UserName"></asp:Label>
            <asp:Label ID="Label2" runat="server" Style="z-index: 1; left: 11px; top: 74px; position: absolute"
                Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; left: 101px; top: 39px; position: absolute"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" Style="z-index: 1; left: 99px; top: 74px; position: absolute"></asp:TextBox>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="z-index: 1; left: 54px; top: 118px; position: absolute" Text="Login" />
    </form>
</body>
</html>
