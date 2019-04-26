using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TermProjectClasses;
namespace CIS3342TermProject
{
    public partial class SignUp : System.Web.UI.Page
    {
        string[] states = { "AL", "AK", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FM", "FL", "GA", "GU", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MH", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "MP", "OH", "OK", "OR", "PW", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VI", "VA", "WA", "WV", "WI", "WY" };
        User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(Session["user"] == null)
            //{
            //    form1.Visible = false;
            //    lblAccessDenied.Text = "ACCESS DENIED";
            //    lblDeniedPrompt.Text = "You are currently attempting to access a page without being logged in. Please return to the log in screen and sign in to an account.";
            //    lblAccessDenied.Visible = true;
            //    lblDeniedPrompt.Visible = true;
            //    btnLogin.Visible = true;
            //}
            //else
            //{
            //ddlStates.DataSource = states;
            // ddlStates.DataBind();
            //}

            user = (User)Session["user"];
            lblThanks.Text = "Thanks for signing up, " + user.Name;

            ddlStates.DataSource = states;
            ddlBillingState.DataSource = states;

            ddlStates.DataBind();
            ddlBillingState.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                int zip;
                user.Address = txtAddress.Text;
                user.City = txtCity.Text;
                user.State = ddlStates.SelectedValue;
                Int32.TryParse(txtZipCode.Text, out zip);
                user.ZipCode = zip;
                user.Phone = txtPhone.Text;

                int billZip;
                user.Billing = new TermProjectClass.ContactInformation();
                user.Billing.Address = txtBillingAddress.Text;
                user.Billing.City = txtBillingCity.Text;
                user.Billing.State = ddlBillingState.SelectedValue;
                Int32.TryParse(txtBillingZipCode.Text, out billZip);
                user.Billing.ZipCode = billZip;
                user.Billing.Phone = txtBillingPhone.Text;

                Session["user"] = user;
                Response.Redirect("Questions.aspx");
            }
            catch( Exception ex)
            {
                lblUserStatus.Text = "The Zip Code you've entered is invalid. Please try again.";
                lblUserStatus.Visible = true;
            }
        }

        protected void chkSame_CheckedChanged(object sender, EventArgs e)
        {
            if(chkSame.Checked)
            {
                txtBillingAddress.Enabled = false;
                txtBillingAddress.Text = txtAddress.Text;
                txtBillingCity.Enabled = false;
                txtBillingCity.Text = txtCity.Text;
                ddlBillingState.Enabled = false;
                ddlBillingState.SelectedValue = ddlStates.SelectedValue;
                txtBillingZipCode.Enabled = false;
                txtBillingZipCode.Text = txtZipCode.Text;
                txtBillingPhone.Enabled = false;
                txtBillingPhone.Text = txtPhone.Text;
            }
            else
            {
                txtBillingAddress.Enabled = true;
                txtBillingAddress.Text = "";
                txtBillingCity.Enabled = true;
                txtBillingCity.Text = "";
                ddlBillingState.Enabled = true;
                ddlBillingState.SelectedIndex = -1;
                txtBillingZipCode.Enabled = true;
                txtBillingZipCode.Text = "";
                txtBillingPhone.Enabled = true;
                txtBillingPhone.Text = "";
            }
        }
    }
}