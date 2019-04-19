using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data;
using Newtonsoft.Json;
using System.Web.Script.Serialization;
using TermProjectClasses;

namespace desciption
{
    public partial class TestingWebAPI : System.Web.UI.Page
    {
        string baseURI = "http://cis-iis2.temple.edu/Spring2019/CIS3342_tug18800/TermProjectWS/api/service/Merchant";
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

            x += "SiteID=" + SiteID + "&";
            x += "APIKey=" + APIKey + "&";
            x += "Desc=" + Desc + "&";
            x += "Name=" + Name + "&";
            x += "Address=" + Address + "&";
            x += "City=" + City + "&";
            x += "State=" + State + "&";
            x += "ZipCode=" + ZIP + "&";
            x += "Phone=" + Phone + "&";
            x += "Email=" + Email + "&";


            string y = WebCom.PushPOST(baseURI + "/RecordPurchase", x);

            stat.Text = y;
        }

        protected void btnRecordSubmit_Click(object sender, EventArgs e)
        {
            string x = "?";

            string ProductID = txtRecProductID.Text;
            string Quantity = txtRecQuantity.Text;
            string SiteID = txtRecSiteID.Text;
            string APIKey = txtRecAPIKey.Text;
            string CustomerID = txtRecCustomerID.Text;
            string Name = txtRecName.Text;
            string Address = txtRecAddress.Text;
            string City = txtRecCity.Text;
            string State = txtRecState.Text;
            string ZIP = txtRecZip.Text;
            string Phone = txtRecPhone.Text;
            string Email = txtRecEnail.Text;


            x += "SiteID=" + SiteID + "&";
            x += "APIKey=" + APIKey + "&";
            x += "Desc=" + Desc + "&";
            x += "Name=" + Name + "&";
            x += "Address=" + Address + "&";
            x += "City=" + City + "&";
            x += "State=" + State + "&";
            x += "ZipCode=" + ZIP + "&";
            x += "Phone=" + Phone + "&";
            x += "Email=" + Email + "&";


            string y = WebCom.PushPOST(baseURI + "/RecordPurchase", x);

            stat.Text = y;
        }
    }
}