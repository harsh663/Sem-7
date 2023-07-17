using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab14_b
{
    public partial class User1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Application.Lock();
            Label1.Text = (string)Application["msg2"];
            Label2.Text = (string)Application["msg3"];
            Application.UnLock();
            Response.AppendHeader("Refresh", "7");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            Application.Lock();
            if ((RadioButtonList1.SelectedItem.ToString()).Equals("User2"))
            {
                string msg = Application["msg2"].ToString() + "User1" + ": " + TextBox1.Text +
               "<br/>";
                Application["msg2"] = msg.ToString();
                Label1.Text = Application["msg2"].ToString();
            }
            else if ((RadioButtonList1.SelectedItem.ToString()).Equals("User3"))
            {
                string msg = Application["msg3"].ToString() + "User1" + ": " + TextBox1.Text +
               "<br/>";
                Application["msg3"] = msg.ToString();
                Label2.Text = Application["msg3"].ToString();
            }

            Application.UnLock();
        }
    }
}