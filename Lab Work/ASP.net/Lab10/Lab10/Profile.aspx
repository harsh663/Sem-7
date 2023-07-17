<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Lab10.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" Style="z-index: 1; left: 10px; top: 34px; position: absolute; height: 133px; width: 187px" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [UserData] WHERE [UserId] = @original_UserId AND [Password] = @original_Password AND [City] = @original_City" InsertCommand="INSERT INTO [UserData] ([UserId], [Password], [City]) VALUES (@UserId, @Password, @City)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UserData] WHERE ([UserId] = @UserId)" UpdateCommand="UPDATE [UserData] SET [Password] = @Password, [City] = @City WHERE [UserId] = @original_UserId AND [Password] = @original_Password AND [City] = @original_City">
                <DeleteParameters>
                    <asp:Parameter Name="original_UserId" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="UserId" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="id" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="original_UserId" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
