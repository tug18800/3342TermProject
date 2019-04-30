using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TermProjectClasses;
namespace CIS3342TermProject
{
    
    public partial class UCAccountInfo : System.Web.UI.UserControl
    {
        User user;
        Merchant merchant;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"] != null)
            {
                user = (User)Session["user"];
                RenderUser();
            }
            else
            {
                merchant = (Merchant)Session["merchant"];
                RenderMerchant();
            }
            
        }

        private void RenderUser()
        {
            lblUseranme.Text = user.Username;
            lblName.Text = user.Name;
            lblAddress.Text = user.Address;
            lblCity.Text = user.City;
            lblState.Text = user.State;
            lblZipCode.Text = user.ZipCode.ToString();
            lblEmail.Text = user.Email;
            lblPhone.Text = user.Phone;
        }

        private void RenderMerchant()
        {
            lblUseranme.Text = merchant.Username;
            lblName.Text = merchant.Name;
            lblAddress.Text = merchant.Address;
            lblCity.Text = merchant.City;
            lblState.Text = merchant.State;
            lblZipCode.Text = merchant.ZipCode.ToString();
            lblEmail.Text = merchant.Email;
            lblPhone.Text = merchant.Phone;
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            lblUseranme.Visible = false;
            lblName.Visible = false;
            lblAddress.Visible = false;
            lblCity.Visible = false;
            lblState.Visible = false;
            lblZipCode.Visible = false;
            lblEmail.Visible = false;
            lblPhone.Visible = false;

            txtUseranme.Visible = true;
            txtName.Visible = true;
            txtAddress.Visible = true;
            txtCity.Visible = true; 
            txtState.Visible = true;
            txtZipCode.Visible = true; 
            txtEmail.Visible = true;
            txtPhone.Visible = true;

            txtUseranme.Text = user.Username;
            txtName.Text = user.Name;
            txtAddress.Text = user.Address;
            txtCity.Text = user.City;
            txtState.Text = user.State;
            txtZipCode.Text = user.ZipCode.ToString();
            txtEmail.Text = user.Email;
            txtPhone.Text = user.Phone;

            btnChange.Visible = false;
            btnSave.Visible = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                if (isDifferent(txtUseranme.Text, user.Username)) { user.Username = txtUseranme.Text; };
                if (isDifferent(txtName.Text, user.Name)) { user.Name = txtName.Text; };
                if (isDifferent(txtAddress.Text, user.Address)) { user.Address = txtAddress.Text; };
                if (isDifferent(txtCity.Text, user.City)) { user.City = txtCity.Text; };
                if (isDifferent(txtState.Text, user.State)) { user.State = txtState.Text; };
                if (isDifferent(txtZipCode.Text, user.ZipCode.ToString())) { user.ZipCode = Convert.ToInt32(txtZipCode.Text); };
                if (isDifferent(txtPhone.Text, user.Phone)) { user.Phone = txtPhone.Text; };
            }
            else
            {
                if (isDifferent(txtUseranme.Text, user.Username)) { merchant.Username = txtUseranme.Text; };
                if (isDifferent(txtName.Text, user.Name)) { merchant.Name = txtName.Text; };
                if (isDifferent(txtAddress.Text, user.Address)) { merchant.Address = txtAddress.Text; };
                if (isDifferent(txtCity.Text, user.City)) { merchant.City = txtCity.Text; };
                if (isDifferent(txtState.Text, user.State)) { merchant.State = txtState.Text; };
                if (isDifferent(txtZipCode.Text, user.ZipCode.ToString())) { merchant.ZipCode = Convert.ToInt32(txtZipCode.Text); };
                if (isDifferent(txtPhone.Text, user.Phone)) { merchant.Phone = txtPhone.Text; };
            }

            TermDB.SaveUserInfo(user);

            Response.Redirect("AccountPage.aspx");
        }

        private bool isDifferent(string text, string userInfo)
        {
            if(text != userInfo)
            {
                return true;
            }
            return false;
        }
    }
}