using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CalcMVC.Models;

namespace CalcMVC.Controllers
{
    public class CalculatorController : Controller
    {
        // GET: Calculator
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(CalculatorModel model, string command)
        {
            if (command == "add")
            {
                model.Result = model.A + model.B;
            }
            if (command == "sub")
            {
                model.Result = model.A - model.B;
            }
            if (command == "mul")
            {
                model.Result = model.A * model.B;
            }
            if (command == "div")
            {
                model.Result = model.A / model.B;
            }
            return View(model);
        }
    }
}