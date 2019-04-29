using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TermProjectClasses;
namespace CIS3342TermProject
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        Product product;
        Merchant merchant;
        Department department;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            {
                Global.RenderAccessDenied(form1, lblAccessDenied, lblDeniedPrompt, btnLogin);
            }
            else
            {
                RenderProduct();

                lblPrice.Text = product.Price.ToString("C");
            }
           
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Session["product"] = null;

            Response.Redirect("Products.aspx");
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            try
            {
                int maxID = 0;
                Order order;
                merchant = (Merchant)Session["merchant"];
                department = (Department)Session["department"];
                if (Session["order"] == null)
                {
                    order = new Order();
                    order.Items = new List<OrderLine>();
                }
                else
                {
                    order = (Order)Session["order"];
                    maxID = order.Items.Last().OrderLineId;
                }

                OrderLine cart = new OrderLine();


                if (maxID > 0)
                { cart.OrderLineId = maxID++; }
                else
                { cart.OrderLineId = 1; }
                cart.Item = product;
                cart.Quantity = Convert.ToInt32(txtQuantity.Text);
                cart.Price = product.Price;
                cart.MerchantId = merchant.Username;


                order.Items.Add(cart);

                Session["order"] = order;

                lblUserStatus.Text = txtQuantity.Text + " " + product.Title + "(s) added to cart!";
                lblUserStatus.Visible = true;
                lblUserStatus.CssClass = "text-success h3";
            }
            catch (Exception ex)
            {
                lblUserStatus.Text = "An error has occured. Please try again";
                lblUserStatus.Visible = true;
            }

        }

        private void RenderProduct()
        {
            if (Session["order"] != null)
            {
                btnCart.CssClass = "text-danger";
            }
            product = (Product)Session["product"];

            imgProductImage.ImageUrl = product.ImageUrl;
            lblName.Text = product.Title;
            lblDesc.Text = product.Description;

            if (product.Quantity > 0)
            {
                lblQuantity.Text = product.Quantity.ToString();
            }
            else
            {
                lblQuantity.Text = "Sold out!";
                lblQuantity.CssClass += "text-danger h3";
                txtQuantity.Enabled = false;
                btnAddToCart.Enabled = false;
            }
        }
    }
}