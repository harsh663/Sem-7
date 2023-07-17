using System;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterUser(object sender, EventArgs e)
        {
            string Eid, Fname, Lname, DOB, Gender, Marital_Status, Hobies;
            Eid = TextBox1.Text;
            Fname = TextBox2.Text;
            Lname = TextBox3.Text;
            DOB = TextBox4.Text;
            Gender = RadioButtonList1.SelectedValue;
            Marital_Status = RadioButtonList2.SelectedValue;

            if (checkboxlist1.SelectedIndex >= 0)
            {
                string state1 = "";
                foreach (ListItem s in checkboxlist1.Items)
                {
                    if (s.Selected)
                    {

                        state1 += s + ",";

                    }
                }
                state1 = state1.Substring(0, state1.Length - 1);

                Hobies = state1;



            }
            else
            {
                Hobies = "";
            }
            String ans = "Employee id: " + Eid + "\nFirst Name: " + Fname + "\nLast Name: " + Lname + "\nDOB: " + DOB + "\nMarital Status: " + Marital_Status + "\nGender: " + Gender + "\nHobbies: " + Hobies;
            TextArea1.InnerText = ans;
        }
    }
}