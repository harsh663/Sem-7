<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicationchatuser2.aspx.cs" Inherits="applicationchatuser2" %>
<meta http-equiv="refresh" content="20" />
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:TextBox ID="TextBox1" runat="server" Height="251px" TextMode="MultiLine" Width="346px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Width="324px"></asp:TextBox>

        <asp:TextBox ID="search" name="Search" runat="server" onKeyPress="javascript:text_changed();"></asp:TextBox>
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Send" OnClick="Button1_Click" />
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
    </div>
    </form>
</body>
</html>
