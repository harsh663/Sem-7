using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Databaseconnect : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //establish the connection

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True";
        conn.Open();
        if (conn.State==ConnectionState.Open)
        {

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from employee where employee_name=@employee_name";
            cmd.Connection = conn;
            SqlParameter p = new SqlParameter("@employee_name", TextBox1.Text);
            cmd.Parameters.Add(p);
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds=new DataSet();
            da.SelectCommand = cmd;
           
            da.Fill(ds, "T1");
           
            if(ds.Tables["T1"].Rows.Count>0)
            TextBox2.Text = ds.Tables["T1"].Rows[0]["employee_salary"].ToString();

        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {


        //establish the connection

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True";
        conn.Open();

        //perform DML operation -Update operation
        SqlCommand cmd = new SqlCommand();
        if (conn.State == ConnectionState.Open)
        {
            string query="update [employee] set [employee_salary]=@employee_salary where [employee_name]=@employee_name";
            cmd.CommandText = query;

            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;

            SqlParameter p = new SqlParameter("@employee_salary",Convert.ToDouble(TextBox2.Text));
            SqlParameter p1 = new SqlParameter("@employee_name", TextBox1.Text);

            cmd.Parameters.Add(p);
            cmd.Parameters.Add(p1);


            int noofrowsaffected = cmd.ExecuteNonQuery();
            if (noofrowsaffected > 0)
            {

                Response.Write("record updated successfully");
            
            }




        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {


        //establish the connection

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True";
        conn.Open();

        //perform DML operation -Update operation
        SqlCommand cmd = new SqlCommand();
        if (conn.State == ConnectionState.Open)
        {
            string query="delete from [employee] where [employee_name]=@employee_name";
            cmd.CommandText = query;

            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;

            SqlParameter p1 = new SqlParameter("@employee_name", TextBox1.Text);

            cmd.Parameters.Add(p1);


            int noofrowsaffected = cmd.ExecuteNonQuery();
            if (noofrowsaffected > 0)
            {

                Response.Write("record updated successfully");
            
            }




        }
    }
}