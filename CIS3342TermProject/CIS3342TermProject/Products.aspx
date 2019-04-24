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
                        <a class="nav-link" href="#" title="Cart"><i class="fa fa-home"></i><span class="ttip">Home</span></a>
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
        <div style="margin-top:8%;"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="product-grid">
                        <div class="product-image">
                            <a href="#">
                                <img class="pic-1" src="https://www.kitchensanctuary.com/wp-content/uploads/2017/08/Crispy-Chicken-Burger-with-Honey-Mustard-Coleslaw-recipe-square-FS.jpg" />
                            </a>
                            <ul class="social">
                                <li><a href="ProductDetail.aspx" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                                <li><a href="#" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                <li><a href="#" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                            <span class="product-new-label">Sale</span>
                            <span class="product-discount-label">20%</span>
                        </div>
                        <ul class="rating">
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star disable"></li>
                        </ul>
                        <div class="product-content">
                            <h3 class="title"><a href="#">Chicken Burger</a></h3>
                            <div class="price">
                                $16.00
                               
                                <span>$20.00</span>
                            </div>
                            <a class="add-to-cart" href="">+ Add To Cart</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="product-grid">
                        <div class="product-image">
                            <a href="#">
                                <img class="pic-1" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYu3gJ55J7iXOnsQL4r5fBeu7tfD8JQwXAe1TFg_8oWKi-ahokhQ" />
                            </a>
                            <ul class="social">
                                <li><a href="ProductDetail.aspx" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                                <li><a href="#" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                <li><a href="#" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                            <span class="product-new-label">Sale</span>
                            <span class="product-discount-label">50%</span>
                        </div>
                        <ul class="rating">
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                        </ul>
                        <div class="product-content">
                            <h3 class="title"><a href="#">Big Vagetable Pizza</a></h3>
                            <div class="price">
                                $5.00
                       
                                <span>$10.00</span>
                            </div>
                            <a class="add-to-cart" href="">+ Add To Cart</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="product-grid">
                        <div class="product-image">
                            <a href="#">
                                <img class="pic-1" src="https://www.tasteofhome.com/wp-content/uploads/2018/01/Cheeseburger-n-Fries-Casserole_EXPS_13X9BZ19_7899_E10_05_6b.jpg" />
                            </a>
                            <ul class="social">
                                <li><a href="ProductDetail.aspx" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                                <li><a href="#" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                <li><a href="#" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                            <span class="product-new-label">Sale</span>
                            <span class="product-discount-label">50%</span>
                        </div>
                        <ul class="rating">
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                        </ul>
                        <div class="product-content">
                            <h3 class="title"><a href="#">Big Curly Fries</a></h3>
                            <div class="price">
                                $5.00
                       
                                <span>$10.00</span>
                            </div>
                            <a class="add-to-cart" href="">+ Add To Cart</a>
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
