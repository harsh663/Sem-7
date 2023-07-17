using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox3.Text =Convert.ToString( Convert.ToInt16(TextBox1.Text) + Convert.ToInt16( TextBox2.Text));
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox3.Text = Convert.ToString(Convert.ToInt16(TextBox1.Text) - Convert.ToInt16(TextBox2.Text));
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox3.Text = Convert.ToString(Convert.ToInt16(TextBox1.Text) * Convert.ToInt16(TextBox2.Text));
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt16(TextBox2.Text) > 0)
        {
            TextBox3.Text = Convert.ToString(Convert.ToInt16(TextBox1.Text) / Convert.ToInt16(TextBox2.Text));
 
        }
    }
}