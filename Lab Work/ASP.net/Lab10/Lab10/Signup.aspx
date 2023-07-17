<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Lab10.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Style="z-index: 1; left: 10px; top: 15px; position: absolute" Text="UserName"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; left: 97px; top: 16px; position: absolute"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" Style="z-index: 1; left: 96px; top: 55px; position: absolute"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server" Style="z-index: 1; left: 144px; top: 93px; position: absolute"></asp:TextBox>
            <asp:TextBox ID="TextBox4" runat="server" Style="z-index: 1; left: 141px; top: 134px; position: absolute"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Style="z-index: 1; left: 15px; top: 51px; position: absolute" Text="Password"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server" Style="z-index: 1; left: 14px; top: 92px; position: absolute"
            Text="Conform Password"></asp:Label>
        <asp:Label ID="Label4" runat="server" Style="z-index: 1; left: 19px; top: 132px; position: absolute"
            Text="City"></asp:Label>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="z-index: 1; left: 71px; top: 193px; position: absolute"
            Text="SignUp" />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2"
            ControlToValidate="TextBox3" ErrorMessage="Not Matched" Style="z-index: 1; left: 290px; top: 96px; position: absolute"></asp:CompareValidator>
    </form>
</body>
</html>