<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CIS3342TermProject.Registration.Registration" %>

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
        <link href="../css/form-elements.css" rel="stylesheet" />
        <link href="../css/style.css" rel="stylesheet" />
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:Label runat="server" CssClass="h1 ml-auto mr-auto" ID="lblThanks"></asp:Label><br />
            <asp:Label runat="server" ID="lblUserStatus" Visible="false" CssClass="text-center text-danger lead ml-auto mr-auto"></asp:Label>                               
            <asp:ValidationSummary runat="server" ID="valsumInfo" CssClass="mt-4 lead text-danger text-center" DisplayMode="List" ValidationGroup="vgReg"
            HeaderText="Please fill in the following correctly:" />
            <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-sm-offset-2 text">
                            <h1>Enter your information to show your products to the world!</h1>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-5">
                        	<div class="form-box">
                                <asp:Label runat="server" ID="Label1" Visible="false" CssClass="text-center text-danger lead"></asp:Label>
                        	<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="lead text-danger text-center" ValidationGroup="vgNew" DisplayMode="List" 
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
				                        	<asp:Textbox runat="server" placeholder="Username..." class="form-first-name form-control" id="txtUsername"/>
                                            <asp:RequiredFieldValidator ID="rfUsername" runat="server" ControlToValidate="txtUsername" CssClass="text-danger"
                                                ErrorMessage="Username" Display="Dynamic" ValidationGroup="vgReg">You must enter a username</asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-last-name">Password</label>
				                        	<asp:Textbox runat="server" type="password" placeholder="Password..." class="form-last-name form-control" id="txtPassword" />
                                            <asp:RequiredFieldValidator ID="rfPassword" runat="server" ControlToValidate="txtPassword" CssClass="text-danger" Display="Dynamic"
                                                ErrorMessage="Password" ValidationGroup="vgReg">You must enter a password</asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">Confirm Password</label>
				                        	<asp:Textbox runat="server" type="password" placeholder="Confirm Password..." class="form-email form-control" id="txtConfirm" />
                                            <asp:CompareValidator ID="cvConfirm" runat="server" ControlToValidate="txtConfirm" CssClass="text-danger"
                                                ControlToCompare="txtPassword" Display="Dynamic" ErrorMessage="Confirm Password" ValidationGroup="vgNew">This entry must match your password</asp:CompareValidator>
                                            <asp:RequiredFieldValidator ID="rfConfirm" runat="server" ControlToValidate="txtConfirm" CssClass="text-danger" Display="Dynamic"
                                                ErrorMessage="Confirm Password" ValidationGroup="vgReg">You must enter a name</asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-about-yourself">Company Name</label>
				                        	<asp:Textbox runat="server" type="text" placeholder="Company Name..." class="form-first-name form-control" id="txtName" ValidateRequestMode="Enabled"/>
                                            <asp:RequiredFieldValidator ID="rfName" runat="server" ControlToValidate="txtName" CssClass="text-danger" Display="Dynamic"
                                                ErrorMessage="Company Name" ValidationGroup="vgReg">You must enter a Company name</asp:RequiredFieldValidator>
				                        </div>
                                        <div class="form-group">
				                        	<label class="sr-only" for="form-about-yourself">Email</label>
				                        	<asp:Textbox runat="server" type="text" placeholder="Email..." class="form-first-name form-control" id="txtEmail" ValidateRequestMode="Enabled"/>
                                            <asp:RequiredFieldValidator ID="rfEmail" runat="server" ControlToValidate="txtEmail" CssClass="text-danger" Display="Dynamic"
                                                ErrorMessage="Email" ValidationGroup="vgReg">You must enter an email</asp:RequiredFieldValidator>
				                        </div>
                                         <div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="API URL..." class="form-password form-control" id="txtAPI" />
                                            <asp:RequiredFieldValidator ID="rfAPI" runat="server" ControlToValidate="txtAPI" CssClass="text-danger"
                                                ErrorMessage="API URL" ValidationGroup="vgReg">You must enter your store's Web API URL</asp:RequiredFieldValidator>
				                        </div>
                                        <hr />
                                        <div class="form-group">
				                        	<asp:Textbox runat="server" TextMode="MultiLine" type="text" placeholder="Company Description..." class="form-password form-control" id="txtDescription" />
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
	                        			<h3>Address Details</h3>
	                        		</div>
	                            </div>
	                            <div class="form-bottom">
				                    <div class="login-form">
				                    	<div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="Address..." class="form-username form-control" id="txtAddress" />
                                            <asp:RequiredFieldValidator ID="rvAddress" runat="server" ControlToValidate="txtAddress" CssClass="text-danger"
                                                ErrorMessage="Shipping Address" ValidationGroup="vgReg">You must enter an Address</asp:RequiredFieldValidator>
				                        </div>
				                        <div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="City..." class="form-password form-control" id="txtCity" />
                                            <asp:RequiredFieldValidator ID="rvCity" runat="server" ControlToValidate="txtCity" CssClass="text-danger"
                                                ErrorMessage="Shipping City" ValidationGroup="vgReg">You must enter a City</asp:RequiredFieldValidator>
				                        </div>
                                         <div class="form-group">
				                        	<asp:DropDownList runat="server" AppendDataBoundItems="true" CssClass="form-control dropdown" id="ddlStates" />
                                            <asp:RequiredFieldValidator ID="rvState" runat="server" ControlToValidate="ddlStates" InitialValue="Select State" CssClass="text-danger"
                                                ErrorMessage="Shipping State" ValidationGroup="vgReg">You must select a State</asp:RequiredFieldValidator>
				                        </div>
                                        <div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="Zip Code..." class="form-password form-control" id="txtZipCode" />
                                            <asp:RequiredFieldValidator ID="rvZip" runat="server" ControlToValidate="txtZipCode" CssClass="text-danger"
                                                ErrorMessage="Shipping Zip Code" ValidationGroup="vgReg">You must enter a Zip Code</asp:RequiredFieldValidator>
				                        </div>
                                        <div class="form-group">
				                        	<asp:Textbox runat="server" type="text" placeholder="Phone Number..." class="form-password form-control" id="txtPhone" />
                                            <asp:RequiredFieldValidator ID="rvPhone" runat="server" ControlToValidate="txtPhone" CssClass="text-danger"
                                                ErrorMessage="Shipping Phone Number" ValidationGroup="vgReg">You must enter a Phone Number</asp:RequiredFieldValidator>
				                        </div>
                                        <div>
                                        <asp:Button runat="server" role="button" class="btn btn-primary float-right mt-5" CommandName="NewUser" 
                                            CausesValidation="true" ValidationGroup="vgReg"  Text="Sign me up!" ID="btnSubmit" OnClick="btnSubmit_Click"></asp:Button>
				                        </div>
				                    </div>
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
