using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Invoiceapplication.Models;
using System.Data.Entity;

namespace Invoiceapplication.Areas.Admin.Controllers
{
    public class CustomerController : Controller
    {
        InvoiceDBEntities db;
        public CustomerController()
        {
            db = new InvoiceDBEntities();
        }
        public ActionResult Index()
        {
            return View(); 
        }

        public JsonResult GetCustomers()
        {
            List<CustomerModel> lst = GetAllCustomer();
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetCustomerById(int id)
        {
            CustomerModel c= GetAllCustomer().FirstOrDefault(e=>e.customer_id.Equals(id));
            return Json(c, JsonRequestBehavior.AllowGet);
        }
        public List<CustomerModel> GetAllCustomer()
        {
            List<CustomerModel> lst = new List<CustomerModel>();
            foreach (tblCustomer c in db.tblCustomers.ToList())
            {
                CustomerModel cm = new CustomerModel()
                {
                    customer_id = c.customer_id,
                    customer_name = c.customer_name,
                    city = c.city,
                    email_address = c.email_address,
                    mobile_number = c.mobile_number,
                    password = c.password
                };
                lst.Add(cm);
            }
            return lst;
        }

        [HttpPost]
        public string AddCustomer(tblCustomer customer)
        {
            db.tblCustomers.Add(customer);
            db.SaveChanges();
            return "Customer Added Successfully";
        }

        [HttpPost]
        public string UpdateCustomer(tblCustomer customer)
        {
            db.Entry<tblCustomer>(customer).State = EntityState.Modified;
            db.SaveChanges();
            return "Customer Updated Successfully";
        }
        
    }
}