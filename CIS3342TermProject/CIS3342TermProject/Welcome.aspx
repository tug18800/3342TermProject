<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="CIS3342TermProject.WebForm1" %>

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
    <form id="form1" runat="server">
        <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-sm-offset-2 text">
                            <h1>Welcome! Food Service</h1>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-5">
                        	
                        	<div class="form-box">
                                <asp:Label
                                <asp:ValidationSummary runat="server" ID="valsumLogIn" CssClass="lead text-danger text-center" DisplayMode="List" ValidationGroup="vgLogIn"
                                    HeaderText="Please fill in the following correctly:" />
	                        	<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Login to our site</h3>
	                            		<p>Enter username and password to log on:</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-key"></i>
	                        		</div>
	                            </div>
	                            <div class="form-bottom">
				                    <div class="login-form">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-username">Username</label>
				                        	<asp:Textbox runat="server" type="text" placeholder="Username..." class="form-username form-control" id="txtUsername" />
                                            <asp:RequiredFieldValidator ID="valUserName" runat="server" ControlToValidate="txtUserName" CssClass="text-danger"
                                                ErrorMessage="You must enter a username" ValidationGroup="vgLogIn"></asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-password">Password</label>
				                        	<asp:Textbox runat="server" type="password" placeholder="Password..." class="form-password form-control" id="txtPassword" />
                                            <asp:RequiredFieldValidator ID="valPassword" runat="server" ControlToValidate="txtPassword" CssClass="text-danger"
                                                ErrorMessage="You must enter a password" ValidationGroup="vgLogIn"></asp:RequiredFieldValidator>
				                        </div>
                                        <div class="ml-4"> 
                                            <asp:CheckBox runat="server" type="checkbox" class="form-check-input" ID="chkRemeber" />
                                            <label class="form-check-label" for="chkRemember">Remember me</label>
                                            <asp:Button runat="server" ID="btnLogIn" CssClass="btn btn-primary float-right" Text="Sign in!" OnClick="btnLogIn_Click"></asp:Button>
                                        </div>
				                       
				                    </div>
			                    </div>
		                    </div>
                        </div>
                        
                        <div class="col-sm-1 middle-border"></div>
                        <div class="col-sm-1"></div>
                        	
                        <div class="col-sm-5">
                        	<div class="form-box">
                        	<asp:ValidationSummary ID="valsumNewUser" runat="server" CssClass="lead text-danger text-center" ValidationGroup="vgNew" DisplayMode="List" 
                                HeaderText="Please fill in the following correctly:"  />

                        		<div class="form-top">
	                        		<div class="form-top-left">
                                        
	                        			<h3>Sign up now</h3>
	                            		<p>Fill in the form below to get instant access:</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-pencil"></i>
	                        		</div>
	                            </div>
                                
	                            <div class="form-bottom pb-5">
				                    <div class="registration-form">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-first-name">Username</label>
				                        	<asp:Textbox runat="server" placeholder="Username..." class="form-first-name form-control" id="txtNewUsername" />
                                            <asp:RequiredFieldValidator ID="valNewUsername" runat="server" ControlToValidate="txtNewUsername" CssClass="text-danger"
                                                ErrorMessage="Username" Display="Dynamic" ValidationGroup="vgNew">You must enter a username</asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-last-name">Password</label>
				                        	<asp:Textbox runat="server" type="password" placeholder="Password..." class="form-last-name form-control" id="txtNewPassword" />
                                            <asp:RequiredFieldValidator ID="valNewPass" runat="server" ControlToValidate="txtNewPassword" CssClass="text-danger" Display="Dynamic"
                                                ErrorMessage="Password" ValidationGroup="vgNew">You must enter a password</asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">Confirm Password</label>
				                        	<asp:Textbox runat="server" type="password" placeholder="Confirm Password..." class="form-email form-control" id="txtConfirm" />
                                            <asp:CompareValidator ID="compvalConfirm" runat="server" ControlToValidate="txtConfirm" CssClass="text-danger"
                                                ControlToCompare="txtNewPassword" Display="Dynamic" ErrorMessage="Confirm Password" ValidationGroup="vgNew">This entry must match your password</asp:CompareValidator>
                                            <asp:RequiredFieldValidator ID="valConfirm" runat="server" ControlToValidate="txtConfirm" CssClass="text-danger" Display="Dynamic"
                                                ErrorMessage="Confirm Password" ValidationGroup="vgNew">You must enter a name</asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-about-yourself">Name</label>
				                        	<asp:Textbox runat="server" type="text" placeholder="Name..." class="form-first-name form-control" id="txtName" ValidateRequestMode="Enabled"/>
                                            <asp:RequiredFieldValidator ID="valName" runat="server" ControlToValidate="txtName" CssClass="text-danger" Display="Dynamic"
                                                ErrorMessage="Name" ValidationGroup="vgNew">You must enter a name</asp:RequiredFieldValidator>
				                        </div>
				                        <div>
                                        <asp:Button runat="server" role="button" class="btn btn-primary float-right" CommandName="NewUser" Text="Sign me up!" ID="btnSignUp" OnClick="btnSignUp_Click"></asp:Button>
				                        </div>
				                    </div>
			                    </div>
                        	</div>
                        </div>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="mt-5">
        	<div class="container text-center">
        		<hr />
                <p>Copywrite @2019</p>
        		</div>
        </footer>
    </form>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
