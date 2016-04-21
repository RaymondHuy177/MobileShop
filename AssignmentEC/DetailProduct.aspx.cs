using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using AssignmentEC.Models;

namespace AssignmentEC
{
    public partial class DetailProduct : System.Web.UI.Page
    {

        assignment1Entities db = new assignment1Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MobilePhone mobile;
                try
                {
                    User user = (User)Session["User"];
                    if (user != null)
                    {
                        currentUser.InnerText = user.LastName;
                        currentUser.Attributes.Remove("href");
                        currentUser.Attributes.Add("href", "CustomerInformation.aspx");
                    }
                    int id = int.Parse(Request.QueryString["id"]);
                    mobile = db.MobilePhones.Where(n => n.MobileID == id).SingleOrDefault();
                    if (mobile == null)
                    {
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        String categoryName = db.Categories.Where(n => n.CategoryID == mobile.CategoryID).SingleOrDefault().CategoryName;
                        liProductName.InnerHtml = categoryName; 
                        getInfoMobile(mobile);
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }
        public void getListImage(MobilePhone mobile)
        {
            image1.Attributes.Add("src", "images/AllPhone/" + mobile.Picture + ".png\"");
            bigImage1.Attributes.Add("src", "images/AllPhone/" + mobile.Picture + ".png\"");
            bool isBlackUsed = false;
            bool isRedUsed = false;
            bool isBlueUsed = false;
            bool isGreenUsed = false;
            bool isOrangeUsed = false;
            bool isPicture2Found = false;
            if (mobile.PictureBlack != null)
            {
                isPicture2Found = true;
                isBlackUsed = true;
                image2.Attributes.Add("src", "images/AllPhone/" + mobile.PictureBlack + ".png\"");
                bigImage2.Attributes.Add("src", "images/AllPhone/" + mobile.PictureBlack + ".png\"");
            }
            else if (mobile.PictureBlue != null)
            {
                isPicture2Found = true;
                isBlueUsed = true;
                image2.Attributes.Add("src", "images/AllPhone/" + mobile.PictureBlue + ".png\"");
                bigImage2.Attributes.Add("src", "images/AllPhone/" + mobile.PictureBlue + ".png\"");
            }
            else if (mobile.PictureRed != null)
            {
                isPicture2Found = true;
                isRedUsed = true;
                image2.Attributes.Add("src", "images/AllPhone/" + mobile.PictureRed + ".png\"");
                bigImage2.Attributes.Add("src", "images/AllPhone/" + mobile.PictureRed + ".png\"");
            }
            else if (mobile.PictureOrange != null)
            {
                isPicture2Found = true;
                isOrangeUsed = true;
                image2.Attributes.Add("src", "images/AllPhone/" + mobile.PictureOrange + ".png\"");
                bigImage2.Attributes.Add("src", "images/AllPhone/" + mobile.PictureOrange + ".png\"");
            }
            else if (mobile.PictureGreen != null)
            {
                isPicture2Found = true;
                isGreenUsed = true;
                image2.Attributes.Add("src", "images/AllPhone/" + mobile.PictureGreen + ".png\"");
                bigImage2.Attributes.Add("src", "images/AllPhone/" + mobile.PictureGreen + ".png\"");
            }
            if (!isPicture2Found) return;

            if (mobile.PictureBlack != null && isBlackUsed == false)
            {
                image3.Attributes.Add("src", "images/AllPhone/" + mobile.PictureBlack + ".png\"");
                bigImage3.Attributes.Add("src", "images/AllPhone/" + mobile.PictureBlack + ".png\"");
            }
            else if (mobile.PictureBlue != null && isBlueUsed == false)
            {
                image3.Attributes.Add("src", "images/AllPhone/" + mobile.PictureBlue + ".png\"");
                bigImage3.Attributes.Add("src", "images/AllPhone/" + mobile.PictureBlue + ".png\"");
            }
            else if (mobile.PictureRed != null && isRedUsed == false)
            {
                image3.Attributes.Add("src", "images/AllPhone/" + mobile.PictureRed + ".png\"");
                bigImage3.Attributes.Add("src", "images/AllPhone/" + mobile.PictureRed + ".png\"");
            }
            else if (mobile.PictureOrange != null && isOrangeUsed == false)
            {
                image3.Attributes.Add("src", "images/AllPhone/" + mobile.PictureOrange + ".png\"");
                bigImage3.Attributes.Add("src", "images/AllPhone/" + mobile.PictureOrange + ".png\"");
            }
            else if (mobile.PictureGreen != null && isGreenUsed == false)
            {
                image3.Attributes.Add("src", "images/AllPhone/" + mobile.PictureGreen + ".png\"");
                bigImage3.Attributes.Add("src", "images/AllPhone/" + mobile.PictureGreen + ".png\"");
            }
            else
            {
                image3.Attributes.Add("hidden", "hidden");
                bigImage3.Attributes.Add("hidden", "hidden");
            }
        }
        public void getInfoMobile(MobilePhone mobile)
        {
            getListImage(mobile);
            nameTitle.Text = mobile.MobileName;
            pricePhone.InnerHtml = "<span>" + String.Format("{0:0,0 vnđ}", mobile.Price) + "</span>";
            namePhone.InnerHtml = mobile.MobileName;
            mobileOS.InnerHtml = "<span>Operating System:</span> &nbsp; " + mobile.MobileOS;
            mobileSize.InnerHtml = "<span>Display Size:</span>&nbsp;" + mobile.Size.ToString() + " Inches";
            nPhoneLeft.InnerHtml = "<span>Remains:</span>&nbsp;" + mobile.Quantity.ToString();
            string html = "";
            html += "<ul><li><span class=\"specification-heading\">Operating System</span> <span>" + mobile.MobileOS + "</span><div class=\"clear\"></div></li>";
            html += "<ul><li><span class=\"specification-heading\">Display Size</span> <span>" + mobile.Size + " Inches</span><div class=\"clear\"></div></li>";
            html += "<ul><li><span class=\"specification-heading\">Camera </span> <span>" + mobile.MainCamera + "</span><div class=\"clear\"></div></li>";
            html += "<ul><li><span class=\"specification-heading\">Front Camera</span> <span>" + mobile.Camera + "</span><div class=\"clear\"></div></li>";
            html += "<ul><li><span class=\"specification-heading\">CPU</span> <span>" + mobile.CPU + "</span><div class=\"clear\"></div></li>";
            html += "<ul><li><span class=\"specification-heading\">RAM</span> <span>" + mobile.RAM + " GB</span><div class=\"clear\"></div></li>";
            html += "<ul><li><span class=\"specification-heading\">Resolution</span> <span>" + mobile.Resolution + "</span><div class=\"clear\"></div></li>";
            html += "<ul><li><span class=\"specification-heading\">Number of Seller</span> <span>" + mobile.CustomerBought + "</span><div class=\"clear\"></div></li>";
            html += "<ul><li><span class=\"specification-heading\">Warranty Period</span> <span>" + mobile.TimeInsurance + " Months </span><div class=\"clear\"></div></li>";
            html += "<ul><li><span class=\"specification-heading\">Video</span>" + "<span><embed  width='115%' height='315' src='" + mobile.Video.Replace("watch?v=", "/v/") + "'></span><div class=\"clear\"></div></li>";
            html += "</ul>";

            productSpecification.InnerHtml = html;
            nPhoneBought.Attributes.Add("max", mobile.Quantity.ToString());
        }
        protected void linkBtnAddToCart_Click(object sender, EventArgs e)
        {
            int nProductBought = int.Parse(nPhoneBought.Value.ToString());
            int id = int.Parse(Request.QueryString["id"]);
            MobilePhone mobile = db.MobilePhones.Where(n => n.MobileID == id).SingleOrDefault();
            List<ShoppingCart> lstCart;
            if (Session["ShoppingCart"] != null)
            {
                lstCart = (List<ShoppingCart>)Session["ShoppingCart"];
            }
            else lstCart = new List<ShoppingCart>();
            for (int i = 1; i <= nProductBought; i++)
            {
                ShoppingCart sp = new ShoppingCart();
                sp.ProductID = mobile.MobileID;
                sp.ProductName = mobile.MobileName;
                sp.Price = mobile.Price;
                sp.timeInsurance = mobile.TimeInsurance + " months";
                lstCart.Add(sp);
            }
            Session["ShoppingCart"] = lstCart;
            Response.Redirect("Product.aspx");
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