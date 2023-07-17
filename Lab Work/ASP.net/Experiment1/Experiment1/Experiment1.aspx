<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Experiment1.aspx.cs" Inherits="Experiment1.Experiment1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 30px;
        }    
        .auto-style2 {
            width: 361px;
        }
        .auto-style3 {
            margin-left: 76px;
        }
        .auto-style4 {
            margin-left: 54px;
        }
        .auto-style5 {
            margin-left: 101px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color:azure;">
        <div class="auto-style2">
            <br />
            <asp:Label ID="Label1" runat="server" Text="First Name:" Width="95px"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Last Name:" Width="95px"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style1"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="University:" Width="95px"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style1"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Semester:" Width="95px"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style1"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Age:" Width="95px"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style1"></asp:TextBox>
            <br />
            <p>
        	    E mail:
        	    <asp:TextBox ID="TextBox7" runat="server" CssClass="auto-style3" ></asp:TextBox>
    	    </p>
    	    <p>
        	Education:
        	<asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style4">
            	<asp:ListItem>Graduate</asp:ListItem> 
            	<asp:ListItem>Post Graduate</asp:ListItem>
            	<asp:ListItem>Doctoral</asp:ListItem>
        	</asp:DropDownList>
            </p>

            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" CssClass="auto-style5" />
        </div>
    </form>
</body>
</html>
