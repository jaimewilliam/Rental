//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SimpleRental.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class RentalHeader
    {
        public int RentalID { get; set; }
        public Nullable<int> CustomerFK { get; set; }
        public Nullable<System.DateTime> DateRented { get; set; }
        public Nullable<int> MovieFK { get; set; }
        public Nullable<System.DateTime> DateReturned { get; set; }
    }
}
