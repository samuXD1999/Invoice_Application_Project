//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Invoiceapplication.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblInvoice_details
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblInvoice_details()
        {
            this.tblInvoice_payments = new HashSet<tblInvoice_payments>();
            this.tblInvoice_products = new HashSet<tblInvoice_products>();
        }
    
        public int invoice_id { get; set; }
        public Nullable<int> customer_id { get; set; }
        public Nullable<System.DateTime> invoice_date { get; set; }
        public Nullable<double> invoice_amount { get; set; }
    
        public virtual tblCustomer tblCustomer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblInvoice_payments> tblInvoice_payments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblInvoice_products> tblInvoice_products { get; set; }
    }
}
