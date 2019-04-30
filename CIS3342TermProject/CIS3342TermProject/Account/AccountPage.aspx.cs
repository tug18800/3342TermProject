using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CIS3342TermProject
{
    public partial class AccountPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["merchant"] != null)
            {
                RenderMerchant();
            }
            else if(Session["user"] != null)
            {
                RenderUser();
            }
            else
            {
                Global.RenderAccessDenied(form1, lblAccessDenied, lblDeniedPrompt, btnLogin);
            }
        }

        private void RenderUser()
        {
            
        }

        private void RenderMerchant()
        {
  
        }
    }
}