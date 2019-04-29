<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="CIS3342TermProject.Products" %>

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
                        <asp:LinkButton runat="server" ID="btnLogOut" CssClass="nav-link" OnClick="btnLogOut_Click"><i class="fa fa-key"></i>Logout</asp:LinkButton>
                    </li>
                </ul>
            </div>
        </nav>
       <div class="container">
           <div class="container w-75">
               <div class="jumbotron">
                    <asp:Label runat="server" CssClass="display-4 ml-auto mr-auto" ID="lblWelcome"></asp:Label>
                </div>
                </div>
           <asp:Repeater ID="rptDepartments_0" runat="server" OnItemCommand="rptDepartments_0_ItemCommand" >
                <ItemTemplate>
                    <div class="row border-top border-bottom pointer bg-dark" >
                        <div class="col-6">
                                <asp:Image runat="server" ID="imgDepartmentImg" CssClass="rptImg py-5"  ImageUrl='<%# DataBinder.Eval(Container.DataItem, "deptImage") %>'/>
                        </div>
                        <div class="col align-self-center">
                            <asp:Label runat="server" CssClass="display-4" Text='<%# DataBinder.Eval(Container.DataItem, "deptName") %>'></asp:Label>
                        </div>
                        <div class="col align-self-center">
                            <asp:Button ID="btnProducts" CssClass="btn btn-dark" Text="Get Products!" runat="server" CommandName="getProduct"/>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

           <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand" Visible="false">
                <ItemTemplate>
                    <div class="row border-top border-bottom pointer bg-dark" >
                        <div class="col-6">
                                <asp:Image runat="server" ID="imgDepartmentImg" CssClass="rptImg" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ImageUrl") %>'/>
                        </div>
                        <div class="ml-auto mr-auto align-self-center">
                                <div class="">
                                <asp:Label runat="server" CssClass="display-4" Text='<%# DataBinder.Eval(Container.DataItem, "Title") %>'></asp:Label>
                            </div>
                            <div class="">
                                <asp:Label runat="server" CssClass="display-4" Text='<%# DataBinder.Eval(Container.DataItem, "Price", "{0:C}") %>'></asp:Label>
                            </div>
                            <div class="row">
                                <div class="col">
                                <asp:Button ID="btnProducts" CssClass="btn btn-dark" Text="Get Products!" runat="server" CommandName="getProductDetail"/>
                            </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
          <div class="container">
            <div class="fixed-bottom mb-4">
                <asp:Button runat="server" CssClass="btn btn-dark float-left ml-5" Text="Back" ID="btnBack" OnClick="btnBack_Click"/>
            </div>
        </div>
       </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
