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
        protected void Page_Load(object sender, EventArgs e)
        {
            product = (Product)Session["product"];

            imgProductImage.ImageUrl = product.ImageUrl;
            lblName.Text = product.Title;
            lblDesc.Text = product.Description;
            lblPrice.Text = product.Price.ToString("C");
        }
    }
}