<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="CIS3342TermProject.ProductDetail" %>

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
    <asp:Label runat="server" ID="lblAccessDenied" CssClass="text-center text-danger display-4" Visible="false"></asp:Label><br />
    <asp:Label runat="server" ID="lblDeniedPrompt" CssClass="text-center text-danger lead mt-3" Visible="false"></asp:Label><br />
    <a href="../Welcome.aspx" role="button" id="btnLogin" runat="server" visible="false" class="btn btn-primary mt-4 text-center">To Login</a>
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
                </ul>
                <ul class="navbar-nav ml-md-auto d-md-flex">
                    <li class="nav-item">
                        <asp:LinkButton ID="btnCart" runat="server" CssClass="nav-link" PostBackUrl="Cart.aspx" title="Cart"><i class="fa fa-cart-plus"></i><span class="ttip">Cart</span></asp:LinkButton>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Welcome.aspx"><i class="fa fa-key"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container ml-auto mr-auto text-center mt-5"><asp:Label runat="server" ID="lblUserStatus" Visible="false" CssClass="text-danger lead"></asp:Label></div>
        <div style="margin-top: 8%;"></div>
       
        <div class="row mb-5">
            <div class="col-md-3 offset-2">
                <div class="">
                    <asp:Image runat="server" ID="imgProductImage" CssClass="img-thumbnail rptImg" />
                </div>
            </div>
            <div class="col-md-4 text-center">
                <asp:Label ID="lblName" runat="server" class="display-4 mb-5">Food Item</asp:Label>
                <br />
                <asp:Label ID="lblDesc" runat="server" CssClass="lead text-muted mb-5">
                </asp:Label>
                <br />
                <br />
                <div class="m-bot15"><strong>Quantity : </strong><asp:Label ID="lblQuantity" runat="server" CssClass="text-muted"></asp:Label></div> 
                <div class="m-bot15"><strong>Price : </strong><asp:Label ID="lblPrice" runat="server" CssClass="text-muted"></asp:Label></div>
                <div class="form-group text-center ml-auto mr-auto">
                    <asp:Textbox runat="server" type="number" min="0" ID="txtQuantity" placeholder="Quantity" class="form-control ml-auto mr-auto" style="width:30%"/>
                    <asp:RequiredFieldValidator ID="rfQuantity" runat="server" CssClass="text-danger" ValidationGroup="vgOrder" SetFocusOnError="true" ControlToValidate="txtQuantity">You must enter a quantity</asp:RequiredFieldValidator><br />
                </div>

                <asp:LinkButton OnClick="btnAddToCart_Click"  type="button" class="btn btn-round btn-danger" CausesValidation="true" ValidationGroup="vgOrder" 
                    runat="server" ID="btnAddToCart">Add to Cart<i class="fa fa-shopping-cart"></i></asp:LinkButton>
            </div>
        </div>
        <div class="container">
            <div class="fixed-bottom mb-4">
                <asp:Button runat="server" CssClass="btn btn-dark float-left ml-5" Text="Back" ID="btnBack" OnClick="btnBack_Click"/>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
