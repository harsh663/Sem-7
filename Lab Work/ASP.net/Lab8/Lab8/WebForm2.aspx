<%@ Page Language="C#"  MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Lab8.WebForm2" %>

<asp:Content ID="Content4" ContentPlaceHolderID="ec" runat="server">

    <h2 style="background-color:lightpink;">EC Dept</h2>
   
    <h3>Faculty List</h3>  
    <table border="4" bordercolor="black" style="background-color:whitesmoke;">
        <tr>
            <th style="width: 257px">Name</th>
            <th style="width: 272px">Designation</th>
        </tr>
        <tr>
            <td style="width: 257px">Dr. Purvang D. Dalal</td>
            <td style="width: 272px">Associate Professor & Head</td>
        </tr>
        <tr>
            <td style="width: 257px">Dr. H. S. Mazumdar</td>
            <td style="width: 272px">Associate Professor </td>
        </tr>
        <tr>
            <td style="width: 257px">Prof. Hetal B. Shah</td>
            <td style="width: 272px">Assistant Professor </td>
        </tr>
    </table>

</asp:Content>
