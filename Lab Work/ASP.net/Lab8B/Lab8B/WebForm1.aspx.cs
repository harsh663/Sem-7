using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab8B
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            if (FileUpload1.HasFile)
            {
                if (FileUpload1.PostedFile.ContentType == "image/jpeg" || FileUpload1.PostedFile.ContentType == "image/png")
                {
                    if (FileUpload1.PostedFile.ContentLength <= 25000)
                    {
                        FileUpload1.PostedFile.SaveAs("D://IT027//WT//lecture1//lecture1//upload_doc//" + FileUpload1.FileName.ToString());
                        Response.Write("File saved");
                    }
                    else
                        Response.Write("Attach a smaller file");
                }
                else
                    Response.Write("Attach an image only");
            }
            else
                Response.Write("Please attach a file");
        }
    }
}