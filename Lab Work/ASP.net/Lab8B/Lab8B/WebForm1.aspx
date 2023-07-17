<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Lab8B.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script type="text/javascript">
        function showpreview(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('imgpreview').setAttribute('style', 'visibility: visible;');
                    document.getElementById('imgpreview').setAttribute('src', e.target.result);
                    
                }
                reader.readAsDataURL(input.files[0]);
            }

        }

    </script>
</head>
<body style="background-color:lightskyblue;">
    <form id="form1" runat="server">
        <div>
         
            <asp:FileUpload ID="FileUpload1" runat="server" onchange="showpreview(this);" />
            <br />
            <p>Please attach a png or jpeg image of less than 25000 bytes</p>
            <br />
            <asp:Button ID="Button2" runat="server" Text="Upload file" Width="131px" OnClick="Button2_Click" />
            <br />
            <img id="imgpreview" height="200" width="200" src="" style="border-width: 0px; visibility: hidden; " />
            
        </div>
        </form>
</body>
</html>
