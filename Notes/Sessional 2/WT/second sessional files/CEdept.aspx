<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CEdept.aspx.cs" Inherits="CEdept" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SiteMapPath ID="SiteMapPath1" runat="server">
        </asp:SiteMapPath>
        <br /><br /><br /><br /><br /><br />
    <div>
    <table>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/cecourse.aspx">course</asp:HyperLink></td>

        </tr>

         <tr>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/CEassign.aspx">assignment</asp:HyperLink></td>

        </tr>


    </table>
    </div>
    </form>
</body>
</html>
