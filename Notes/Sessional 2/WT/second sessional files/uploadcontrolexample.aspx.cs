using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uploadcontrolexample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //application/pdf  image/jpeg  text/plain

        if (FileUpload1.HasFile)
        {
            if (FileUpload1.PostedFile.ContentType == "image/jpeg" || FileUpload1.PostedFile.ContentType == "image/png")
            {

                if (FileUpload1.PostedFile.ContentLength <= 775702)
                {

                    FileUpload1.PostedFile.SaveAs("E:\\odd 2021 wt\\secondsessional\\images\\" + FileUpload1.FileName.ToString());



                }
                else
                {

                    Response.Write("file should be less than 775702");
                }



            }
            else {
                Response.Write("File must have extension .jpeg and png only");
            
            }
        
        
        
        }
        //Response.Write("Contetn type="+FileUpload1.PostedFile.ContentType.ToString());
        //Response.Write("<br/>content lenght=" +FileUpload1.PostedFile.ContentLength);
        //Response.Write("<br/>content File name"+FileUpload1.FileName.ToString());
        //Response.Write(FileUpload1.HasFile.ToString());

       // FileUpload1.PostedFile.SaveAs("E:\\odd 2021 wt\\secondsessional\\images\\first.jpeg");



    }
}