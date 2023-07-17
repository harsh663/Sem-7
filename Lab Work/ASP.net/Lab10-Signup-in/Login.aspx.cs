using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab10_Signup_in
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\ASP.net\\Lab10-Signup-in\\App_Data\\Database1.mdf;Integrated Security=True";
            cn.Open();
            SqlCommand cm = new SqlCommand("select Password from [UserData] where ( UserId='" + TextBox1.Text + "')", cn);
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable ds = new DataTable("T1");
            int i = cm.ExecuteNonQuery();
            da.Fill(ds);
            //da.Fill(ds, "T1");
            cn.Close();
            //Response.Write(ds.Rows[0][0].ToString());
            if (ds.Rows[0][0].ToString() == TextBox2.Text)
            {
                Session["id"] = TextBox1.Text;
                Response.Redirect("Profile.aspx");
            }
            else { Response.Write("Check Password or UserName"); }
        }
    }
}