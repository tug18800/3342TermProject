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
            string[] x = new string[9];
            string SiteID = txtRegSiteID.Text; x[0] = SiteID;
            string APIKey = txtRegAPIKey.Text; x[1] = APIKey;
            string Desc = txtRegDesc.Text; x[2] = Desc;
            string Email = txtRegDesc.Text; x[3] = Email;
            string Phone = txtRegPhone.Text; x[4] = Phone;
            string Address = txtRegAddress.Text; x[5] = Phone;
            string City = txtRegCity.Text; x[6] = Phone;
            string State = txtRegState.Text; x[7] = Phone;
            string ZIP = txtRegZip.Text; x[8] = Phone;

            string y = WebCom.PushPOST(baseURI + "/RecordPurchase", x);

            stat.Text = y;
        }

        protected void btnRecordSubmit_Click(object sender, EventArgs e)
        {
            string x  = "ProductID="+txtRecProductID.Text+"&";
            x += "Quantity="+txtRecQuantity.Text.ToString()+"&";
            x += "SiteID=" + txtRecSiteID.Text+"&"; 
            x[3] = APIKey= + txtRecAPIKey.Text + "&"; 
            x[4] = CustomerID= + txtCustomerID.Text + "&";
            x[5] = txtRecFName.Text + "&";
            x[6] = txtRecLName.Text + "&";
            x[7] = txtRecAge.Text + "&";
            x[8] = txtRecPhone.Text + "&";
            x[9] = txtRecAddress.Text + "&";
            x[10] = txtRecCity.Text + "&";
            x[11] = txtRecState.Text + "&";
            x[12] = txtRecZip.Text + "&";


            string y = WebCom.PushPOST(baseURI + "/RecordPurchase", x);

            stat.Text = y;
        }
    }
}