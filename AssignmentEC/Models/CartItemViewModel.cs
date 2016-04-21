using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using AssignmentEC.Models;

namespace AssignmentEC.Models
{
    public class CartItemViewModel
    {
        public string MobileName { get; set; }
        public string Color { get; set; }
        public string Price { get; set; }

        public CartItemViewModel() { }
        public CartItemViewModel(string mobileName, string color, string price)
        {
            this.MobileName = mobileName;
            this.Color = color;
            this.Price = price;
        }
        public static List<CartItemViewModel> CreateList(List<CartItem> lstCartItem)
        {
            assignment1Entities db = new assignment1Entities();
            List<CartItemViewModel> lstCartItemVM = new List<CartItemViewModel>();
            foreach(CartItem cartItem in lstCartItem)
            {
                CartItemViewModel cartItemVM = new CartItemViewModel();
                cartItemVM.Color = cartItem.Color;
                MobilePhone mobile = db.MobilePhones.Where(n => n.MobileID == cartItem.MobileID).SingleOrDefault();
                cartItemVM.MobileName = mobile.MobileName;
                cartItemVM.Price = String.Format("{0:0,0 vnđ}", mobile.Price);
                lstCartItemVM.Add(cartItemVM);
            }
            return lstCartItemVM;
        }
        //CODE CART
        public static List<CartItemViewModel> getListCartItem()
        {
            List<CartItemViewModel> lst = (List<CartItemViewModel>)HttpContext.Current.Session["PaypalCart"];
            return lst;
        }
    }
}