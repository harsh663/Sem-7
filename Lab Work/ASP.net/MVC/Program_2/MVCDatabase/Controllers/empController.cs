using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCDatabase.Models;

namespace MVCDatabase.Controllers
{
    public class empController : Controller
    {
        private SqlConnection con;
        private void connection()
        {
            String CS = ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;
            con = new SqlConnection(CS);

        }
        // GET: emp
        public ActionResult AddNewEmp()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddNewEmp(empModel Emp)
        {
            if (ModelState.IsValid)
            {
                connection();
                SqlCommand com = new SqlCommand("InsertData", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@FName", Emp.FName);
                com.Parameters.AddWithValue("@MName", Emp.MName);
                com.Parameters.AddWithValue("@LName", Emp.LName);
                com.Parameters.AddWithValue("@Email_ID", Emp.EmailId);
                con.Open();
                int i = com.ExecuteNonQuery();
                con.Close();
                if (i >= 1)
                {

                    ViewBag.Message = "New Employee Added Successfully";

                }
            }
            ModelState.Clear();
            return View();
        }
    }
}