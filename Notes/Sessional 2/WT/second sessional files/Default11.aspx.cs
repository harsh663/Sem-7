using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default11 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Application.Lock();
        int count = (int)Application["counter"];
        count++;
        Application["counter"] = count;
        Application.UnLock();

        Response.Write(Application["counter"].ToString());


    }
}