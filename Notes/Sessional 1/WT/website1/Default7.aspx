<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default7.aspx.cs" Inherits="Default7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <p>
        <br />
    </p>
    <form id="form1" runat="server">
        <p>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="please enter first name" ValidationGroup="submit"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1" ControlToValidate="TextBox2" ErrorMessage="password does not match" Operator="GreaterThan" ValidationGroup="submit" ValueToCompare="select country"></asp:CompareValidator>
        </p>
        <p>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>select country</asp:ListItem>
                <asp:ListItem>india</asp:ListItem>
                <asp:ListItem>usa</asp:ListItem>
            </asp:DropDownList>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="DropDownList1" ErrorMessage="CompareValidator" Operator="NotEqual" ValidationGroup="submit" ValueToCompare="select country"></asp:CompareValidator>
        </p>
        <p>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="age must be between 18 to 99" MaximumValue="99" MinimumValue="18" Type="Integer" ValidationGroup="submit"></asp:RangeValidator>
        </p>
        <p>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="submit"></asp:RegularExpressionValidator>
        </p>
        <p>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="must enter email id" ValidationGroup="submit"></asp:RequiredFieldValidator>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="submit data" ValidationGroup="submit" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="clear data" ValidationGroup="clear" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    <div>
    
    </div>
    </form>
</body>
</html>
