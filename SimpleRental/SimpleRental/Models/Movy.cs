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
    
    public partial class Movy
    {
        public int MovieID { get; set; }
        public string MovieName { get; set; }
        public Nullable<int> GenreFK { get; set; }
        public Nullable<int> CustomerFK { get; set; }
    }
}
