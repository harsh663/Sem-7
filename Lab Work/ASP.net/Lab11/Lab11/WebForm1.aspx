<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Lab11.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView runat="server" ID="GridView1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Emp_Id" DataSourceID="SqlDataSource1" CellSpacing="2">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Emp_Id" HeaderText="Emp_Id" InsertVisible="False" ReadOnly="True" SortExpression="Emp_Id" />
                    <asp:BoundField DataField="Emp_name" HeaderText="Emp_name" SortExpression="Emp_name" />
                    <asp:BoundField DataField="Emp_salary" HeaderText="Emp_salary" SortExpression="Emp_salary" />
                    <asp:BoundField DataField="Emp_conutry" HeaderText="Emp_conutry" SortExpression="Emp_conutry" />
                    <asp:BoundField DataField="Emp_department" HeaderText="Emp_department" SortExpression="Emp_department" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Employee] WHERE [Emp_Id] = @Emp_Id" InsertCommand="INSERT INTO [Employee] ([Emp_name], [Emp_salary], [Emp_conutry], [Emp_department]) VALUES (@Emp_name, @Emp_salary, @Emp_conutry, @Emp_department)" SelectCommand="SELECT * FROM [Employee]" UpdateCommand="UPDATE [Employee] SET [Emp_name] = @Emp_name, [Emp_salary] = @Emp_salary, [Emp_conutry] = @Emp_conutry, [Emp_department] = @Emp_department WHERE [Emp_Id] = @Emp_Id" >
                <DeleteParameters>
                    <asp:Parameter Name="Emp_Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Emp_name" Type="String" />
                    <asp:Parameter Name="Emp_salary" Type="Decimal" />
                    <asp:Parameter Name="Emp_conutry" Type="String" />
                    <asp:Parameter Name="Emp_department" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Emp_name" Type="String" />
                    <asp:Parameter Name="Emp_salary" Type="Decimal" />
                    <asp:Parameter Name="Emp_conutry" Type="String" />
                    <asp:Parameter Name="Emp_department" Type="String" />
                    <asp:Parameter Name="Emp_Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="3" DataKeyNames="Emp_Id" DataSourceID="SqlDataSource2" Height="50px" Width="125px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="Emp_Id" HeaderText="Emp_Id" InsertVisible="False" ReadOnly="True" SortExpression="Emp_Id" />
                    <asp:BoundField DataField="Emp_name" HeaderText="Emp_name" SortExpression="Emp_name" />
                    <asp:BoundField DataField="Emp_salary" HeaderText="Emp_salary" SortExpression="Emp_salary" />
                    <asp:BoundField DataField="Emp_conutry" HeaderText="Emp_conutry" SortExpression="Emp_conutry" />
                    <asp:BoundField DataField="Emp_department" HeaderText="Emp_department" SortExpression="Emp_department" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Employee] WHERE [Emp_Id] = @Emp_Id" InsertCommand="INSERT INTO [Employee] ([Emp_name], [Emp_salary], [Emp_conutry], [Emp_department]) VALUES (@Emp_name, @Emp_salary, @Emp_conutry, @Emp_department)" SelectCommand="SELECT * FROM [Employee] WHERE ([Emp_Id] = @Emp_Id2)" UpdateCommand="UPDATE [Employee] SET [Emp_name] = @Emp_name, [Emp_salary] = @Emp_salary, [Emp_conutry] = @Emp_conutry, [Emp_department] = @Emp_department WHERE [Emp_Id] = @Emp_Id">
                <DeleteParameters>
                    <asp:Parameter Name="Emp_Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Emp_name" Type="String" />
                    <asp:Parameter Name="Emp_salary" Type="Decimal" />
                    <asp:Parameter Name="Emp_conutry" Type="String" />
                    <asp:Parameter Name="Emp_department" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="Emp_Id2" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Emp_name" Type="String" />
                    <asp:Parameter Name="Emp_salary" Type="Decimal" />
                    <asp:Parameter Name="Emp_conutry" Type="String" />
                    <asp:Parameter Name="Emp_department" Type="String" />
                    <asp:Parameter Name="Emp_Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
