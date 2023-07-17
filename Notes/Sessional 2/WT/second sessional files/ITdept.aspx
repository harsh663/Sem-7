<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ITdept.aspx.cs" Inherits="ITdept" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ITcourse.aspx">course</asp:HyperLink>
                <asp:SiteMapPath ID="SiteMapPath1" runat="server">
                </asp:SiteMapPath>
            </td>

        </tr>

         <tr>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ITassign.aspx">assignment</asp:HyperLink></td>

        </tr>


    </table>
    </div>
    </form>
</body>
</html>
