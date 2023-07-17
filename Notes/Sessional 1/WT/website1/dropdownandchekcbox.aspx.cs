using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dropdownandchekcbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            ListItem l1 = new ListItem("USA", "4");
            DropDownList1.Items.Add(l1);
        
        }





    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = DropDownList1.SelectedItem.Text;
        Response.Write(DropDownList1.SelectedItem.Value);
        Response.Write("Selected index=" + DropDownList1.SelectedIndex.ToString());



       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        foreach (ListItem li in DropDownList1.Items)
        {

            Response.Write(li.Text);
        }


        
        

    }
}