using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab14_b
{
    public partial class User2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Application.Lock();
            Label1.Text = (string)Application["msg2"];
            Application.UnLock();
            Response.AppendHeader("Refresh", "7");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Application.Lock();
            string msg = Application["msg2"].ToString() + "User2" + ": " + TextBox1.Text +
           "<br/>";
            Application["msg2"] = msg.ToString();
            Label1.Text = Application["msg2"].ToString();
            Application.UnLock();
        }

    }
}