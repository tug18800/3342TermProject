using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TermProjectClasses;

namespace CIS3342TermProject
{
    public partial class Questions : System.Web.UI.Page
    {
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
            lblThanks.Text = "Almost done, " + user.Name + "!";

            LoadFormData();
            
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            SaveUserData();
            

            string error;
            if(TermDB.SaveUser(user, out error) & error == "")
            {
                Session["user"] = user;
                Response.Redirect("Products.aspx");
            }
            else
            {
                lblSignUpStatus.Text = error;
                lblSignUpStatus.Visible = true;
            }
            
        }

       

        private void LoadFormData()
        {
            ddlQuest1.DataSource = TermDB.GetFirstQuestionSet().Tables[0];
            ddlQuest1.DataTextField = TermDB.GetFirstQuestionSet().Tables[0].Columns["Question"].ToString();
            ddlQuest1.DataValueField = TermDB.GetFirstQuestionSet().Tables[0].Columns["QuestionId"].ToString();

            ddlQuest2.DataSource = TermDB.GetSecondQuestionSet();
            ddlQuest2.DataTextField = TermDB.GetSecondQuestionSet().Tables[0].Columns["Question"].ToString();
            ddlQuest2.DataValueField = TermDB.GetSecondQuestionSet().Tables[0].Columns["QuestionId"].ToString();

            ddlQuest3.DataSource = TermDB.GetThirdQuestionSet();
            ddlQuest3.DataTextField = TermDB.GetThirdQuestionSet().Tables[0].Columns["Question"].ToString();
            ddlQuest3.DataValueField = TermDB.GetThirdQuestionSet().Tables[0].Columns["QuestionId"].ToString();

            ddlQuest1.DataBind();
            ddlQuest2.DataBind();
            ddlQuest3.DataBind();
        }

        private void SaveUserData()
        {
            user.Questions = new TermProjectClasses.Questions();

            user.Questions.QuestionOne = Convert.ToInt32(ddlQuest1.SelectedValue);
            user.Questions.QuestionTwo = Convert.ToInt32(ddlQuest2.SelectedValue);
            user.Questions.QuestionThree = Convert.ToInt32(ddlQuest3.SelectedValue);

            user.Questions.QuestionOneAnswer = txtAnswer1.Text;
            user.Questions.QuestionTwoAnswer = txtAnswer2.Text;
            user.Questions.QuestionThreeAnswer = txtAnswer3.Text;
        }
    }
}