using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Calc(object sender, CommandEventArgs e)
    {
        string cmdarg = e.CommandArgument.ToString();
        string cmdname = e.CommandName.ToString();

        //Response.Write("command argument"+cmdarg.ToString()+"<br/>");
        //Response.Write("command name=" + cmdname.ToString() + "<br/>");

        if (cmdname == "math")
        {
            if (cmdarg == "add")
            {
           
                Txtthird.Text = Convert.ToString(Convert.ToInt16(TxtFirstvalue.Text) + Convert.ToInt16(TxtSecond.Text));
  
            
            }

            if (cmdarg == "sub")
            {
                Txtthird.Text = Convert.ToString(Convert.ToInt16(TxtFirstvalue.Text) - Convert.ToInt16(TxtSecond.Text));
            }
            if (cmdarg == "div")
            {
                Txtthird.Text = Convert.ToString(Convert.ToInt16(TxtFirstvalue.Text) / Convert.ToInt16(TxtSecond.Text));
            }
        
        }



    }
}