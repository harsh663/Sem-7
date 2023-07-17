using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ITDEPT : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("this is itdept page_load event");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "hello from content";

    TextBox1.Text=    ((DropDownList)Master.FindControl("DropDownList1")).SelectedItem.Text;



    }
}