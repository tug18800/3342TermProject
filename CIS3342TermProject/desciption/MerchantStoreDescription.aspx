<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MerchantStoreDescription.aspx.cs" Inherits="desciption.MerchantStoreDescriptionaspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap-theme.min.css"/>
    </head>
    <body>
        <form id="form1" runat="server">
            <div class="navbar navbar-expand-lg navbar-dark bg-dark">
                <h1 class="navbar-brand">Merchant Store Description Page</h1>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><a href="#GET" class="nav-link">GET</a></li>
                    <li class="nav-item"><a href="#POST" class="nav-link">POST</a></li>
                    </ul>
                </div>
            </div>
            <div class="jumbotron text-center">
                    <h2>Welcome to --Store-- API Service.</h2>
                    <hr class="my-4" />
                    <p class="lead mb-4">Below is our documentation of how our service works and how you can use it yourself.</p>
                    <p class="text-muted">Route: cis-iis2.temple.edu/Spring2019/CIS3342_tug18800/TermProjectWS/api/service/Merchant</p>
                
                </div>
            <div class="container">
                <a name="GET" class="display-4">GET Methods</a>
                <div class="row mt-4">
                    <div class="col h-100">
                        <div class="card">
                            <h1 class="card-title text-center bg-success">GetDepartments</h1>
                            <div class="card-body">
                                <p class="h4 d-inline">Route: </p><p class="h4 text-muted d-inline">api/service/Merchant/GetDepartments</p><br />
                                <p class="h4 d-inline">Parameters: </p><p class="h4 text-muted d-inline">None</p><br />
                                <p class="h4 mt-2">Description: </p><p class="text-muted">This GET method is used to recieve a DataSet object containing all of the departments within our store. The set will be returned as null if there was a problem retrieving the set, so make sure to check just in case.</p>

                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card h-100">
                            <h1 class="card-title text-center bg-success">GetProducts</h1>
                            <div class="card-body">
                                <p class="h4 d-inline">Route: </p><p class="h4 text-muted d-inline">api/service/Merchant/GetProducts</p><br />
                                <p class="h4 d-inline mt-2">Parameters: </p><p class="h4 text-muted d-inline">int ID</p><br />
                                <p class="h4 mt-2">Description: </p><p class="text-muted">For this method, you will send the route an ID by query string and will receive a DataSet object in return housing all products found within that department.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row text-center mt-4">
                    <div class="col">
                        <h1>Examples</h1>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item text-muted">api/service/Merchant/GetDepartments</li>
                            <li class="list-group-item text-muted">api/service/Merchant/GetProducts&id=1</li>
                            <li class="list-group-item text-muted">api/service/Merchant/GetProducts&id=2</li>
                        </ul>
                    </div>
                </div>
                <a name="POST" class="display-4">POST Methods</a>
                <div class="row mt-4">
                    <div class="col">
                        <div class="card h-100">
                            <h4 class="card-title text-center bg-warning">RegisterSite</h4>
                            <div class="card-body">
                                <p class="h4 d-inline">Route: </p><p class="h4 text-muted d-inline">api/service/Merchant/GetDepartments</p><br />
                                <p class="h4 d-inline">Parameters: </p><p class="h4 text-muted d-inline">string SiteID, string Description, string APIKey, string Email, Merchant merchant</p><br />
                                <p class="h4 mt-2">Description: </p><p class="text-muted">When we use your platform to sell our prdocuts, we will use this method to register you into our database. We will store your site id, a description of who you are, a specialized API key for data transmittion secutiry, an email and also more information about you.</p>
                                <p class="text-muted">We'll need the following information from you in the order that you see it:</p>
                                <ul class="list-group list-group-flush text-muted text-center">
                                    <li class="list-group-item">field</li>
                                    <li class="list-group-item">field</li>
                                    <li class="list-group-item">field</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                     <div class="col">
                        <div class="card h-100">
                            <h4 class="card-title text-center bg-warning">RecordPurchase</h4>
                            <div class="card-body">
                                <p class="h4 d-inline">Route: </p><p class="h4 text-muted d-inline">api/service/Merchant/GetDepartments</p><br />
                                <p class="h4 d-inline">Parameters: </p><p class="h4 text-muted d-inline">string ProductID, int Quantity, string SiteID, string APIKey, Customer customer</p><br />
                                <p class="h4 mt-2">Description: </p><p class="text-muted">After a customer from your site buys one of our products, you can send the transaction to this method. We will need the product's ID, the quantity of the product bought, your site ID, the API key we have within our records and the customer's information.</p>
                                <p class="text-muted">We'll need the following customer information in the format that you see it below:</p>
                                <ul class="list-group list-group-flush text-muted text-center">
                                    <li class="list-group-item">CustomerID</li>
                                    <li class="list-group-item">FirstName</li>
                                    <li class="list-group-item">LastName</li>
                                    <li class="list-group-item">Age</li>
                                    <li class="list-group-item">Phone</li>
                                    <li class="list-group-item">Address</li>
                                    <li class="list-group-item">City</li>
                                    <li class="list-group-item">State</li>
                                    <li class="list-group-item">ZIP</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row text-center mt-4">
                    <div class="col">
                        <h1>Examples</h1>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item text-md-center">api/service/Merchant/RecordPurchase&ProductID=2?Quantity=5?SiteID=WxD00?APIKey=RmNY1?customer["CustomerID"]=7?</li>
                            <li class="list-group-item"><a>Example2</a></li>
                            <li class="list-group-item"><a>Example3</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <footer class="position-sticky h-auto">
                <hr class="my-4" />
                <p class="text-center" style="font-size: .8em; color: #a5a5a5">Last Updated: April 8th, 2019</p>
            </footer>
        </form>
    </body>
</html>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
