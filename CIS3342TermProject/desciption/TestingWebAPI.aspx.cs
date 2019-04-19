using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data;
using System.Web.Script.Serialization;
using TermProjectClass;

namespace desciption
{
    public partial class TestingWebAPI : System.Web.UI.Page
    {
        string baseURI = "http://cis-iis2.temple.edu/Spring2019/CIS3342_tug18800/TermProjectWS/api/service/Merchants";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropDownList();
            }
        }

        private void BindDropDownList()
        {
          
            string json = WebCom.GetJson(baseURI + "/GetDepartments");
            var dep = new JavaScriptSerializer().Deserialize<List<string>>(json);

            ddlDepartments.DataSource = dep;
            ddlDepartments.DataBind();

            ddlDepartments.Items.Insert(0, new ListItem("-- Select --", ""));
        }

        protected void ddlDepartments_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDepartments.SelectedValue != "")
            {
                int id = ddlDepartments.SelectedIndex;

                //string apiUrl = baseURI + "/GetProducts?DeptID=" + id;
                //WebClient client = new WebClient();
                //client.Headers["Content-type"] = "application/json";
                //client.Encoding = Encoding.UTF8;
                //string json = client.DownloadString(apiUrl);

                string json = WebCom.GetJson(baseURI + "/GetProducts?DeptID=" + id.ToString());
                List<Product> list = new JavaScriptSerializer().Deserialize<List<Product>>(json);

                gvProducts.DataSource = list;
                gvProducts.DataBind();
            }
            else
            {
                gvProducts.DataSource = null;
                gvProducts.DataBind();
            }
        }

        protected void btnRegSubmit_Click(object sender, EventArgs e)
        {
            string x = "?";

            string SiteID = txtRegSiteID.Text;
            string APIKey = txtRegAPIKey.Text;
            string Desc = txtRegDesc.Text;
            string Name = txtRegName.Text;
            string Email = txtRegDesc.Text;
            string Phone = txtRegPhone.Text;
            string Address = txtRegAddress.Text; 
            string City = txtRegCity.Text;
            string State = txtRegState.Text;
            string ZIP = txtRegZip.Text;

            ContactInformation seller = new ContactInformation();
            seller.Name = Name;
            seller.Address = Address;
            seller.City = City;
            seller.State = State;
            seller.ZipCode = Convert.ToInt32(ZIP);
            seller.Email = Email;
            seller.Phone = Phone;




            x += "SiteID=" + SiteID + "&";
            x += "APIKey=" + APIKey + "&";
            x += "Description=" + Desc;
          

            string y = WebCom.PushPOST(baseURI + "/RegisterSite"+x, seller);

            lblRegStat.Text = y;
        }

        protected void btnRecordSubmit_Click(object sender, EventArgs e)
        {
            string x = "?";

            string ProductID = txtRecProductID.Text;
            int Quantity = Convert.ToInt32(txtRecQuantity.Text);
            string SiteID = txtRecSiteID.Text;
            string APIKey = txtRecAPIKey.Text;
            string CustomerID = txtRecCustomerID.Text;
            string Name = txtRecName.Text;
            string Address = txtRecAddress.Text;
            string City = txtRecCity.Text;
            string State = txtRecState.Text;
            int ZIP = Convert.ToInt32(txtRecZip.Text);
            string Phone = txtRecPhone.Text;
            string Email = txtRecEmail.Text;

            Customer cust = new Customer();

            cust.CustomerID = CustomerID;
            cust.Name = Name;
            cust.Address = Address;
            cust.City = City;
            cust.State = State;
            cust.ZipCode = ZIP;
            cust.Phone = Phone;
            cust.Email = Email;


            x += "ProductID=" + ProductID + "&";
            x += "Quantity=" + Quantity + "&";
            x += "SiteID=" + SiteID + "&";
            x += "APIKey=" + APIKey;


            string y = WebCom.PushPOST(baseURI + "/RecordPurchase"+x, cust);

            lblRecStat.Text = y;
        }
    }
}