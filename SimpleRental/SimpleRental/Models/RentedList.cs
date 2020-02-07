using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SimpleRental.Models
{
    public class RentedList
    {
        [Display(Name = "Movie Name")]
        public string MovieName { get; set; }

        [Display(Name = "Genre Name")]
        public string GenreName { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Date Returned")]
        public DateTime? DateReturned { get; set; }

        public int MovieID { get; set; }
        public int RentedID { get; set; }
    }
}