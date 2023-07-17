<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Lab8.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ce" runat="server">
    <h2 style="background-color:lightpink;">CE Dept</h2>
   
    <h3>Faculty List</h3>  
    <table border="4" bordercolor="black" style="background-color:whitesmoke;">
        <tr>
            <th style="width: 252px">Name</th>
            <th style="width: 287px">Designation</th>
        </tr>
        <tr>
            <td style="width: 252px">Dr. C. K. Bhensdadia</td>
            <td style="width: 287px">Associate Professor & Head</td>
        </tr>
        <tr>
            <td style="width: 252px">Dr. Brijesh S. Bhatt</td>
            <td style="width: 287px">Associate Professor </td>
        </tr>
        <tr>
            <td style="width: 252px">Prof. Parag H Dave</td>
            <td style="width: 287px">Assistant Professor </td>
        </tr>
    </table>

</asp:Content>