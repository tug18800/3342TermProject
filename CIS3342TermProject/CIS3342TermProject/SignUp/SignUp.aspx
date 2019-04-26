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
    <asp:Label runat="server" ID="lblAccessDenied" CssClass="text-center text-danger display-4" Visible="false"></asp:Label><br />
    <asp:Label runat="server" ID="lblDeniedPrompt" CssClass="text-center text-danger lead mt-3" Visible="false"></asp:Label><br />
    <a href="Welcome.aspx" role="button" id="btnLogin" runat="server" visible="false" class="btn btn-primary mt-4 text-center">To Login</a>
    <form id="form1" runat="server">
        <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-sm-offset-2 text">
                            <asp:Label runat="server" CssClass="h1" ID="lblThanks"></asp:Label>
                            <asp:Label runat="server" ID="lblUserStatus" Visible="false" CssClass="text-center text-danger lead"></asp:Label>                               
                             <asp:ValidationSummary runat="server" ID="valsumInfo" CssClass="mt-4 lead text-danger text-center" DisplayMode="List" ValidationGroup="vgInfo"
                                    HeaderText="Please fill in the following correctly:" />
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-5">
                        	
                        	<div class="form-box">
                               
	                        	<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Shipping Details</h3>
	                            		<p>Enter your information below:</p>
	                        		</div>
	                            </div>
	                            <div class="form-bottom">
				                    <div class="login-form">
				                    	<div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="Shipping Address..." class="form-username form-control" id="txtAddress" />
                                            <asp:RequiredFieldValidator ID="rvUserName" runat="server" ControlToValidate="txtAddress" CssClass="text-danger"
                                                ErrorMessage="Shipping Address" ValidationGroup="vgInfo">You must enter an Address</asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="Shipping City..." class="form-password form-control" id="txtCity" />
                                            <asp:RequiredFieldValidator ID="rvPassword" runat="server" ControlToValidate="txtCity" CssClass="text-danger"
                                                ErrorMessage="Shipping City" ValidationGroup="vgInfo">You must enter a City</asp:RequiredFieldValidator>
				                        </div>
                                         <div class="form-group">
				                        	<asp:DropDownList runat="server" AppendDataBoundItems="true" CssClass="form-control dropdown" id="ddlStates" />
                                            <asp:RequiredFieldValidator ID="rvState" runat="server" ControlToValidate="ddlStates" InitialValue="Select State" CssClass="text-danger"
                                                ErrorMessage="Shipping State" ValidationGroup="vgInfo">You must select a State</asp:RequiredFieldValidator>
				                        </div>
                                        <div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="Shipping Zip Code..." class="form-password form-control" id="txtZipCode" />
                                            <asp:RequiredFieldValidator ID="rvZip" runat="server" ControlToValidate="txtZipCode" CssClass="text-danger"
                                                ErrorMessage="Shipping Zip Code" ValidationGroup="vgInfo">You must enter a Zip Code</asp:RequiredFieldValidator>
				                        </div>
                                        <div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="Shipping Phone Number..." class="form-password form-control" id="txtPhone" />
                                            <asp:RequiredFieldValidator ID="rvPhone" runat="server" ControlToValidate="txtPhone" CssClass="text-danger"
                                                ErrorMessage="Shipping Phone Number" ValidationGroup="vgInfo">You must enter a Phone Number</asp:RequiredFieldValidator>
				                        </div>
				                    </div>
			                    </div>
		                    </div>
                        </div>  
                        
                         <div class="col-sm-1 middle-border"></div>
                        <div class="col-sm-1"></div>
                        	
                        <div class="col-sm-5">
                        	
                        	<div class="form-box">
                               
	                        	<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Billing Details</h3>
	                            		<p>Enter your information below:</p>
                                        <br />
                                        <asp:CheckBox runat="server" CssClass="float-left form-check-input ml-1" AutoPostBack="true" Checked="false" ID="chkSame" Text="Same as Shipping Address" OnCheckedChanged="chkSame_CheckedChanged" />

	                        		</div>
	                            </div>
	                            <div class="form-bottom">
				                    <div class="login-form">
				                    	<div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="Billing Address..." class="form-username form- form-control w-100" id="txtBillingAddress" />
                                            <asp:RequiredFieldValidator ID="rfBillingAddress" runat="server" ControlToValidate="txtAddress" CssClass="text-danger"
                                                ErrorMessage="Billing Address" ValidationGroup="vgInfo">You must enter an Address</asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="Billing City..." class="form-username form-control w-100" id="txtBillingCity" />
                                            <asp:RequiredFieldValidator ID="rfBillingCity" runat="server" ControlToValidate="txtCity" CssClass="text-danger"
                                                ErrorMessage="Billing Password" ValidationGroup="vgInfo">You must enter a City</asp:RequiredFieldValidator>
				                        </div>
                                         <div class="form-group">
				                        	<asp:DropDownList runat="server" class="form-control form-username dropdown w-100" id="ddlBillingState" />
                                            <asp:RequiredFieldValidator ID="rfBillingState" runat="server" ControlToValidate="ddlBillingState" InitialValue="Select State" CssClass="text-danger"
                                                ErrorMessage="Billing State" ValidationGroup="vgInfo">You must select a State</asp:RequiredFieldValidator>
				                        </div>
                                        <div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="Billing Zip Code..." class="form-password form-control w-100" id="txtBillingZipCode" />
                                            <asp:RequiredFieldValidator ID="rfBillingZipCode" runat="server" ControlToValidate="txtBillingZipCode" CssClass="text-danger"
                                                ErrorMessage="Billing Zip Code" ValidationGroup="vgInfo">You must enter a Zip Code</asp:RequiredFieldValidator>
				                        </div>
                                        <div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="Billing Phone Number..." class="form-password form-control w-100" id="txtBillingPhone" />
                                            <asp:RequiredFieldValidator ID="rfBillingPhone" runat="server" ControlToValidate="txtBillingPhone" CssClass="text-danger"
                                                ErrorMessage="Billing Phone Number" ValidationGroup="vgInfo">You must enter a Phone Number</asp:RequiredFieldValidator>
				                        </div>
                                        <div class="mb-5">
                                        <asp:Button runat="server" role="button" class="btn btn-primary float-right"
                                            CausesValidation="true" ValidationGroup="vgInfo" Text="Sign me up!" ID="btnSave" OnClick="btnSave_Click"></asp:Button>
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
