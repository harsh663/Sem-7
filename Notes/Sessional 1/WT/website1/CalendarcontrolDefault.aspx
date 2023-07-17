<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CalendarcontrolDefault.aspx.cs" Inherits="CalendarcontrolDefault" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" SelectionMode="DayWeek"></asp:Calendar>
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="show dates" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Validate date" />
    </form>
</body>
</html>
