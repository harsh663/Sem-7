using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicationchatuser1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Application["chat"] != null)
        {
            Application.Lock();
            TextBox1.Text = (string)Application["chat"];
            Application.UnLock();
                    
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Application.Lock();
        Application["chat"] ="user1: "+ Application["chat"].ToString() + TextBox2.Text + " <br />";
        TextBox1.Text =   Application["chat"].ToString();
        Application.UnLock();
        TextBox2.Text = "";
    }
}