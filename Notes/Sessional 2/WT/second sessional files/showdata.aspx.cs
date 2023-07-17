using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class showdata : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["data"] != null)
        {
            GridView1.DataSource = (DataSet)Session["data"];
            GridView1.DataBind();
        }



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet ds = (DataSet)Session["data"];
       

        foreach (DataRow r in ds.Tables["T1"].Rows)
        {

            Response.Write("empid=" + r["employee_id"] + " emp name=" + r["employee_name"].ToString() + " emp salary=" + r["employee_salary"].ToString() + "<br/>");
        
        }

        
    }
}