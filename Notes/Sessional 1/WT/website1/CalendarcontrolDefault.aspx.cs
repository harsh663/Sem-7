using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CalendarcontrolDefault : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.Write("Shortdate="+Calendar1.SelectedDate.ToShortDateString() + "<br/>");
        Response.Write("Long date="+Calendar1.SelectedDate.ToLongDateString() + "<br/>");

        foreach (DateTime t in Calendar1.SelectedDates)
        {
            Response.Write("<br/>"+t.ToShortDateString() + "<br/>");
        
        
        }




    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DateTime todaydate = DateTime.Now;
        Response.Write("start date="+todaydate.ToShortDateString());

        DateTime enddate = todaydate.AddDays(15);
        Response.Write("end date=" + enddate.ToShortDateString());

        DateTime selecteddate=Calendar1.SelectedDate;

        if (selecteddate > todaydate && selecteddate < enddate)
        {

            Response.Write("your registration is successful");


        }

        else
        {
            Response.Write("you selected date which is after the end date");
        
        }









    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

        Response.Write("Shortdate=" + Calendar1.SelectedDate.ToShortDateString() + "<br/>");
        Response.Write("Long date=" + Calendar1.SelectedDate.ToLongDateString() + "<br/>");

    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {

        //if (e.Day.Date.ToShortDateString() == "28-07-2021") 
        //{
        //    e.Day.IsSelectable = false;
        
        //}

        if (!e.Day.IsOtherMonth)
        {
            if (e.Day.DayNumberText == "28")
            {
                e.Day.IsSelectable = false;

            }
        }
        if (e.Day.Date.ToShortDateString() == "15-07-2021")
        {
            e.Day.IsSelectable = false;
            HyperLink l = new HyperLink();
            l.NavigateUrl = "~/default2.aspx";
            l.Text = "result";
            e.Cell.Controls.Add(l);


        }
      
        if (e.Day.IsWeekend)
        {
            e.Day.IsSelectable = false;
        
        }


    }
}