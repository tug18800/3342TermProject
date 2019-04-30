<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CIS3342TermProject.Cart" %>

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
    <div class="container ml-auto mr-auto text-center mt-5"><asp:Label runat="server" ID="lblUserStatus" Visible="false" CssClass="text-danger lead"></asp:Label></div>

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
                        <asp:LinkButton runat="server" ID="btnLogOut" CssClass="nav-link" OnClick="btnLogOut_Click"><i class="fa fa-key"></i>Logout</asp:LinkButton>
                    </li>
                </ul>
            </div>
        </nav>
        <div style="margin-top: 8%;"></div>
        <div class="container">
            <div class="card shopping-cart">
                <div class="card-header bg-dark text-light">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    Shipping cart
               
                    <a href="Products.aspx" class="btn btn-outline-info btn-sm pull-right">Continiue shopping</a>
                    <div class="clearfix"></div>
                </div>
                <div class="card-body">
                    <!-- PRODUCT -->
                    <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-2 text-center">
                                    <asp:Image runat="server" CssClass="img-responsive" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "item.imageUrl") %>' width="120" height="80" />
                                 </div>
                            <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                                <asp:Label CssClass="h3" runat="server" ID="lblTitle"><%# DataBinder.Eval(Container.DataItem, "item.title") %></asp:Label>
                                <h4>
                                    <small><asp:Label runat="server" ID="lbldesc"><%# DataBinder.Eval(Container.DataItem, "item.description") %></asp:Label></small>
                                </h4>
                            </div>
                            <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                                <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                                    <h6><strong><asp:Label runat="server" ID="lblPrice"><%# DataBinder.Eval(Container.DataItem, "price") %></asp:Label></strong></h6>
                                </div>
                                <div class="col-4 col-sm-4 col-md-4">
                                    <div class="quantity">
                                        <asp:Label runat="server" type="button" id="lblPlus" value="+" class="plus" />
                                        <asp:TextBox runat="server" type="number" ID="txtQuantity" step="1" max="99" min="1" value='<%# DataBinder.Eval(Container.DataItem, "quantity") %>' title="Qty" class="qty" />
                                        <asp:Label type="button" id="lblMinus" value="-" class="minus" runat="server" />
                                    </div>
                                </div>
                                <div class="col-2 col-sm-2 col-md-2 text-right">
                                    <asp:LinkButton runat="server" ID="btnDelete" CommandName="DeleteProduct" CssClass="btn btn-outline-danger btn-xs"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <hr />
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="pull-right">
                        <asp:Button runat="server" ID="btnUpdate" CssClass="btn btn-outline-secondary pull-right" Text="Update shopping cart" OnClick="btnUpdate_Click"></asp:Button>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="pull-right" style="margin: 10px">
                        <asp:LinkButton runat="server" ID="btnCheckout" class="btn btn-success pull-right" OnClick="btnCheckout_Click">Checkout</asp:LinkButton>
                        <div class="pull-right" style="margin: 5px">
                            <asp:Label runat="server" ID="lblTotal">Total Price: </asp:Label>
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


<%--<div class="row">
                                <div class="col-12 col-sm-12 col-md-2 text-center">
                                    <asp:Image runat="server" CssClass="img-responsive" ImageUrl= width="120" height="80" />
                                 </div>
                            <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                                <asp:Label CssClass="h3" runat="server" ID="lblTitle">lol</asp:Label>
                                <h4>
                                    <small><asp:Label runat="server" ID="lbldesc">lol</asp:Label></small>
                                </h4>
                            </div>
                            <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                                <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                                    <h6><strong><asp:Label runat="server" ID="lblPrice">lol</asp:Label></strong></h6>
                                </div>
                                <div class="col-4 col-sm-4 col-md-4">
                                    <div class="quantity">
                                        <asp:Label runat="server" type="button" id="lblx" value="+" class="plus" />
                                        <asp:TextBox runat="server" type="number" step="1" max="99" min="1"  title="Qty" class="qty" />
                                        <asp:Label type="button" id="lbly" value="-" class="minus" runat="server" />
                                    </div>
                                </div>
                                <div class="col-2 col-sm-2 col-md-2 text-right">
                                    <asp:LinkButton runat="server" CssClass="btn btn-outline-danger btn-xs"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <hr />
                    <!-- END PRODUCT -->
                    <!-- PRODUCT -->
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-2 text-center">
                            <img class="img-responsive" src="http://placehold.it/120x80" alt="prewiew" width="120" height="80" />
                        </div>
                        <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                            <h4 class="product-name"><strong>Product Name</strong></h4>
                            <h4>
                                <small>Product description</small>
                            </h4>
                        </div>
                        <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                            <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                                <h6><strong>25.00 <span class="text-muted">x</span></strong></h6>
                            </div>
                            <div class="col-4 col-sm-4 col-md-4">
                                <div class="quantity">
                                    <input type="button" value="+" class="plus" />
                                    <input type="number" step="1" max="99" min="1" value="1" title="Qty" class="qty" size="4" />
                                    <input type="button" value="-" class="minus" />
                                </div>
                            </div>
                            <div class="col-2 col-sm-2 col-md-2 text-right">
                                <button type="button" class="btn btn-outline-danger btn-xs">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <!-- END PRODUCT -->--%>