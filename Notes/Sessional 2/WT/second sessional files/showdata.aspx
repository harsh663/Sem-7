<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showdata.aspx.cs" Inherits="showdata" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="show data" />
        <br />
    
    </div>
    </form>
</body>
</html>
