<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TreeView ID="TreeView1" runat="server" Height="393px" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" Width="199px">
            <DataBindings>
                <asp:TreeNodeBinding DataMember="Tree" />
                <asp:TreeNodeBinding DataMember="Product1" TextField="#InnerText" />
                <asp:TreeNodeBinding DataMember="Product_id" TextField="#InnerText" />
                <asp:TreeNodeBinding DataMember="Product_name" TextField="#InnerText" />
                <asp:TreeNodeBinding DataMember="Product_price" TextField="#InnerText" />
            </DataBindings>
        </asp:TreeView>
    
    </div>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XMLFile.xml"></asp:XmlDataSource>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>
