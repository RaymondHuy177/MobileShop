using AssignmentEC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace AssignmentEC
{
    public partial class CartHistory : System.Web.UI.Page
    {
        assignment1Entities db = new assignment1Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] == null)
                    Response.Redirect("Register.aspx");
                User user = (User)Session["User"];
                currentUser.InnerText = user.LastName;
                currentUser.Attributes.Remove("href");
                currentUser.Attributes.Add("href", "CustomerInformation.aspx");
                List<Cart> lstCart = db.Carts.Where(n => n.CustomerID == user.UserID).ToList();
                List<CartViewModel> lstCartVM = CartViewModel.CreateList(lstCart);
                gvCarts.DataSource = lstCartVM;
                gvCarts.DataBind();
            }
        }

        protected void linkBtnLogOut_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            Response.Redirect("Home.aspx");
        }

        protected void linkBtnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?name=" + txtSearch.Text);
        }

        protected void gvCarts_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvrCartSelect = gvCarts.SelectedRow;
            int CartID = int.Parse(gvrCartSelect.Cells[1].Text);
            List<CartItem> lstCartItems = db.CartItems.Where(n => n.CartID == CartID).ToList();
            List<CartItemViewModel> lstCartItemVM = CartItemViewModel.CreateList(lstCartItems);
            gvCartItems.DataSource = lstCartItemVM;
            gvCartItems.DataBind();
        }
    }
}