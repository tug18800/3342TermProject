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
                                 
                    Session["user"] = user;
                    Response.Redirect("SignUp.aspx");
                }
                else
                {
                    
                }
                

            }
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            if (IsValid)
            {
                User user = TermDB.GetUser(username, password);

            }
        }
    }
}

