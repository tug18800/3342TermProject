using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TermProjectClasses;

namespace CIS3342TermProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack && Request.Cookies["user"] != null)
            {
                HttpCookie ckieUser = Request.Cookies["user"];
                txtUsername.Text = ckieUser.Values["Username"].ToString();
                chkRemeber.Checked = true;
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string username = txtNewUsername.Text;
                string error;

                if (TermDB.IsUniqueUsername(username, out error))
                {
                    User user = new User();
                    user.Username = username;
                    user.Password = txtNewPassword.Text;
                    user.Name = txtName.Text;
                    user.Email = txtEmail.Text;

                    Session["user"] = user;
                    Response.Redirect("SignUp/SignUp.aspx");
                }
                else
                {
                    lblSignUpStatus.Text = error;
                    lblSignUpStatus.Visible = true;

                }
            }
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string error;

            bool remember = chkRemeber.Checked;
            if (IsValid)
            {
                User user = TermDB.GetUser(username, password, out error); 
                if (user != null & error == "")
                {
                    Session["user"] = user;
                    if (remember)
                    {
                        HttpCookie ckieUser = new HttpCookie("user");
                        ckieUser.Values["Username"] = user.Username;
                        ckieUser.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(ckieUser);
                    }
                    else
                    {
                        if (Request.Cookies["user"] != null)
                        {
                            HttpCookie remove = Request.Cookies["user"];
                            remove.Expires = DateTime.Now.AddDays(-10);
                            remove.Value = null;
                            Response.SetCookie(remove);
                        }
                    }
                    
                    Response.Redirect("Products/Products.aspx");
                }
                else
                {
                    lblLogInStatus.Text = error;
                    lblLogInStatus.Visible = true;
                }
            }
        }

        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {
            if (lblLogInStatus.Visible)
            {
                lblLogInStatus.Visible = !lblLogInStatus.Visible;
            }
        }

        protected void txtNewUsername_TextChanged(object sender, EventArgs e)
        {
            if (lblSignUpStatus.Visible)
            {
                lblSignUpStatus.Visible = !lblSignUpStatus.Visible;
            }
        }
    }
}

