﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="CIS3342TermProject.ProductDetail" %>

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
        <nav class="navbar header-top fixed-top navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">LOGO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav animate side-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Products.aspx" title="Cart"><i class="fa fa-home"></i><span class="ttip">Home</span></a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-md-auto d-md-flex">
                    <li class="nav-item">
                        <a class="nav-link" href="Cart.aspx" title="Cart"><i class="fa fa-cart-plus"></i><span class="ttip">Cart</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Welcome.aspx"><i class="fa fa-key"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div style="margin-top: 8%;"></div>

        <div class="row">
            <div class="col-md-3 offset-2">
                <div class="pro-img-details">
                    <asp:Image runat="server" ID="imgProductImage" CssClass="img-thumbnail" />
                </div>
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblName" runat="server" class="pro-d-title">Food Item</asp:Label>
                <asp:Label ID="lblDesc" runat="server" CssClass="text-muted">
                    Praesent ac condimentum felis. Nulla at nisl orci, at dignissim dolor, The best product descriptions address your ideal buyer directly and personally. The best product descriptions address your ideal buyer directly and personally.
                </asp:Label>
                <div class="m-bot15"><strong>Price : </strong><asp:Label ID="lblPrice" runat="server" CssClass="text-muted"></asp:Label></div>
                <div class="form-group">
                    <asp:Textbox runat="server" type="number" ID="txtQuantity" placeholder="Quantity" class="form-control" style="width:30%"/>
                    <asp:RequiredFieldValidator ID="rfQuantity" runat="server" CssClass="text-danger" SetFocusOnError="true" ControlToValidate="txtQuantity">You must enter a quantity</asp:RequiredFieldValidator>
                </div>

                <div class="btn btn-round btn-danger pull-left"><asp:Button  type="button" runat="server" ID="btnAdd" Text="Add to Cart"></asp:Button><i class="fa fa-shopping-cart"></i></div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
