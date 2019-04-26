<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Questions.aspx.cs" Inherits="CIS3342TermProject.Questions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="css/form-elements.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />

</head>
<body>
    <asp:Label runat="server" ID="lblAccessDenied" CssClass="text-center text-danger display-4" Visible="false"></asp:Label><br />
    <asp:Label runat="server" ID="lblDeniedPrompt" CssClass="text-center text-danger lead mt-3" Visible="false"></asp:Label><br />
    <a href="Welcome.aspx" role="button" id="btnLogin" runat="server" visible="false" class="btn btn-primary mt-4 text-center">To Login</a>
    <form id="form1" runat="server">
        <asp:Label runat="server" CssClass="h1 ml-auto mr-auto" ID="lblThanks"></asp:Label><br />
                            <asp:Label runat="server" ID="lblUserStatus" Visible="false" CssClass="text-center text-danger lead ml-auto mr-auto"></asp:Label>                               
                             <asp:ValidationSummary runat="server" ID="valsumInfo" CssClass="mt-4 lead text-danger text-center" DisplayMode="List" ValidationGroup="vgInfo"
                                    HeaderText="Please fill in the following correctly:" />
        <div class="row">
                        <div class="col-sm-12 col-sm-offset-2 text">
                            
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-5">
                        	<div class="form-box">
                                <asp:Label runat="server" ID="lblSignUpStatus" Visible="false" CssClass="text-center text-danger lead"></asp:Label>
                        	<asp:ValidationSummary ID="valsumNewUser" runat="server" CssClass="lead text-danger text-center" ValidationGroup="vgNew" DisplayMode="List" 
                                HeaderText="Please fill out the following security questions:"  />

                        		<div class="form-top">
	                        		<div class="form-top-left">
                                        
	                        			<h3>Security Questions</h3>
	                            		<p>Fill out the following security questions before continuing:</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-pencil"></i>
	                        		</div>
	                            </div>
                                
	                            <div class="form-bottom pb-5">
				                    <div class="registration-form">
				                    	<div class="form-group">
				                    		<label class="lead text-muted" for="form-first-name">Question 1</label>
				                        	<asp:DropDownList runat="server" ID="ddlQuest1" CssClass="form-control dropdown"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rvQuest1" runat="server" ControlToValidate="ddlQuest1" CssClass="text-danger"
                                                ErrorMessage="Question 1" Display="Dynamic" ValidationGroup="vgNew">You must select a question</asp:RequiredFieldValidator>
                                            <asp:Textbox runat="server" type="text" placeholder="Answer..." class="form-last-name form-control" id="txtAnswer1" />
                                            <asp:RequiredFieldValidator ID="rvAnswer1" runat="server" ControlToValidate="txtAnswer1" CssClass="text-danger" Display="Dynamic"
                                                ErrorMessage="Question 1's Answer" ValidationGroup="vgInfo">You must enter an answer for Question 1</asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<label class="lead text-muted" for="form-first-name">Question 1</label>
				                        	<asp:DropDownList runat="server" ID="ddlQuest2" CssClass="form-control dropdown"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rvQuest2" runat="server" ControlToValidate="ddlQuest1" CssClass="text-danger"
                                                ErrorMessage="Question 2" Display="Dynamic" ValidationGroup="vgNew">You must select a question</asp:RequiredFieldValidator>
                                            <asp:Textbox runat="server" type="text" placeholder="Answer..." class="form-last-name form-control" id="txtAnswer2" />
                                            <asp:RequiredFieldValidator ID="rvAnswer2" runat="server" ControlToValidate="txtAnswer2" CssClass="text-danger" Display="Dynamic"
                                                ErrorMessage="Question 2's Answer" ValidationGroup="vgInfo">You must enter an answer for Question 2</asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<label class="lead text-muted" for="form-first-name">Question 1</label>
				                        	<asp:DropDownList runat="server" ID="ddlQuest3" CssClass="form-control dropdown"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rvQuest3" runat="server" ControlToValidate="ddlQuest1" CssClass="text-danger"
                                                ErrorMessage="Question 3" Display="Dynamic" ValidationGroup="vgNew">You must select a question</asp:RequiredFieldValidator>
                                            <asp:Textbox runat="server" type="text" placeholder="Answer..." class="form-last-name form-control" id="txtAnswer3" />
                                            <asp:RequiredFieldValidator ID="rvAnswer3" runat="server" ControlToValidate="txtAnswer3" CssClass="text-danger" Display="Dynamic"
                                                ErrorMessage="Question 3's Answer" ValidationGroup="vgInfo">You must enter an answer for Question 3</asp:RequiredFieldValidator>
				                        </div>
				                        <div>
                                        <asp:Button runat="server" role="button" class="btn btn-primary float-right"
                                            CausesValidation="true" ValidationGroup="vgInfo" Text="Sign me up!" ID="btnSave" OnClick="btnSave_Click"></asp:Button>
				                        </div>
				                    </div>
			                    </div>
                        	</div>
                        </div>
                    </div>
                        
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
