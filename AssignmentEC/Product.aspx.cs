using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssignmentEC.Models;

namespace AssignmentEC
{
    public partial class Product : System.Web.UI.Page
    {
        assignment1Entities db = new assignment1Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                User user = (User)Session["User"];
                if (user != null)
                {
                    currentUser.InnerText = user.LastName;
                    currentUser.Attributes.Remove("href");
                    currentUser.Attributes.Add("href", "CustomerInformation.aspx");
                }
                allCategory.Attributes.Add("class", "active");
                List<MobilePhone> mobileList;
                try 
                {
                    string name = Request.QueryString["name"].ToString();
                    mobileList = db.MobilePhones.Where(n => n.MobileName.Contains(name)).ToList();
                }
                catch(Exception)
                {
                    mobileList = db.MobilePhones.ToList();
                }
                mobileList.Sort(new MobileComparePrice());
                getListMobile(mobileList);
            }
        }
        public void getListMobile(List<MobilePhone> mobileList)
        {
            string html = "";
            foreach (MobilePhone mobile in mobileList)
            {
                html += "<div class=\"col-xs-3 col-sm-3 col-md-3\"><div class=\"item\"><div class=\"view view-second\">";
                //html += "<img src=\"images/Phones/" + mobile.Picture + "\" />";
                html += "<img src=\"images/AllPhone/" + mobile.Picture + ".png\" width=\"150\" height=\"300\" /> ";
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
                html += "  <a href=\"DetailProduct.aspx?id=" + mobile.MobileID + "#\" class=\"info\">Details</a></div></div></div></div>";
            }
            contentPhone.InnerHtml = html;
        }
        #region PRICE
        protected void linkBtnPriceBelow2Million_Click(object sender, EventArgs e)
        {
            captionPrice.InnerHtml = "Price : < 2 millions<span class=\"caret\"></span>";
            resetDropdownMenu("PRICE");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList;
            if(categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n=>n.Price <= 2000000).ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n=>n.Price <= 2000000 && n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void LinkBtnPriceBelow4Million_Click(object sender, EventArgs e)
        {
            captionPrice.InnerHtml = "Price : < 4 millions<span class=\"caret\"></span>";
            resetDropdownMenu("PRICE");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList;
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n => n.Price <= 4000000).ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.Price <= 4000000 && n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void LinkBtnPriceBelow6Million_Click(object sender, EventArgs e)
        {
            captionPrice.InnerHtml = "Price : < 6 millions<span class=\"caret\"></span>";
            resetDropdownMenu("PRICE");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList;
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n => n.Price <= 6000000).ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.Price <= 6000000 && n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }
        protected void LinkBtnPriceAll_Click(object sender, EventArgs e)
        {
            captionPrice.InnerHtml = "Price : All<span class=\"caret\"></span>";
            resetDropdownMenu("PRICE");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList;
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }
        #endregion
        #region INCHES
        protected void linkBtn3Inches_Click(object sender, EventArgs e)
        {
            captionScreen.InnerHtml = "Size : 3 inches<span class=\"caret\"></span>";
            resetDropdownMenu("SCREEN");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList;
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n => n.Size == 3).ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.CategoryID == categoryID && n.Size == 3).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void linkBtn4Inches_Click(object sender, EventArgs e)
        {
            captionScreen.InnerHtml = "Size : 4 inches<span class=\"caret\"></span>";
            resetDropdownMenu("SCREEN");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList;
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n => n.Size == 4).ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.CategoryID == categoryID && n.Size == 4).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void linkBtn5Inches_Click(object sender, EventArgs e)
        {
            captionScreen.InnerHtml = "Size : 5 inches<span class=\"caret\"></span>";
            resetDropdownMenu("SCREEN");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList;
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n => n.Size == 5).ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.CategoryID == categoryID && n.Size == 5).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void linkBtn6Inches_Click(object sender, EventArgs e)
        {
            captionScreen.InnerHtml = "Size : 6 inches<span class=\"caret\"></span>";
            resetDropdownMenu("SCREEN");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList;
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n => n.Size == 6).ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.CategoryID == categoryID && n.Size == 6).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void linkBtnAllInches_Click(object sender, EventArgs e)
        {
            captionScreen.InnerHtml = "Size : All<span class=\"caret\"></span>";
            resetDropdownMenu("SCREEN");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList;
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }
        #endregion
        #region MP
        protected void linkBtnBelow5MP_Click(object sender, EventArgs e)
        {
            captionCamera.InnerHtml = "Camera : < 5 MP<span class=\"caret\"></span>";
            resetDropdownMenu("CAMERA");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                foreach (MobilePhone mobile in db.MobilePhones)
                {
                    if (int.Parse(mobile.MainCamera.Substring(0, 2)) <= 5)
                    {
                        mobileList.Add(mobile);
                    }
                }
            }
            else
            {
                foreach (MobilePhone mobile in db.MobilePhones)
                {
                    if (int.Parse(mobile.MainCamera.Substring(0, 2)) <= 5 && mobile.CategoryID == categoryID)
                    {
                        mobileList.Add(mobile);
                    }
                }
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void linkBtnBelow7MP_Click(object sender, EventArgs e)
        {
            captionCamera.InnerHtml = "Camera : < 7 MP<span class=\"caret\"></span>";
            resetDropdownMenu("CAMERA");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                foreach (MobilePhone mobile in db.MobilePhones)
                {
                    if (int.Parse(mobile.MainCamera.Substring(0, 2)) <= 7)
                    {
                        mobileList.Add(mobile);
                    }
                }
            }
            else
            {
                foreach (MobilePhone mobile in db.MobilePhones)
                {
                    if (int.Parse(mobile.MainCamera.Substring(0, 2)) <= 7 && mobile.CategoryID == categoryID)
                    {
                        mobileList.Add(mobile);
                    }
                }
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void linkBtnBelow13MP_Click(object sender, EventArgs e)
        {
            captionCamera.InnerHtml = "Camera : < 13 MP<span class=\"caret\"></span>";
            resetDropdownMenu("CAMERA");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                foreach (MobilePhone mobile in db.MobilePhones)
                {
                    if (int.Parse(mobile.MainCamera.Substring(0, 2)) <= 13)
                    {
                        mobileList.Add(mobile);
                    }
                }
            }
            else
            {
                foreach (MobilePhone mobile in db.MobilePhones)
                {
                    if (int.Parse(mobile.MainCamera.Substring(0, 2)) <= 13 && mobile.CategoryID == categoryID)
                    {
                        mobileList.Add(mobile);
                    }
                }
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void linkBtnAllMP_Click(object sender, EventArgs e)
        {
            captionCamera.InnerHtml = "Camera : All<span class=\"caret\"></span>";
            resetDropdownMenu("CAMERA");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                foreach (MobilePhone mobile in db.MobilePhones)
                {
                    mobileList.Add(mobile);
                }
            }
            else
            {
                foreach (MobilePhone mobile in db.MobilePhones)
                {
                    if (mobile.CategoryID == categoryID)
                    {
                        mobileList.Add(mobile);
                    }
                }
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }
        #endregion MP
        public void resetDropdownMenu(string menuExcept = "")
        {
            if(menuExcept == "PRICE")
            {
                captionCamera.InnerHtml = "Camera : All<span class=\"caret\"></span>";
                captionOS.InnerHtml = "OS : All<span class=\"caret\"></span>";
                captionRAM.InnerHtml = "RAM : All<span class=\"caret\"></span>";
                captionScreen.InnerHtml = "Size : All<span class=\"caret\"></span>";
            }
            else if(menuExcept == "OS")
            {
                captionCamera.InnerHtml = "Camera : All<span class=\"caret\"></span>";
                captionPrice.InnerHtml = "Price : All<span class=\"caret\"></span>";
                captionRAM.InnerHtml = "RAM : All<span class=\"caret\"></span>";
                captionScreen.InnerHtml = "Size : All<span class=\"caret\"></span>";
            }
            else if(menuExcept == "SCREEN")
            {
                captionCamera.InnerHtml = "Camera : All<span class=\"caret\"></span>";
                captionOS.InnerHtml = "OS : All<span class=\"caret\"></span>";
                captionPrice.InnerHtml = "Price : All<span class=\"caret\"></span>";
                captionRAM.InnerHtml = "RAM : All<span class=\"caret\"></span>";
            }
            else if(menuExcept == "RAM")
            {
                captionCamera.InnerHtml = "Camera : All<span class=\"caret\"></span>";
                captionOS.InnerHtml = "OS : All<span class=\"caret\"></span>";
                captionPrice.InnerHtml = "Price : All<span class=\"caret\"></span>";
                captionScreen.InnerHtml = "Size : All<span class=\"caret\"></span>";
            }
            else if(menuExcept == "CAMERA")
            {
                captionOS.InnerHtml = "OS : All<span class=\"caret\"></span>";
                captionPrice.InnerHtml = "Price : All<span class=\"caret\"></span>";
                captionRAM.InnerHtml = "RAM : All<span class=\"caret\"></span>";
                captionScreen.InnerHtml = "Size : All<span class=\"caret\"></span>";
            }
            else
            {
                captionCamera.InnerHtml = "Camera : All<span class=\"caret\"></span>";
                captionOS.InnerHtml = "OS : All<span class=\"caret\"></span>";
                captionPrice.InnerHtml = "Price : All<span class=\"caret\"></span>";
                captionRAM.InnerHtml = "RAM : All<span class=\"caret\"></span>";
                captionScreen.InnerHtml = "Size : All<span class=\"caret\"></span>";
            }
        }
        public void changeSelectedCategory(int categoryID)
        {
            allCategory.Attributes.Add("class", "");
            Apple.Attributes.Add("class", "");
            Asus.Attributes.Add("class", "");
            HTC.Attributes.Add("class", "");
            LG.Attributes.Add("class", "");
            Lenovo.Attributes.Add("class", "");
            OPPO.Attributes.Add("class", "");
            QMobile.Attributes.Add("class", "");
            Sony.Attributes.Add("class", "");
            SamSung.Attributes.Remove("class");
            BlackBerry.Attributes.Remove("class");
            BlackBerry.Attributes.Remove("class");
            int a = BlackBerry.Attributes.Keys.Count;
            switch (categoryID)
            {
                case 0:
                    allCategory.Attributes.Add("class", "active");
                    break;
                case 1:

                    break;
                case 2:
                    SamSung.Attributes.Add("class", "active");
                    break;
                case 3:
                    Sony.Attributes.Add("class", "active");
                    break;
                case 4:
                    break;
                case 5:
                    BlackBerry.Attributes.Add("class", "active");
                    break;
                case 6:
                    Lenovo.Attributes.Add("class", "active");
                    break;
                case 7:
                    OPPO.Attributes.Add("class", "active");
                    break;
                case 8:
                    break;
                case 9:
                    Apple.Attributes.Add("class", "active");
                    break;
                case 10:
                    break;
                case 11:
                    break;
                case 12:
                    break;
            }
        }

        public void clearSelectedCategory()
        {           
            allCategory.Attributes.Remove("class");
            Apple.Attributes.Remove("class");
            Asus.Attributes.Remove("class");
            HTC.Attributes.Remove("class");
            LG.Attributes.Remove("class");
            Lenovo.Attributes.Remove("class");
            OPPO.Attributes.Remove("class");
            QMobile.Attributes.Remove("class");
            Sony.Attributes.Remove("class");
            SamSung.Attributes.Remove("class");
            BlackBerry.Attributes.Remove("class");
        }

        public int getSelectedCategory()
        {
            if (Apple.Attributes.Count == 1)
                return CategoryModel.APPLE;
            else if (Asus.Attributes.Count == 1)
                return CategoryModel.ASUS;
            else if (HTC.Attributes.Count == 1)
                return CategoryModel.HTC;
            else if (LG.Attributes.Count == 1)
                return CategoryModel.LG;
            else if (OPPO.Attributes.Count == 1)
                return CategoryModel.OPPO;
            else if (QMobile.Attributes.Count == 1)
                return CategoryModel.QMOBILE;
            else if (Sony.Attributes.Count == 1)
                return CategoryModel.SONY;
            else if (SamSung.Attributes.Count == 1)
                return CategoryModel.SAMSUNG;
            else if (BlackBerry.Attributes.Count == 1)
                return CategoryModel.BLACKBERRY;
            else if (Lenovo.Attributes.Count == 1)
                return CategoryModel.LENOVO;
            return CategoryModel.ALL;
        }
        #region CATEGORY
        protected void linkBtnApple_Click(object sender, EventArgs e)
        {
            clearSelectedCategory();
            resetDropdownMenu();
            Apple.Attributes.Add("class", "active");
            titleProductPage.Text = "Apple";
            List<MobilePhone> mobileList = db.MobilePhones.Where(n => n.CategoryID == CategoryModel.APPLE).ToList();
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void linkBtnAllCategory_Click(object sender, EventArgs e)
        {
            clearSelectedCategory();
            resetDropdownMenu();
            allCategory.Attributes.Add("class", "active");
            titleProductPage.Text = "All Category";
            List<MobilePhone> mobileList = db.MobilePhones.ToList();
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }
        
        protected void linkBtnAsus_Click(object sender, EventArgs e)
        {
            clearSelectedCategory();
            resetDropdownMenu();
            Asus.Attributes.Add("class", "active");
            titleProductPage.Text = "Asus";
            List<MobilePhone> mobileList = db.MobilePhones.Where(n => n.CategoryID == CategoryModel.ASUS).ToList();
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void linkBtnHTC_Click(object sender, EventArgs e)
        {
            clearSelectedCategory();
            resetDropdownMenu();
            HTC.Attributes.Add("class", "active");
            titleProductPage.Text = "HTC";
            List<MobilePhone> mobileList = db.MobilePhones.Where(n => n.CategoryID == CategoryModel.HTC).ToList();
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void LinkBtnLG_Click(object sender, EventArgs e)
        {
            clearSelectedCategory();
            resetDropdownMenu();
            LG.Attributes.Add("class", "active");
            titleProductPage.Text = "LG";
            List<MobilePhone> mobileList = db.MobilePhones.Where(n => n.CategoryID == CategoryModel.LG).ToList();
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }
        
        protected void LinkBtnLenovo_Click(object sender, EventArgs e)
        {
            clearSelectedCategory();
            resetDropdownMenu();
            Lenovo.Attributes.Add("class", "active");
            titleProductPage.Text = "Lenovo";
            List<MobilePhone> mobileList = db.MobilePhones.Where(n => n.CategoryID == CategoryModel.LENOVO).ToList();
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void LinkBtnOPPO_Click(object sender, EventArgs e)
        {
            clearSelectedCategory();
            resetDropdownMenu();
            OPPO.Attributes.Add("class", "active");
            titleProductPage.Text = "OPPO";
            List<MobilePhone> mobileList = db.MobilePhones.Where(n => n.CategoryID == CategoryModel.OPPO).ToList();
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void LinkBtnQMobile_Click(object sender, EventArgs e)
        {
            clearSelectedCategory();
            resetDropdownMenu();
            QMobile.Attributes.Add("class", "active");
            titleProductPage.Text = "Nokia";
            List<MobilePhone> mobileList = db.MobilePhones.Where(n => n.CategoryID == CategoryModel.NOKIA).ToList();
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void LinkBtnSony_Click(object sender, EventArgs e)
        {
            clearSelectedCategory();
            resetDropdownMenu();
            Sony.Attributes.Add("class", "active");
            titleProductPage.Text = "Sony";
            List<MobilePhone> mobileList = db.MobilePhones.Where(n => n.CategoryID == CategoryModel.SONY).ToList();
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void LinkBtnSamsung_Click(object sender, EventArgs e)
        {
            clearSelectedCategory();
            resetDropdownMenu();
            SamSung.Attributes.Add("class", "active");
            titleProductPage.Text = "Samsung";
            List<MobilePhone> mobileList = db.MobilePhones.Where(n => n.CategoryID == CategoryModel.SAMSUNG).ToList();
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void LinkBtnBlackBerry_Click(object sender, EventArgs e)
        {
            clearSelectedCategory();
            resetDropdownMenu();
            BlackBerry.Attributes.Add("class", "active");
            titleProductPage.Text = "Black Berry";
            List<MobilePhone> mobileList = db.MobilePhones.Where(n => n.CategoryID == CategoryModel.BLACKBERRY).ToList();
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }
        #endregion
        #region OS
        protected void linkBtnAndroid_Click(object sender, EventArgs e)
        {
            captionOS.InnerHtml = "Android<span class=\"caret\"></span>";
            resetDropdownMenu("OS");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n => n.MobileOS == "Android").ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.MobileOS == "Android" && n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void linkBtnIOS_Click(object sender, EventArgs e)
        {
            captionOS.InnerHtml = "iOS(iPhone)<span class=\"caret\"></span>";
            resetDropdownMenu("OS");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n => n.MobileOS.Substring(0,3) == "iOS").ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.MobileOS.Substring(0,3) == "iOS" && n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void linkBtnWindowPhone_Click(object sender, EventArgs e)
        {
            captionOS.InnerHtml = "Windows Phone<span class=\"caret\"></span>";
            resetDropdownMenu("OS");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n => n.MobileOS == "Windowphone").ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.MobileOS == "Windowphone" && n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void linkBtnAllOS_Click(object sender, EventArgs e)
        {
            captionOS.InnerHtml = "OS: All <span class=\"caret\"></span>";
            resetDropdownMenu("OS");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n=>n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }
        #endregion
        #region RAM
        protected void linkBtn1GB_Click(object sender, EventArgs e)
        {
            captionRAM.InnerHtml = "Ram: 1 GB<span class=\"caret\"></span>";
            resetDropdownMenu("RAM");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n =>n.RAM == 1).ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.RAM == 1 && n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void LinkBtn2GB_Click(object sender, EventArgs e)
        {
            captionRAM.InnerHtml = "Ram: 2 GB<span class=\"caret\"></span>";
            resetDropdownMenu("RAM");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n => n.RAM == 2).ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.RAM == 2 && n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void LinkBtn3GB_Click(object sender, EventArgs e)
        {
            captionRAM.InnerHtml = "Ram: 3 GB<span class=\"caret\"></span>";
            resetDropdownMenu("RAM");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n => n.RAM == 3).ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.RAM == 3 && n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void LinkBtn4GB_Click(object sender, EventArgs e)
        {
            captionRAM.InnerHtml = "Ram: 4 GB<span class=\"caret\"></span>";
            resetDropdownMenu("RAM");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.Where(n => n.RAM == 4).ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.RAM == 4 && n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }

        protected void LinkBtnAllGB_Click(object sender, EventArgs e)
        {
            captionRAM.InnerHtml = "Ram: All <span class=\"caret\"></span>";
            resetDropdownMenu("RAM");
            int categoryID = getSelectedCategory();
            List<MobilePhone> mobileList = new List<MobilePhone>();
            if (categoryID == CategoryModel.ALL)
            {
                mobileList = db.MobilePhones.ToList();
            }
            else
            {
                mobileList = db.MobilePhones.Where(n => n.CategoryID == categoryID).ToList();
            }
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }
        #endregion


        protected void linkBtnSearch_Click1(object sender, EventArgs e)
        {
            List<MobilePhone> mobileList = db.MobilePhones.Where(n => n.MobileName.Contains(txtSearch.Text)).ToList();
            mobileList.Sort(new MobileComparePrice());
            getListMobile(mobileList);
        }
    }
}