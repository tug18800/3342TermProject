using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TermProjectClasses;
namespace CIS3342TermProject.Registration
{
    public partial class Registration : System.Web.UI.Page
    {
        string[] states = { "AL", "AK", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FM", "FL", "GA", "GU", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MH", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "MP", "OH", "OK", "OR", "PW", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VI", "VA", "WA", "WV", "WI", "WY" };

        protected void Page_Load(object sender, EventArgs e)
        {
            ddlStates.DataSource = states;
            ddlStates.DataBind();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Merchant merchant = LoadMerchant();

            TermDB.SaveMerchant();

        }

        private Merchant LoadMerchant()
        {
            Merchant merchant = new Merchant();
            int zip;
            try
            {
                merchant.Username = txtUsername.Text;
                merchant.Password = txtPassword.Text;
                merchant.Name = txtName.Text;
                merchant.Address = txtAddress.Text;
                merchant.City = txtCity.Text;
                merchant.State = ddlStates.Text;
                Int32.TryParse(txtZipCode.Text, out zip);
                merchant.ZipCode = zip;
                merchant.Email = txtEmail.Text;
                merchant.Phone = txtPhone.Text;

                merchant.APIKey = merchant.GetRandomKey();

                return merchant;
            }
            catch (Exception ex)
            {
                lblUserStatus.Text = "The Zip Code you have enetered is invalid. Please try again";
                lblUserStatus.Visible = true;
                return null;
            }
        }
    }
}