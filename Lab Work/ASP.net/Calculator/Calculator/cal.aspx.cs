using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Calculator
{
    public partial class cal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void calculate(object sender, CommandEventArgs e)
        {
            if (e.CommandName.ToString() == "Add")
            {
                Result.Text = Convert.ToString(Convert.ToInt32(TextBox1.Text) + Convert.ToInt32(TextBox2.Text));
            }
            else if (e.CommandName.ToString() == "Sub")
            {
                Result.Text = Convert.ToString(Convert.ToInt32(TextBox1.Text) - Convert.ToInt32(TextBox2.Text));
            }
            else if (e.CommandName.ToString() == "Mul")
            {
                Result.Text = Convert.ToString(Convert.ToInt32(TextBox1.Text) * Convert.ToInt32(TextBox2.Text));
            }
            else if (e.CommandName.ToString() == "Div")
            {
                int number1 = Convert.ToInt32(TextBox1.Text);
                int number2 = Convert.ToInt32(TextBox2.Text);
                if (number2 == 0)
                {
                    Result.Text = "Error: DivideByZero";
                }
                else
                {
                    Result.Text = Convert.ToString(number1 / number2);
                }
            }

        }
    }
}