<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestPage.aspx.cs" Inherits="TestDescription.WebForm1" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Testing Web API</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a href="#" class="navbar-brand">Testing Web API</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav mr-auto">
                </ul>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <label for="ddlDepartments">Departments</label>
                    <asp:DropDownList ID="ddlDepartments" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartments_SelectedIndexChanged">

                    </asp:DropDownList>
                </div>
            </div>
            <hr />
            <div class="row">
                <div runat="server" visible="false" id="jumbo" class="jumbotron bg-dark"><div class="row"><div class="col"><asp:Image runat="server" ID="img" style="width: 400px; height: 300px;" CssClass="float-left figure-img" /></div>
                    <div class="col text-center"><asp:Label runat="server" ID="lblDept" CssClass="display-4 text-light"></asp:Label></div></div></div>
                <div class="col-md-12">
                    <asp:GridView ID="gvProducts" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="ProductID" HeaderText="ID" />
                            <asp:BoundField DataField="Title" HeaderText="Title"/>
                            <asp:BoundField DataField="Description" HeaderText="Description"/>
                            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}"/>
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity"/>
                            <asp:ImageField DataImageUrlField="ImageURL" HeaderText="Image" ControlStyle-Width="100"/>
                            <asp:BoundField DataField="DepartmentID" HeaderText="Department" DataFormatString="{0:C}"/>
                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="container">
            <p class="display-4">Register Site</p>
            <table class="table table-dark table-sm">
                <tr><td><h4 class="ml-2">Site ID</h4></td><td><asp:TextBox runat="server" ID="txtRegSiteID" ></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">APIKey</h4></td><td><asp:TextBox runat="server" ID="txtRegAPIKey"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Desc</h4></td><td><asp:TextBox runat="server" ID="txtRegDesc"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Name</h4></td><td><asp:TextBox runat="server" ID="txtRegName"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Email</h4></td><td><asp:TextBox runat="server" ID="txtRegEmail"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Phone</h4></td><td><asp:TextBox runat="server" ID="txtRegPhone"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Address</h4></td><td><asp:TextBox runat="server" ID="txtRegAddress"></asp:TextBox></td> </tr>
                <tr ><td><h4 class="ml-2">City</h4></td><td><asp:TextBox runat="server" ID="txtRegCity"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">State</h4></td><td><asp:TextBox runat="server" ID="txtRegState"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Zip</h4></td><td><asp:TextBox runat="server" ID="txtRegZip"></asp:TextBox></td></tr>
            </table>
            <asp:Label ID="lblRegStat" runat="server" CssClass="float-left bg-primary"></asp:Label>
            <asp:Button runat="server" ID="btnRegSubmit" Text="Register" CssClass="float-right my-4" OnClick="btnRegSubmit_Click" />
        </div>

        <div class="container">
            <p class="display-4 mt-5">Register Site</p>
            <table class="table table-dark table-sm">
                <tr><td><h4 class="ml-2">Product ID</h4></td><td><asp:TextBox runat="server" ID="txtRecProductID"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Quantity</h4></td><td><asp:TextBox runat="server" ID="txtRecQuantity"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Site ID</h4></td><td><asp:TextBox runat="server" ID="txtRecSiteID"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">API Key</h4></td><td><asp:TextBox runat="server" ID="txtRecAPIKey"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">CustomerID</h4></td><td><asp:TextBox runat="server" ID="txtRecCustomerID"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Name</h4></td><td><asp:TextBox runat="server" ID="txtRecName"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Phone</h4></td><td><asp:TextBox runat="server" ID="txtRecPhone"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Email</h4></td><td><asp:TextBox runat="server" ID="txtRecEmail"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Address</h4></td><td><asp:TextBox runat="server" ID="txtRecAddress"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">City</h4></td><td><asp:TextBox runat="server" ID="txtRecCity"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">State</h4></td><td><asp:TextBox runat="server" ID="txtRecState"></asp:TextBox></td></tr>
                <tr><td><h4 class="ml-2">Zip</h4></td><td><asp:TextBox runat="server" ID="txtRecZip"></asp:TextBox></td></tr>
            </table>
            <asp:Label ID="lblRecStat" runat="server" CssClass="float-left bg-primary"></asp:Label>
            <asp:Button runat="server" ID="btnRecordSubmit" Text="Record" CssClass="float-right my-4" OnClick="btnRecordSubmit_Click" />
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
