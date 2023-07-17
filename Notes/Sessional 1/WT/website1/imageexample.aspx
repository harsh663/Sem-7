<%@ Page Language="C#" AutoEventWireup="true" CodeFile="imageexample.aspx.cs" Inherits="imageexample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <a href="~/default2.aspx"  >  <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl="~/images/Tulips.jpg" Width="200px" /></a>
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" Height="600px" ImageUrl="~/images/Jellyfish.jpg" OnClick="ImageButton1_Click" Width="600px" />
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
