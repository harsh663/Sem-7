using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default7 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["username"] = null;


        if (TextBox1.Text == "ravi" && TextBox2.Text == "ravi")
        {
            Session["user"] = 1;
            Session["username"] = "ravi"; //ds.tables["T1"].rows[0]["username"].tostring();
            Response.Redirect("default8.aspx");
        }



    }
}