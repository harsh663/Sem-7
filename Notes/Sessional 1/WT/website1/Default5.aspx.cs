using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int rows = Convert.ToInt32(DropDownList1.SelectedItem.Text);
        int cols = Convert.ToInt32(DropDownList2.SelectedItem.Text);
        Table tb = new Table();
        for (int r = 0; r < rows; r++)
        {

            TableRow tr = new TableRow();

            for (int c = 0; c < cols; c++)
            {
                TableCell tc = new TableCell();
                HyperLink l = new HyperLink();
                l.Text = "row: " + r + " col:" + c;
                tc.Controls.Add(l);
                tr.Cells.Add(tc);
            
            }
         Table1.Rows.Add(tr);
         //PlaceHolder1.Controls.Add(tb);
        }



       

    }
}