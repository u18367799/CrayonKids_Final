//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CrayonKidsAPI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Supplier_Order
    {
        public int Supplier_Order_ID { get; set; }
        public Nullable<int> School_ID { get; set; }
        public Nullable<int> Employee_ID { get; set; }
        public Nullable<int> Supplier_ID { get; set; }
        public string Supplier_Order_Details { get; set; }
    
        public virtual Employee Employee { get; set; }
        public virtual School School { get; set; }
        public virtual Supplier Supplier { get; set; }
    }
}
