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
    
    public partial class Assessment
    {
        public int Assessment_ID { get; set; }
        public Nullable<int> Report_Card_Template_ID { get; set; }
        public string Assessment_Details { get; set; }
    
        public virtual ReportCard_Template ReportCard_Template { get; set; }
    }
}
