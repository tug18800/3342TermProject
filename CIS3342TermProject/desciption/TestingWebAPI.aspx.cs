using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data;
using Newtonsoft.Json;
using Utilities;
using System.Web.Script.Serialization;

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
            //string apiUrl = baseURI + "/GetDepartments";
            //WebClient client = new WebClient();
            //client.Headers["Content-type"] = "application/json";
            //client.Encoding = Encoding.UTF8;
            //string json = client.DownloadString(apiUrl);

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
                int id = ddlDepartments.SelectedIndex+1;

                //string apiUrl = baseURI + "/GetProducts?DeptID=" + id;
                //WebClient client = new WebClient();
                //client.Headers["Content-type"] = "application/json";
                //client.Encoding = Encoding.UTF8;
                //string json = client.DownloadString(apiUrl);

                string json = WebCom.GetJson(baseURI + "/GetProducts?DeptID=" + id.ToString());
                DataSet ds = (DataSet)JsonConvert.DeserializeObject(json, (typeof(DataSet)));

                gvProducts.DataSource = ds.Tables[0];
                gvProducts.DataBind();
            }
            else
            {
                gvProducts.DataSource = null;
                gvProducts.DataBind();
            }
        }
    }
}