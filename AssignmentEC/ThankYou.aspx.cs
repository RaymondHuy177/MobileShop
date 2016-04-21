using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using AssignmentEC.Models;
using System.Xml;

namespace AssignmentEC
{
    public partial class ThankYou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            assignment1Entities db = new assignment1Entities();
            User user = (User)Session["User"];
            if (user == null)
                Response.Redirect("Register.aspx");
            CartOnline cartOnl = (CartOnline)Session["CartOnl"];
            if (cartOnl == null)
                Response.Redirect("Home.aspx");
            Cart cart = new Cart();
            cart.CreatedDate = DateTime.UtcNow;
            cart.CustomerID = user.UserID;
            cart.Quantity = cartOnl.lstSP.Count;
            cart.TypePayment = "Online";
            cart.Status = "Processing";
            cart.DateTranfer = cartOnl.DateTransfer;
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
            xtw.WriteString(cartOnl.DateTransfer.ToString());
            xtw.WriteEndElement();
            xtw.WriteStartElement("DateCreated");
            xtw.WriteString(DateTime.Now.ToString());
            xtw.WriteEndElement();
            xtw.WriteEndElement();
            int index = 0;
            int? total = 0;

            List<ShoppingCart> lst = cartOnl.lstSP;
            int count = lst.Count;
            for (int i = 0; i < count; i++)
            {
                string color = lst[i].color;
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
            Session["CartOnline"] = null;
            Response.Redirect("Home.aspx");
            
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
        
    }
}