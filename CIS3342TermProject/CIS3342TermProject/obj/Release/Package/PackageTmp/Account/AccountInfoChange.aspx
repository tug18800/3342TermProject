<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountInfoChange.aspx.cs" Inherits="CIS3342TermProject.AccountInfoChange" %>

<%@ Register Src="~/UCAccountInfoChange.ascx" TagPrefix="uc1" TagName="UCAccountInfoChange" %>


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
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar header-top fixed-top navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">LOGO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav animate side-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#" title="Cart"><i class="fa fa-home"></i><span class="ttip">Home</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="AccountPage.aspx" title="Profile"><i class="fa fa-user"></i><span class="ttip">Account</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AccountOrderInfo.aspx" title="Order"><i class="fa fa-info"></i><span class="ttip">Account Order Info</span></a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="OrderOnlineInfo.aspx" title="Order Online"><i class="fa fa-opencart"></i><span class="ttip">Account Order Online Info</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <div style="margin-top: 8%;"></div>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <h5 class="card-header">Account Info</h5>
                        <div class="card-body">
                            <div id="uc1">
                                <uc1:UCAccountInfoChange runat="server" id="UCAccountInfoChange" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
