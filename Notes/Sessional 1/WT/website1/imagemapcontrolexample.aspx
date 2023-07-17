<%@ Page Language="C#" AutoEventWireup="true" CodeFile="imagemapcontrolexample.aspx.cs" Inherits="imagemapcontrolexample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ImageMap ID="ImageMap1" runat="server" ImageUrl="~/images/Tulips.jpg" OnClick="ImageMap1_Click">
            <asp:CircleHotSpot HotSpotMode="PostBack" PostBackValue="redcenterflower" Radius="100" X="470" Y="200" />
            <asp:RectangleHotSpot Bottom="450" HotSpotMode="Navigate" Left="150" NavigateUrl="~/Default2.aspx?id=left" Right="350" Target="_blank" Top="260" />
            <asp:PolygonHotSpot Coordinates="750,260,970,200,920,400,786,388" HotSpotMode="PostBack" PostBackValue="polygonrightside" />
        </asp:ImageMap>
    </div>
    </form>
</body>
</html>
