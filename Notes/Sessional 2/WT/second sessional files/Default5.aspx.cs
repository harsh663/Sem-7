using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        Response.Write(TreeView1.SelectedNode.Text);
        Response.Write(TreeView1.SelectedNode.Parent.Text);
   
            Response.Write(TreeView1.SelectedNode.Parent.Parent.Text);
        
        
       

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TreeNode t = new TreeNode("Company", "Company");
        
        
        
        TreeNode t1 = new TreeNode("TATA", "1");
       
        TreeNode t11 = new TreeNode("TCS", "1",null,"default2.aspx",null);
        TreeNode t12 = new TreeNode("TATA motors", "2");

        TreeNode t13 = new TreeNode("Tata salt", "3");
        t1.ChildNodes.Add(t11);
        t1.ChildNodes.Add(t12);
        t1.ChildNodes.Add(t13);
        t.ChildNodes.Add(t1);
        TreeView1.Nodes.Add(t);
    }
}