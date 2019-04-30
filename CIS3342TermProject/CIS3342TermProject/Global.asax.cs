using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using TermProjectClasses;
namespace CIS3342TermProject
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            if(Session["order"] != null)
            {
                User user = (User)Session["user"];
                BinaryFormatter ser = new BinaryFormatter();
                MemoryStream stream = new MemoryStream();

                Order order = (Order)Session["order"];
                ser.Serialize(stream, order);
                byte[] cart = stream.ToArray();

                TermDB.SaveCart(cart, user.Username);
            }
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

        public static void RenderAccessDenied(HtmlForm form1, Label lblAccessDenied, Label lblDeniedPrompt, HtmlAnchor btnLogin)
        {
            form1.Visible = false;
            lblAccessDenied.Text = "ACCESS DENIED";
            lblDeniedPrompt.Text = "You are currently attempting to access a page without being logged in. Please return to the log in screen and sign in to an account.";
            lblAccessDenied.Visible = true;
            lblDeniedPrompt.Visible = true;
            btnLogin.Visible = true;
        }
    }
}