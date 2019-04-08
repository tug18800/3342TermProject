<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MerchantStoreDescription.aspx.cs" Inherits="desciption.MerchantStoreDescriptionaspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

<!-- Optional theme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-expand-lg navbar-dark bg-dark">
            <h1 class="navbar-brand">Merchant Store Description Page</h1>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link">GET</a></li>
                <li class="nav-item"><a class="nav-link">POST</a></li>
                </ul>
            </div>
        </div>
        <div class="jumbotron text-center">
                <h2>Welcome to --Store-- API Service!</h2>
                <hr class="my-4" />
                <p class="lead">Below is our documentation of how our service works and how you can use it yourself!</p>
            </div>
        <div class="container">
            
            <h1 class="display-4 my-4">GET Methods</h1>
            <div class="row">
                <div class="col">
                    <div class="card">
                        <h1 class="card-title text-center bg-success">GetDepartments()</h1>
                        <div class="card-body">
                            <p>This GET method is used to recieve a DataSet object containing all of the departments within our store! The set will be returned as null if there was a problem retrieving the set, so make sure to check just in case!</p>
                        </div>
                    </div>
                </div>
                 <div class="col">
                    <div class="card">
                        <h1 class="card-title text-center bg-success">GetProducts(int ID)</h1>
                        <div class="card-body">
                            <p>For this method, you will send the route an ID by query string and will receive a DataSet object in return housing all products found within that department!</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row text-center">
                <div class="col">
                    <h1>Example</h1>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><a>Example1</a></li>
                        <li class="list-group-item"><a>Example2</a></li>
                        <li class="list-group-item"><a>Example3</a></li>
                    </ul>
                </div>
            </div>
            <h1 class="display-4 my-4">POST Methods</h1>
            <div class="row">
                <div class="col">
                    <div class="card">
                        <h4 class="card-title text-center bg-warning">RegisterSite(string SiteID, string Description, string APIKey,
                         string Email, Merchant merchant)</h4>
                        <div class="card-body">
                            <p>This GET method is used to recieve a DataSet object containing all of the departments within our store! The set will be returned as null if there was a problem retrieving the set, so make sure to check just in case!</p>
                        </div>
                    </div>
                </div>
                 <div class="col">
                    <div class="card">
                        <h4 class="card-title text-center bg-warning">RecordPurchase(string ProductID, int Quantity, string SiteID, 
                                   string APIKey, Customer customer)</h4>
                        <div class="card-body">
                            <p>For this method, you will send the route an ID by query string and will receive a DataSet object in return housing all products found within that department!</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row text-center">
                <div class="col">
                    <h1>Example</h1>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><a>Example1</a></li>
                        <li class="list-group-item"><a>Example2</a></li>
                        <li class="list-group-item"><a>Example3</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>