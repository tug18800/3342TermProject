<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="CIS3342TermProject.SignUp" %>

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
                            <asp:Label runat="server" CssClass="h1" ID="lblThanks">Thanks for signing up, </asp:Label>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-5">
                        	
                        	<div class="form-box">
                                <asp:ValidationSummary runat="server" ID="valsumLogIn" CssClass="lead text-danger text-center" DisplayMode="List" ValidationGroup="vgLogIn"
                                    HeaderText="Please fill in the following correctly:" />
	                        	<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Tell us about yourself!</h3>
	                            		<p>Enter your information below:</p>
	                        		</div>
	                            </div>
	                            <div class="form-bottom">
				                    <div class="login-form">
				                    	<div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="Address..." class="form-username form-control" id="txtUsername" />
                                            <asp:RequiredFieldValidator ID="valUserName" runat="server" ControlToValidate="txtUserName" CssClass="text-danger"
                                                ErrorMessage="You must enter a username" ValidationGroup="vgLogIn"></asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<asp:Textbox runat="server" type="password" placeholder="City" class="form-password form-control" id="txtPassword" />
                                            <asp:RequiredFieldValidator ID="valPassword" runat="server" ControlToValidate="txtPassword" CssClass="text-danger"
                                                ErrorMessage="You must enter a password" ValidationGroup="vgLogIn"></asp:RequiredFieldValidator>
				                        </div>
                                         <div class="form-group">
				                        	<asp:DropDownList runat="server" placeholder="Select State" class="form-control dropdown" id="ddlStates" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword" CssClass="text-danger"
                                                ErrorMessage="You must enter a password" ValidationGroup="vgLogIn"></asp:RequiredFieldValidator>
				                        </div>
                                        <div class="ml-4"> 
                                            <asp:CheckBox runat="server" type="checkbox" class="form-check-input" ID="chkRemeber" />
                                            <label class="form-check-label" for="chkRemember">Remember me</label>
                                            <asp:Button runat="server" href="Products.aspx" role="button" class="btn btn-primary float-right" Text="Sign in!"></asp:Button>

                                        </div>
				                       
				                    </div>
			                    </div>
		                    </div>
                        </div>                   
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
