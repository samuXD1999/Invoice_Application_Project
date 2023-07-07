using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Invoiceapplication.Models
{
    public class DataModel
    {
    }

    public class CustomerModel
    {
        public int customer_id { get; set; }
        public string customer_name { get; set; }
        public string email_address { get; set; }
        public string mobile_number { get; set; }
        public string password { get; set; }
        public string city { get; set; }
        
    }

    public class ProductModel
    {
        public int product_id { get; set; }
        public string product_name { get; set; }
        public float rate { get; set; }
        public float tax { get; set; }
    }
}