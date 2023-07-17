<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User2.aspx.cs" Inherits="Lab14_b.User2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Style="z-index: 1; left: 16px; top: 84px; position: absolute"
                Text="Label"></asp:Label>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="z-index: 1; left: 15px; top: 45px; position: absolute"
                Text="Button" />
            <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; left: 13px; top: 13px; position: absolute"></asp:TextBox>
        </div>
    </form>
</body>
</html>
