<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Lab2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Registration</title>
    <style type="text/css">
        #TextArea1 {
            height: 257px;
            width: 460px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color:aquamarine;">
        <div>
            <p>
                Employee ID:&nbsp;
        	<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </p>
            <p>
                First&nbsp; name:&nbsp;
        	<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </p>
            <p>
                Last name:&nbsp;
        	<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </p>
            <p>
                Date Of Birth:&nbsp;
        	<asp:TextBox TextMode="Date" ID="TextBox4" runat="server"></asp:TextBox>
            </p>
            Gender:
    	    <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataTextField="Gender" DataValueField="Gender">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem>Other</asp:ListItem>
            </asp:RadioButtonList>
            <p>
            Marital Status:
            <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataTextField="MaritalStatus" DataValueField="MaritalStatus">
                <asp:ListItem>Married</asp:ListItem>
                <asp:ListItem>Unmarried</asp:ListItem>
            </asp:RadioButtonList>
            </p>
            <p>
            Hobbies:
            <asp:CheckBoxList id= "checkboxlist1" AutoPostBack = "true" TextAlign = "Right"  runat= "server">
                <asp:ListItem> Reading</asp:ListItem>
                <asp:ListItem> Writting</asp:ListItem>
                <asp:ListItem> Walking</asp:ListItem>
            </asp:CheckBoxList>
            </p>
                
            <br />
            <p>
                <asp:Button ID="Button1" runat="server"  Text="Register!" OnClick="RegisterUser" />
            </p>

        </div>
    </form>
    <div id ="Result" style="background-color:antiquewhite;">
        <textarea id="TextArea1" name="S1" runat="server"></textarea>
    </div>
</body>
</html>
