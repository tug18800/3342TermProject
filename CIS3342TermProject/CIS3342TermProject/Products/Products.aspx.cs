using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TermProjectClasses;
namespace CIS3342TermProject
{
    public partial class Products : System.Web.UI.Page
    {
        User user;
        List<Merchant> merchantList;
        Merchant merchant;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                //if(Session["user"] == null)
                //{
                //Global.RenderAccessDenied(form1, lblAccessDenied, lblDeniedPrompt, btnLogin);
                //}
                //else
                //{
                //}
                if(Session["order"] != null)
                {
                    btnCart.CssClass = "text-danger";
                }

                GetDepartments();
                rptDepartments_0.DataSource = merchantList[0].Departments;
                rptDepartments_0.DataBind();

                Session["merchantList"] = merchantList;
            }
            
        }

        private void GetDepartments()
        {
            merchantList = TermDB.GetMerchants();
            if(merchantList != null)
            {
                foreach(Merchant m in merchantList)
                {
                    m.Departments = TermDB.GetDepartment(m.ApiUrl);
                }
            }
        }

        protected void rptDepartments_0_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName == "getProduct")
            {
                merchantList = (List<Merchant>)Session["merchantList"];

                int index = Convert.ToInt32(e.Item.ClientID.Split('_')[1]);
                int department = Convert.ToInt32(e.Item.Controls[0].ClientID.Split('_')[3]) + 1;

                merchant = merchantList[index];
                merchant.Products = TermDB.GetProductCatalogue(merchant.ApiUrl, department.ToString());
                if(merchant.Products != null)
                {
                    Session["merchant"] = merchant;
                    rptDepartments_0.Visible = false;

                    rptProducts.Visible = true;
                    rptProducts.DataSource = merchant.Products;
                    rptProducts.DataBind();
                }
                    btnBack.Visible = true;

            }
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "getProductDetail")
            {
                Merchant merchant = (Merchant)Session["Merchant"];
                int index = Convert.ToInt32(e.Item.Controls[0].ClientID.Split('_')[2]);

                Product product = merchant.Products[index];
                if (product != null)
                {
                    Session["product"] = product;
                    Response.Redirect("ProductDetail.aspx");
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Session["merchant"] = null;

            Response.Redirect("Products.aspx");
        }
    }
}