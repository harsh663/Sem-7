using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Experiment5
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ltr_click.Text = "<font color=\"#FF4444\"> You click at X = " + e.X.ToString() + " Y = " + e.Y.ToString();
        }

        protected void ImageMap1_Click(object sender, ImageMapEventArgs e)
        {
            ltrmap_postback.Text = "<font color=\"green\">You selected the " + e.PostBackValue + "</font>";
        }
    }
}