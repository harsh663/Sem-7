using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class prgcheckboxlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            Response.Write("user want to eat chinese food <br/>");
        
        }
        if (CheckBox2.Checked == true)
        {
            Response.Write("user want to eat pizza food");

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string order = "";

        foreach (ListItem li in CheckBoxList1.Items)
        {
            if (li.Selected == true)
            {
                order = order + li.Text;
            }
        
        }
        Response.Write(order);


    }
}