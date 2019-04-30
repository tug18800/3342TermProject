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
        List<Department> deptList;
        Merchant merchant;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                if (Session["user"] == null)
                {
                    Global.RenderAccessDenied(form1, lblAccessDenied, lblDeniedPrompt, btnLogin);
                }
                else
                {
                    if (Session["order"] == null)
                    {
                        CheckCart();
                    }

                    GetDepartments();
                    rptDepartments_0.DataSource = deptList;
                    rptDepartments_0.DataBind();

                    Session["merchantList"] = merchantList;
                }
               
            }
            
        }

        private void GetDepartments()
        {
            merchantList = TermDB.GetMerchants();
            if(merchantList != null)
            {
                deptList = new List<Department>();   
                foreach(Merchant m in merchantList)
                {
                    List<Department> temp = new List<Department>();
                    List<Department> dept = new List<Department>();
                    if(TermDB.GetDepartment(m.ApiUrl, out dept) & dept != null)
                    {
                        foreach(Department d in dept)
                        {
                            deptList.Add(d);
                            temp.Add(d);
                        }
                        m.Departments = temp;
                    }
                    
                }
            }
        }

        protected void rptDepartments_0_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName == "getProduct")
            {
                merchantList = (List<Merchant>)Session["merchantList"];

                int index = Convert.ToInt32(e.Item.Controls[0].ClientID.Split('_')[3])+1;
                int count = 0;
                int i = 0;
                foreach(Merchant m in merchantList)
                {
                    count += m.Departments.Count;
                    if (index < count)
                    {
                        index = i;
                        break;
                    }
                    i++;
                }
                int department = Convert.ToInt32(((Label)e.Item.FindControl("lblDept")).Text);

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

        private void CheckCart()
        {
            user = (User)Session["user"];
            if (TermDB.CheckCart(user.Username))
            {
                Session["order"] = (Order)TermDB.GetCart(user.Username);

            }
            if (Session["order"] != null)
            {
                btnCart.CssClass = "text-danger";
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            Response.Redirect("../Welcome.aspx");
        }
    }
}