<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tablecreate.aspx.cs" Inherits="TableCreation.Tablecreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Generate Table</title>
    <style type="text/css">
        .auto-style1 {
            width: 146px;
        }
        .auto-style2 {
            width: 180px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Table</h1>
        <table style="background-color: darkcyan">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lab_rows" runat="server" Text="Rows"></asp:Label></td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownRows" runat="server" Width="180px">
                        <asp:ListItem Value="-1">Select Row Count</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lab_cols" runat="server" Text="Columns"></asp:Label></td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownCols" runat="server" Width="180px">
                        <asp:ListItem Value="-1">Select Column Count</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lab_grid" runat="server" Text="Grid Lines"></asp:Label></td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownGrid" runat="server" Width="180px">
                        <asp:ListItem Value="-1">Select Grid Line</asp:ListItem>
                        <asp:ListItem Value="0">None</asp:ListItem>
                        <asp:ListItem Value="1">Horizontal</asp:ListItem>
                        <asp:ListItem Value="2">Vertical</asp:ListItem>
                        <asp:ListItem Value="3">Both</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="Center">
                    <asp:Button ID="draw_table" runat="server" Text="Draw Table" OnClick="drawTable" /></td>
            </tr>
        </table>
    </form>
    <h2>Table as per the Selection</h2>
    <div style="background-color: darkcyan">
        
        <asp:PlaceHolder ID="display_table" runat="server"></asp:PlaceHolder>
    </div>
</body>
</html>
