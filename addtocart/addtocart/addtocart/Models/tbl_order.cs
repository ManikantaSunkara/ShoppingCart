//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace addtocart.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_order
    {
        public int o_id { get; set; }
        public Nullable<int> o_fk_pro { get; set; }
        public Nullable<int> o_fk_invoice { get; set; }
        public Nullable<System.DateTime> o_date { get; set; }
        public Nullable<int> o_qty { get; set; }
        public Nullable<double> o_bill { get; set; }
        public Nullable<int> o_unitprice { get; set; }
    
        public virtual tbl_invoice tbl_invoice { get; set; }
        public virtual tbl_product tbl_product { get; set; }
    }
}
