using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AssignmentEC.Models;

namespace AssignmentEC.Models
{
    public class CartViewModel
    {
        public int CartID { get; set; }
        public int? Quantity { get; set; }
        public string TotalPrice { get; set; }
        public string CreatedDate { get; set; }
        public string DateTransfer { get; set; }
        public string Status { get; set; }
        public string TypePayment { get; set; }
        public static List<CartViewModel> CreateList(List<Cart> lstCart)
        {
            List<CartViewModel> lstCartVM = new List<CartViewModel>();
            foreach(Cart cart in lstCart)
            {
                CartViewModel cartVM = new CartViewModel();
                cartVM.CartID = cart.CartID;
                cartVM.CreatedDate = String.Format("{0: dd/MM/yyyy}", cart.CreatedDate);
                cartVM.DateTransfer = String.Format("{0: dd/MM/yyyy}", cart.DateTranfer);
                cartVM.TotalPrice = String.Format("{0:0,0 vnđ}", cart.TotalPrice);
                cartVM.Quantity = cart.Quantity;
                cartVM.Status = cart.Status;
                cartVM.TypePayment = cart.TypePayment;
                lstCartVM.Add(cartVM);
            }
            return lstCartVM;
        }
    }
}