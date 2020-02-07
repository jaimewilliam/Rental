using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SimpleRental.Models
{
    public class NewList
    {
        [Display(Name = "Rental ID")]
        public int RentalID { get; set; }
        [Display(Name = "Customer Name")]
        public string CustomerName { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Date Rented")]
        public DateTime? DateRented { get; set; }

        public int? CustomerFK { get; set; }

        public List<RentedList> RentedLists { get; set; }
    }
}