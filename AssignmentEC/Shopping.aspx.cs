using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssignmentEC.Models;
using System.Xml;
using System.Configuration;
namespace AssignmentEC
{
    public partial class Shopping : System.Web.UI.Page
    {

        assignment1Entities db = new assignment1Entities();
  
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ShoppingCart"] == null)
                    Response.Redirect("Home.aspx");
                User user = (User)Session["User"];
                if (user != null)
                {
                    currentUser.InnerText = user.LastName;
                    currentUser.Attributes.Remove("href");
                    currentUser.Attributes.Add("href", "CustomerInformation.aspx");
                }
                List<ShoppingCart> lst = (List<ShoppingCart>)Session["ShoppingCart"];
                int? total = 0;
                foreach (ShoppingCart mobile in lst)
                {
                    total += mobile.Price;
                }
                lblTotal.InnerHtml = String.Format("{0:0,0 vnđ}", total);
                gvProducts.DataSource = lst;
                gvProducts.DataBind();
            }
        }
        private const string ONLINE = "Online";
        private const string CASH = "Cash";
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            User user = (User)Session["User"];
            if (user == null)
                Response.Redirect("Register.aspx");
            List<ShoppingCart> lst = (List<ShoppingCart>)Session["ShoppingCart"];
            
            if(ddlTypePayment.Value == ONLINE)
            {
                int indexRow = 0;
                int? totalPrice = 0;
                CartOnline cartOnl = new CartOnline();
                cartOnl.lstSP = new List<ShoppingCart>();
                foreach (GridViewRow r in gvProducts.Rows)
                {
                    DropDownList ddl = r.FindControl("ddlColor") as DropDownList;
                    ShoppingCart sp = new ShoppingCart();
                    sp.ProductID = lst[indexRow].ProductID;
                    sp.color = ddl.SelectedItem.Text;
                    sp.Price = lst[indexRow].Price;
                    sp.ProductName = lst[indexRow].ProductName;
                    sp.timeInsurance = lst[indexRow].timeInsurance;
                    cartOnl.lstSP.Add(sp);
                    totalPrice += lst[indexRow].Price;
                    indexRow++;
                }
                cartOnl.DateTransfer = DateTime.Now;
                Session["CartOnl"] = cartOnl;
                string redirectUrl = "";
                totalPrice = totalPrice / 20000;
                //Mention URL to redirect content to paypal site
                redirectUrl += "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=" + ConfigurationManager.AppSettings["paypalemail"].ToString();

                //First name I assign static based on login details assign this value
                redirectUrl += "&first_name="+ user.FirstName;
                redirectUrl += "&last_name=" + user.LastName;

                //Product Name
                redirectUrl += "&item_name=" + "Mobile";


                //Business contact paypal EmailID
                redirectUrl += "&business=raymondhuy177-facilitator@gmail.com";
                redirectUrl += "&amount=" + totalPrice.ToString();

                //Quantiy of product, Here statically added quantity 1
                redirectUrl += "&quantity=1";


                //If transactioin has been successfully performed, redirect SuccessURL page- this page will be designed by developer
                redirectUrl += "&return=" + "http://localhost:3475/ThankYou";

                //If transactioin has been failed, redirect FailedURL page- this page will be designed by developer
                redirectUrl += "&cancel_return=" + "http://localhost:3475/Home";

                Response.Redirect(redirectUrl);
            }

            Cart cart = new Cart();
            cart.CreatedDate = DateTime.UtcNow;
            cart.CustomerID = user.UserID;
            cart.Quantity = lst.Count;
            cart.DateTranfer = DateTime.Parse(txtGiaoHang.Value);
            cart.TypePayment = ddlTypePayment.Value;
            cart.Status = "Processing";

            db.Carts.Add(cart);
            db.SaveChanges();

            string s = Server.MapPath("xml");
            string fileName = user.LastName + user.FirstName + "_" + cart.CartID;
            string path_file = string.Format("{0}/{1}.xml", s, fileName);
            XmlTextWriter xtw = new XmlTextWriter(path_file, System.Text.Encoding.UTF8);
            xtw.Formatting = Formatting.Indented;
            xtw.WriteStartDocument();
            xtw.WriteStartElement("Cart");
            xtw.WriteStartElement("CustomerInformation");
            xtw.WriteStartElement("CustomerName");
            xtw.WriteString(user.LastName + " " + user.FirstName);
            xtw.WriteEndElement();
            xtw.WriteStartElement("CustomerEmail");
            xtw.WriteString(user.Email);
            xtw.WriteEndElement();
            xtw.WriteStartElement("CustomerPhone");
            xtw.WriteString(user.Phone);
            xtw.WriteEndElement();
            xtw.WriteStartElement("CustomerAddress");
            xtw.WriteString(user.Address);
            xtw.WriteEndElement();
            xtw.WriteStartElement("DateTransfer");
            xtw.WriteString(txtGiaoHang.Value);
            xtw.WriteEndElement();
            xtw.WriteStartElement("DateCreated");
            xtw.WriteString(DateTime.Now.ToString());
            xtw.WriteEndElement();
            
            xtw.WriteEndElement();
            int index = 0;
            int? total = 0;
            foreach (GridViewRow r in gvProducts.Rows)
            {
                DropDownList ddl = r.FindControl("ddlColor") as DropDownList;
                string color = ddl.SelectedItem.Text;
                createNode(lst[index].ProductID.ToString(), lst[index].ProductName, lst[index].Price.ToString(), color, lst[index].timeInsurance.ToString(), xtw);
                total += lst[index].Price;
                CartItem cartItem = new CartItem();
                cartItem.MobileID = lst[index].ProductID;
                cartItem.CartID = cart.CartID;
                cartItem.Color = color;
                db.CartItems.Add(cartItem);
                int id = int.Parse(lst[index].ProductID.ToString());
                MobilePhone mobile = db.MobilePhones.Where(n => n.MobileID == id).SingleOrDefault();
                mobile.Quantity--;
                db.SaveChanges();
                index++;
            }
            cart.TotalPrice = total;
            db.SaveChanges();
            xtw.WriteEndElement();
            xtw.WriteEndDocument();
            xtw.Flush();
            xtw.Close();
            Session["ShoppingCart"] = null;
            Response.Redirect("Home.aspx");
            
//CODE XML
        }
        private void createNode(string pID, string pName, string pPrice, string pColor, string time, XmlTextWriter writer)
        {
            writer.WriteStartElement("CartItem");
            writer.WriteStartElement("product_id");
            writer.WriteString(pID);
            writer.WriteEndElement();
            writer.WriteStartElement("product_name");
            writer.WriteString(pName);
            writer.WriteEndElement();
            writer.WriteStartElement("product_price");
            writer.WriteString(pPrice);
            writer.WriteEndElement();
            writer.WriteStartElement("Color");
            writer.WriteString(pColor);
            writer.WriteEndElement();
            writer.WriteStartElement("TimeInsurance");
            writer.WriteString(time.Substring(0, 2) + "tháng");
            writer.WriteEndElement();
            writer.WriteEndElement();

        }
        
        
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session["ShoppingCart"] = null;
            Response.Redirect("Home.aspx");
        }

        protected void linkBtnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?name=" + txtSearch.Text);
        }

        protected void linkBtnLogOut_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            Response.Redirect("Home.aspx");
        }
    }
}