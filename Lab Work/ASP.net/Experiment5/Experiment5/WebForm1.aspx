<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Experiment5.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Images</title>
    <style type="text/css">
        .auto-style4 {
            margin-left: 0px;
            margin-top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">  
            <div>
                <asp:Image ID="Image1" runat="server" CssClass="auto-style4" Height="254px" ImageUrl="https://cdni.autocarindia.com/ExtraImages/20201203011846_wheels.jpg" Width="438px" />
                <asp:Literal ID="ltr_click" runat="server" />
                <asp:ImageButton ID="ImageButton1" runat="server" Height="227px" ImageUrl="https://cdn-1.motorsport.com/images/amp/0JBdwmM0/s6/formula-1-portuguese-gp-2021-m-2.jpg" Width="307px" PostBackUrl="https://www.ddu.ac.in/" onClick="ImageButton1_Click"/>
                <asp:Literal ID="ltrmap_postback" runat="server" />
                <asp:ImageMap ID="ImageMap1" runat="server" ImageUrl="https://img.etimg.com/thumb/msid-75549785,width-640,resizemode-4,imgsize-465423/the-fastest-mclaren.jpg" HotSpotMode="Navigate" OnClick="ImageMap1_Click" >
		            <asp:CircleHotSpot X="317" Y="277" Radius="20" NavigateUrl="https://www.ddu.ac.in/" AlternateText="Home Page" />
                    <asp:RectangleHotSpot Bottom="194" HotSpotMode="Navigate" Left="222" NavigateUrl="https://www.ddu.ac.in/" Right="326" Top="144" />
                    <asp:PolygonHotSpot Coordinates="334,194 , 424,166, 401,132,  332,124, 336,140" HotSpotMode="Navigate" NavigateUrl="https://www.ddu.ac.in/" />
                </asp:ImageMap>
                
            </div>  
        </form>  
</body>
</html>
