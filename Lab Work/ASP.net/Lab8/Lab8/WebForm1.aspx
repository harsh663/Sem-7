<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Lab8.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="it" runat="server">
    <h2 style="background-color:lightpink;">IT Dept</h2>
   
    <h3>Faculty List</h3>  
    <table  border="4" bordercolor="black" style="background-color:whitesmoke;">
        <tr>
            <th style="width: 319px">Name</th>
            <th style="width: 285px">Designation</th>
        </tr>
        <tr>
            <td style="width: 319px">Dr. Vipul K. Dabhi</td>
            <td style="width: 285px">Associate Professor & Head</td>
        </tr>
        <tr>
            <td style="width: 319px">Dr. Harshadkumar B. Prajapati</td>
            <td style="width: 285px">Associate Professor </td>
        </tr>
        <tr>
            <td style="width: 319px">Prof. Ravindra A. Vyas</td>
            <td style="width: 285px">Assistant Professor </td>
        </tr>
    </table>

</asp:Content>