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
    
    public partial class User_Tbl
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User_Tbl()
        {
            this.Parent_Guardian = new HashSet<Parent_Guardian>();
            this.Employees = new HashSet<Employee>();
        }
    
        public int User_ID { get; set; }
        public Nullable<int> User_Type_ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Parent_Guardian> Parent_Guardian { get; set; }
        public virtual User_Type User_Type { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Employee> Employees { get; set; }
    }
}