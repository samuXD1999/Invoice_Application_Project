using Invoiceapplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Invoiceapplication.Areas.Admin.Controllers
{
    public class InvoiceController : Controller
    {
        InvoiceDBEntities db;
        public InvoiceController()
        {
            db = new InvoiceDBEntities();
        }
        public ActionResult Index()
        {
            return View();
        }
        

        public string AddInvoice(tblInvoice_details d)
        {
            db.tblInvoice_details.Add(d);
            db.SaveChanges();
            return "Invoice added succesfully";
        }
    }
}