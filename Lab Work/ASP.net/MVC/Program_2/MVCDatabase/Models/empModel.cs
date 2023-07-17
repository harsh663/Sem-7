using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCDatabase.Models
{
    public class empModel
    {
        [Display(Name = "First Name")]
        [Required(ErrorMessage = "First Name is required.")]
        public string FName
        {
            get;
            set;
        }
        [Display(Name = "Middle Name")]
        public string MName
        {
            get; set;

        }
        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "Last Name is required.")]
        public string LName
        {
            get; set;
        }

        [Display(Name = "Email Address")]
        [DataType(DataType.EmailAddress, ErrorMessage = "Invalid emaild address")]
        [Required(ErrorMessage = "Emailld is required.")]
        public string EmailId
        {
            get; set;
        }
    }
}