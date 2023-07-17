using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
        
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write(GridView1.SelectedRow.Cells[2].Text);
        //   MultiView1.SetActiveView(View2);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
    }
}