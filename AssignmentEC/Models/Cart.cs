//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AssignmentEC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cart
    {
        public int CartID { get; set; }
        public Nullable<int> CustomerID { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<int> TotalPrice { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> DateTranfer { get; set; }
        public string Status { get; set; }
        public string TypePayment { get; set; }
        public Nullable<bool> IsMobileTranfer { get; set; }
        public Nullable<bool> IsPaid { get; set; }
    }
}
