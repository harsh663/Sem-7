using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TableCreation
{
    public partial class Tablecreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void drawTable(object sender, EventArgs e)
        {
            Table t = new Table();
            t.CellPadding = 10;
            t.CellSpacing = 10;
            int rows = Convert.ToInt32(DropDownRows.SelectedValue.ToString()); int cols = Convert.ToInt32(DropDownCols.SelectedValue.ToString()); int grid = Convert.ToInt32(DropDownGrid.SelectedValue.ToString());

            if (rows == -1)
                Response.Write("Please select valid row numbers.");
            else if (cols == -1)
                Response.Write("Please select valid column numbers.");
            else if (grid == -1)
                Response.Write("Please select valid grid type.");
            else
            {
                t.GridLines = (GridLines)grid; for (int r = 0; r < rows; r++)
                {
                    TableRow tr = new TableRow(); for (int c = 0; c < cols; c++)
                    {
                        TableCell tc = new TableCell(); tc.Text = "table[" + r + "][" + c + "]"; tr.Cells.Add(tc);
                    }
                    t.Rows.Add(tr);
                }
                display_table.Controls.Add(t);
            }
        }

    }
}