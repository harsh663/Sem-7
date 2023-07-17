<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body bgcolor="#3366ff">
    <form id="form1" runat="server">
    <br />
    <br />
    <p style="font-size: large; color: #800000">
        The DC Creation</p>
    <div>
        <table>
            <tr>
                <td>
                    Name
                </td>
                <td>
                    <asp:TextBox ID="txtUserId" ValidationGroup="Validform" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="#CC0000"
                        ValidationGroup="Validform" ControlToValidate="txtUserId" runat="server" ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Email Id
                </td>
                <td>
                    <asp:TextBox ID="txtmail" ValidationGroup="Validform" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Validform"
                        ControlToValidate="txtmail" Display="Dynamic" ForeColor="#CC0000" ErrorMessage="Email Id Required"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Invalid Email Address"
                        ControlToValidate="txtmail" SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ValidationGroup="Validform" Display="Dynamic" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Gender
                </td>
                <td>
                    <asp:DropDownList ID="ddlType" ValidationGroup="Validform" runat="server">
                        <asp:ListItem Value="0">-Select-</asp:ListItem>
                        <asp:ListItem Value="1">Male</asp:ListItem>
                        <asp:ListItem Value="2">Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ForeColor="#CC0000"
                        ValidationGroup="Validform" runat="server" ControlToValidate="ddlType" ErrorMessage="Gender is Required"
                        InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Password
                </td>
                <td>
                    <asp:TextBox ID="txtPass1" runat="server" ValidationGroup="Validform" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ForeColor="#CC0000"
                        ValidationGroup="Validform" runat="server" ControlToValidate="txtPass1" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Confirm Password
                </td>
                <td>
                    <asp:TextBox ID="txtPass2" runat="server" ValidationGroup="Validform" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ForeColor="#CC0000"
                        ValidationGroup="Validform" ControlToValidate="txtPass2" runat="server" ErrorMessage="Please Confrim Password"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ForeColor="#CC0000"
                        ValidationGroup="Validform" ControlToValidate="txtPass2" ErrorMessage="Password not Matching"
                        ControlToCompare="txtPass1"></asp:CompareValidator>
                </td>
                <td>
                   <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Validform" runat="server"
                        Display="Dynamic" ForeColor="#CC0000" ShowMessageBox="true" ShowSummary="false" />
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                    <asp:Button ID="btnSave" ValidationGroup="Validform" runat="server" Text="Create"
                        OnClick="btnSave_Click" />
                    <asp:Button ID="Button1" runat="server" Text="Reset" />
                 
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
