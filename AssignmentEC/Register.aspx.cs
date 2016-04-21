using AssignmentEC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentEC
{
    public partial class Register : System.Web.UI.Page
    {
        assignment1Entities db = new assignment1Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkBtnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?name=" + txtSearch.Text);
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string password = MD5.encrypt(txtPasswordLogin.Value);
            User user = db.Users.Where(n => n.Email == txtEmailLogin.Value && n.Password == password).SingleOrDefault();
            if (user != null)
            {
                Session["User"] = user;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblMessageSignIn.InnerText = "Wrong email or password";
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            User userSignUp = db.Users.Where(n => n.Email == txtEmailSignUp.Value).SingleOrDefault();
            if(userSignUp != null)
            {
                lblMessageSignUp.InnerText = "Email has already existed";
                return;
            }
            User user = new User();
            user.Email = txtEmailSignUp.Value;
            user.Phone = txtMobileSignUp.Value;
            user.FirstName = txtFirstNameSignUp.Value;
            user.LastName = txtLastNameSignUp.Value;
            user.Password = MD5.encrypt(txtPasswordSignUp.Value);
            user.Address = txtAddressSignUp.Value;
            db.Users.Add(user);
            db.SaveChanges();
            Session["User"] = user;
            Response.Redirect("Home.aspx");
        }
    }
}