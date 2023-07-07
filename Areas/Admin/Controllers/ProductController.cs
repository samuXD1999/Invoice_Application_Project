using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Invoiceapplication.Models;

namespace Invoiceapplication.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        InvoiceDBEntities db;
        public ProductController()
        {
            db= new InvoiceDBEntities();    
        }
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetProduct()
        {
            return Json(GetAllProduct(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetProductById(int id)
        {
            ProductModel p=GetAllProduct().FirstOrDefault(e=>e.product_id.Equals(id));
            return Json(p, JsonRequestBehavior.AllowGet);
        }

        public List<ProductModel> GetAllProduct()
        {
            List<ProductModel> lst= new List<ProductModel>();
            foreach(tblProduct p in db.tblProducts.ToList())
            {
                ProductModel pm = new ProductModel()
                {
                    product_id = p.product_id,
                    product_name = p.product_name,
                    rate = (float)p.rate,
                    tax = (float)p.tax,
                };
                lst.Add(pm);
            }
            return lst;
        }

        [HttpPost]
        public string AddProduct(tblProduct product)
        {
            db.tblProducts.Add(product);
            db.SaveChanges();
            return "Product Added Successfully";
        }

        [HttpPost]

        public string UpdateProduct(tblProduct product)
        {
            db.Entry<tblProduct>(product).State=System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return ("Product Updated Successfully");
        }
    }
}