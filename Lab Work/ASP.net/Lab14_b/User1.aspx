<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User1.aspx.cs" Inherits="Lab14_b.User1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>

                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="z-index: 1; left: 13px; top: 48px; position: absolute"
                    Text="Button" />

            </div>
            <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; left: 11px; top: 15px; position: absolute"></asp:TextBox>
            <p>

                <asp:Label ID="Label1" runat="server" Style="z-index: 1; left: 28px; top: 164px; position: absolute"
                    Text="Label"></asp:Label>
            </p>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Style="z-index: 1; left: 10px; top: 91px; position: absolute; height: 27px; width: 82px">
                <asp:ListItem>User2</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="Label2" runat="server" Style="z-index: 1; left: 229px; top: 165px; position: absolute"
                Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
