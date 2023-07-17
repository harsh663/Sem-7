using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
       

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 1)
        {
            Label5.Text = DropDownList2.SelectedItem.Text;
        
        }
        if (e.CurrentStepIndex == 3)
        {
            Label1.Text = DropDownList1.SelectedItem.Text;
            Label2.Text = DropDownList2.SelectedItem.Text;
            Label3.Text = TextBox1.Text;
            Label4.Text = TextBox2.Text;

        }



        //Response.Write(e.CurrentStepIndex.ToString());


        //Response.Write(e.NextStepIndex.ToString());
    }
    protected void Wizard1_PreviousButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Response.Write(e.CurrentStepIndex.ToString());


        Response.Write(e.NextStepIndex.ToString());
    }
}