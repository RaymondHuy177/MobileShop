using AssignmentEC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentEC
{
    public partial class Home : System.Web.UI.Page
    {

        assignment1Entities db = new assignment1Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["User"];
            if (user != null)
            {
                currentUser.InnerText = user.LastName;
                currentUser.Attributes.Remove("href");
                currentUser.Attributes.Add("href", "CustomerInformation.aspx");
            }
            getListMobileBestFavorite();
            getListMobileBestSeller();
            getListMobileNewProducts();

        }
        public void getListMobileBestSeller()
        {
            var data = (from mobile in db.MobilePhones
                        orderby mobile.CustomerBought descending
                        select mobile).Take(4);
            List<MobilePhone> mobileList = data.ToList();
            string html = "";
            string a = "";
            foreach (MobilePhone mobile in mobileList)
            {
                html += "<div class=\"view view-second\">";
                //html += "<img src=\"images/Phones/" + mobile.Picture + "\" />";
                html += "<img src=\"../images/AllPhone/" + mobile.Picture + ".png\" width=\"150\" height=\"300\" /> ";
                html += "<div class=\"mask\"></div>";
                html += "<div class=\"content\">";
                html += "<h2>" + mobile.MobileName + "</h2>";
                html += "<h2>" + String.Format("{0:0,0 vnđ}", mobile.Price) + "</h2>";
                html += "<p>";
                try
                {
                    html += mobile.MainCamera.Substring(0, 5) + "<br />";
                }
                catch (Exception)
                {
                    html += mobile.MainCamera + "<br />";
                }
                html += mobile.Size + " inches <br />";
                html += mobile.Resolution + "<br /></p>";
                //html += mobile.CPU + "<br /></p>";
                html += "  <a href=\"../DetailProduct.aspx?id=" + mobile.MobileID + "#\" class=\"info\">Details</a></div></div>";
            }
            bestSeller.InnerHtml = html;
        }
        public void getListMobileBestFavorite()
        {
            var data = (from mobile in db.MobilePhones
                        orderby mobile.CustomerLike descending
                        select mobile).Take(4);
            List<MobilePhone> mobileList = data.ToList();
            string html = "";
            foreach (MobilePhone mobile in mobileList)
            {
                html += "<div class=\"view view-second\">";
                //html += "<img src=\"images/Phones/" + mobile.Picture + "\" />";
                html += "<img src=\"../images/AllPhone/" + mobile.Picture + ".png\" width=\"150\" height=\"300\" /> ";
                html += "<div class=\"mask\"></div>";
                html += "<div class=\"content\">";
                html += "<h2>" + mobile.MobileName + "</h2>";
                html += "<h2>" + String.Format("{0:0,0 vnđ}", mobile.Price) + "</h2>";
                html += "<p>";
                try
                {
                    html += mobile.MainCamera.Substring(0, 5) + "<br />";
                }
                catch (Exception)
                {
                    html += mobile.MainCamera + "<br />";
                }
                html += mobile.Size + " inches <br />";
                html += mobile.Resolution + "<br /></p>";
                //html += mobile.CPU + "<br /></p>";
                html += "  <a href=\"../DetailProduct.aspx?id=" + mobile.MobileID + "#\" class=\"info\">Details</a></div></div>";
            }
            bestFavorite.InnerHtml = html;
        }
        public void getListMobileNewProducts()
        {
            var data = (from mobile in db.MobilePhones
                        where mobile.NewMobile == true
                        select mobile).Take(4);
            List<MobilePhone> mobileList = data.ToList();
            string html = "";
            foreach (MobilePhone mobile in mobileList)
            {
                html += "<div class=\"view view-second\">";
                //html += "<img src=\"images/Phones/" + mobile.Picture + "\" />";
                html += "<img src=\"../images/AllPhone/" + mobile.Picture + ".png\" width=\"150\" height=\"300\" /> ";
                html += "<div class=\"mask\"></div>";
                html += "<div class=\"content\">";
                html += "<h2>" + mobile.MobileName + "</h2>";
                html += "<h2>" + String.Format("{0:0,0 vnđ}", mobile.Price) + "</h2>";
                html += "<p>";
                try
                {
                    html += mobile.MainCamera.Substring(0, 5) + "<br />";
                }
                catch (Exception)
                {
                    html += mobile.MainCamera + "<br />";
                }
                html += mobile.Size + " inches <br />";
                html += mobile.Resolution + "<br /></p>";
                //html += mobile.CPU + "<br /></p>";
                html += "  <a href=\"../DetailProduct.aspx?id=" + mobile.MobileID + "#\" class=\"info\">Details</a></div></div>";
            }
            newProducts.InnerHtml = html;
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