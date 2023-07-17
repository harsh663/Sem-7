using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab10
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\ASP.net\\Lab10\\Lab10\\App_Data\\Database1.mdf;Integrated Security=True";
            cn.Open();

            SqlCommand cm = new SqlCommand("insert into [UserData] values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox4.Text + "')", cn);
            
            int i = cm.ExecuteNonQuery();
            cn.Close();
            if (i == 1) { Response.Redirect("Login.aspx"); }
            else { Response.Write("Error"); }
        }

    }
}