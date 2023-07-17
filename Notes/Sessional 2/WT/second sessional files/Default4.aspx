<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Wizard ID="Wizard1" runat="server" Height="438px" Width="617px" ActiveStepIndex="4" FinishDestinationPageUrl="~/Default.aspx" OnFinishButtonClick="Wizard1_FinishButtonClick" OnNextButtonClick="Wizard1_NextButtonClick" OnPreviousButtonClick="Wizard1_PreviousButtonClick">
            <WizardSteps>
                <asp:WizardStep runat="server" title="Select mobile company">


                    select mobile compnay<br />
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>Select company</asp:ListItem>
                        <asp:ListItem>Nokia</asp:ListItem>
                        <asp:ListItem>samsung</asp:ListItem>
                        <asp:ListItem>oppo</asp:ListItem>
                    </asp:DropDownList>


                </asp:WizardStep>
                <asp:WizardStep runat="server" StepType="Step" title="select mobile">
                    Select mobile phone<br />
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>samsung 11</asp:ListItem>
                        <asp:ListItem>samsung m51</asp:ListItem>
                        <asp:ListItem>samsung f62</asp:ListItem>
                        <asp:ListItem>samsung a22</asp:ListItem>
                    </asp:DropDownList>
                </asp:WizardStep>
                <asp:WizardStep runat="server" StepType="Step" Title="enter personal address">
                    Enter address information<br />
                    <asp:TextBox ID="TextBox1" runat="server" Height="115px" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </asp:WizardStep>
                <asp:WizardStep runat="server" StepType="Step" Title="enter credit card">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </asp:WizardStep>
                <asp:WizardStep runat="server" StepType="Finish" Title="summary">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </asp:WizardStep>
                <asp:WizardStep runat="server" StepType="Complete" Title="final confirmation">
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
    
    </div>
    </form>
</body>
</html>
