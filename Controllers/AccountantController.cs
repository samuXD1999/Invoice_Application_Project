using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Invoiceapplication.Models;

namespace Invoiceapplication.Controllers
{
    public class AccountantController : Controller
    {
        InvoiceDBEntities db;
        public AccountantController()
        {
            db = new InvoiceDBEntities();
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string user_id, string password)
        {
            tblAccount_details ad = db.tblAccount_details.ToList().FirstOrDefault(e => e.user_id.Equals(user_id) & e.password.Equals(password));
            tblCustomer customer = db.tblCustomers.ToList().FirstOrDefault(c => c.email_address.Equals(user_id) & c.password.Equals(password));
            if (ad != null)
            {
                Session["user_id"] = user_id;
                Session["id"] = ad.account_id;
                Session.Timeout = 10;
                return Redirect("/Admin/Dashboard");
            }
            else if(customer!= null)
            {
                Session["user_id"] = user_id;
                Session["id"] = ad.account_id;
                Session.Timeout = 10;
                return Redirect("/Customer/Dashboard");
            }
            else
            {
                ViewBag.msg = "Invalid User Id or Password";
                return View();
            }
            
        }

        public ActionResult LogOut()
        {
            Session["user_id"] = null;
            Session["id"]= null;
            return RedirectToAction("Login");
        }
    }
}