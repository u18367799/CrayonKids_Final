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
    
    public partial class Appointment_Booking
    {
        public int Appointment_Booking_ID { get; set; }
        public string Appointment_Booking_Details { get; set; }
        public Nullable<int> Booking_Status_ID { get; set; }
        public Nullable<System.DateTime> Appointment_Booking_Date { get; set; }
    
        public virtual Booking_Status Booking_Status { get; set; }
    }
}