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
        string baseURI = "http://localhost:3423/api/service/Merchant";
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
            Dictionary<int, string> dep = new JavaScriptSerializer().Deserialize<Dictionary<int, string>>(json);

            ddlDepartments.DataSource = dep;
            //Assign Department Number
            ddlDepartments.DataValueField = dep.Keys.ToString();
            //Assign Department Name
            ddlDepartments.DataTextField = dep.Values.ToString();

            ddlDepartments.DataBind();

            ddlDepartments.Items.Insert(0, new ListItem("-- Select --", ""));
        }

        protected void ddlDepartments_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDepartments.SelectedValue != "")
            {
                int id = Convert.ToInt32(ddlDepartments.SelectedValue);

                //string apiUrl = baseURI + "/GetProducts?DeptID=" + id;
                //WebClient client = new WebClient();
                //client.Headers["Content-type"] = "application/json";
                //client.Encoding = Encoding.UTF8;
                //string json = client.DownloadString(apiUrl);

                string json = WebCom.GetJson(baseURI + "/GetProducts");
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