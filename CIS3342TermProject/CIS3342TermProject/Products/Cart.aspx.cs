using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TermProjectClasses;
namespace CIS3342TermProject
{
    public partial class Cart : System.Web.UI.Page
    {
        User user;
        Order order;
        Merchant merchant;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Global.RenderAccessDenied(form1, lblAccessDenied, lblDeniedPrompt, btnLogin);
                }
                else
                {
                    if (Session["order"] != null)
                    {

                        order = (Order)Session["order"];
                        rptCart.DataSource = order.Items;
                        rptCart.DataBind();

                        lblTotal.Text = order.GetTotalPrice().ToString("C");
                    }
                    else
                    {
                        form1.Visible = false;
                        lblUserStatus.Text = "Your cart is empty!";
                        lblUserStatus.CssClass = "text-success";
                        lblUserStatus.Visible = true;
                    }
                }
              
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            order = (Order)Session["order"];
            int i = 0;
            foreach (RepeaterItem item in rptCart.Items)
            {
                TextBox txtQuantity = (TextBox)item.FindControl("txtQuantity");
                if (Convert.ToInt32(txtQuantity.Text) != order.Items[i].Quantity & txtQuantity.Text != "1") ;
                {
                    order.Items[i].Quantity = Convert.ToInt32(txtQuantity.Text);
                }

                i++;
            }

            Session["order"] = order;
            lblUserStatus.Text = "Shopping Cart Updated!";
            lblUserStatus.CssClass = "text-success";
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            user = (User)Session["user"];
            order = (Order)Session["order"];
            merchant = (Merchant)Session["merchant"];

            string error;
            if(TermDB.RecordOrder(order, user.Username, out error) & error == "")
            {
                if(TermDB.PostOrder(order, merchant, user, out error) & error == "")
                {
                    Label lblStatus = new Label();
                    lblStatus.CssClass = "text-success";
                    lblStatus.Text = "Your order has been sent!";

                    Session["status"] = lblStatus;
                    Response.Redirect("Products.aspx");
                }
                else
                {
                    lblUserStatus.Text = error;
                    lblUserStatus.CssClass = "text-danger";
                    lblUserStatus.Visible = true;
                }
            }

        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            Response.Redirect("../Welcome.aspx");
        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProduct")
            {
                order = (Order)Session["order"];

                LinkButton b = (LinkButton)e.Item.FindControl("btnDelete");
                string[] test = b.ClientID.Split('_');
                int index = Convert.ToInt32(b.ClientID.Split('_')[2]);
               

                order.Items.RemoveAt(index);

                rptCart.DataBind();

                if(order.Items == null)
                {
                    Session["order"] = null;
                }
                
            }
        }
    }
}
