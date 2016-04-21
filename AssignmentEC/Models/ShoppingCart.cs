using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AssignmentEC.Models
{
    public class ShoppingCart
    {
        public string ProductName { get; set; }
        public int ProductID { get; set; }
        public int? Price { get; set; }
        public string timeInsurance { get; set; }
        public string color { get; set; }
    }
}