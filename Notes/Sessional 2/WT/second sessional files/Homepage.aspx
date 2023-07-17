<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Homepage" %>

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
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ITdept.aspx">ITDEPT</asp:HyperLink></td>

            </tr>

            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/CEdept.aspx">ce dept</asp:HyperLink></td>

            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink3" runat="server">EC dept</asp:HyperLink></td>

            </tr>
        </table>




    </div>
        <asp:SiteMapPath ID="SiteMapPath1" runat="server">
        </asp:SiteMapPath>
    </form>
</body>
</html>
