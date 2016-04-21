using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using AssignmentEC.Models;

namespace AssignmentEC
{
    public partial class CustomerInformation : System.Web.UI.Page
    {
        assignment1Entities db = new assignment1Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                if (txtConfirmOldPassword.Value == "")
                {
                    setValueMyAccount(user);
                }
                currentUser.InnerText = user.LastName;
                currentUser.Attributes.Remove("href");
                currentUser.Attributes.Add("href", "CustomerInformation.aspx");
            }
            else Response.Redirect("Home.aspx");
        }
        public void setValueMyAccount(User user)
        {
            currentUser.InnerHtml = user.LastName;
            txtFirstNameUpdate.Value = user.FirstName;
            txtLastNameUpdate.Value = user.LastName;
            txtMobileUpdate.Value = user.Phone;
            txtEmailUpdate.Value = user.Email;
            txtAddressUpdate.Value = user.Address;
            lblLastModified.InnerText = user.LastModified.ToString();
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

        protected void btnUpdateInformation_Click(object sender, EventArgs e)
        {
            User user = (User)Session["User"];
            string confirmOldPassword = MD5.encrypt(txtConfirmOldPassword.Value);
            if (user.Password == confirmOldPassword)
            {
                User userUpdate = db.Users.Where(n => n.UserID == user.UserID).SingleOrDefault();
                userUpdate.Email = txtEmailUpdate.Value;
                if (txtPasswordUpdate.Value.Length > 0)
                {
                    string newPassword = MD5.encrypt(txtPasswordUpdate.Value);
                    userUpdate.Password = newPassword;
                }
                userUpdate.Phone = txtMobileUpdate.Value;
                userUpdate.FirstName = txtFirstNameUpdate.Value;
                userUpdate.Address = txtAddressUpdate.Value;
                userUpdate.LastName = txtLastNameUpdate.Value;
                userUpdate.LastModified = DateTime.Now;
                db.SaveChanges();
                Session["User"] = userUpdate;
                lblMessageUpdate.InnerText = "Successfully";
                //Response.Redirect("Home.aspx");
            }
            else
            {
                lblMessageUpdate.InnerText = "Incorrect Confirm Password";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

    }
}