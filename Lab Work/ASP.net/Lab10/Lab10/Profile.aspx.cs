using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab10
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String s = Session["id"].ToString();
            //Response.Write(s.ToString());
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-VII\\WT\\Lab10\\App_Data\\Database1.mdf;Integrated Security=True";
            cn.Open();
            SqlCommand cm = new SqlCommand("select * from [UserData] where UserId='" + s.ToString() +"'", cn);
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable ds = new DataTable();
            cm.ExecuteNonQuery();
            da.Fill(ds);

            cn.Close();


        }
    }
}