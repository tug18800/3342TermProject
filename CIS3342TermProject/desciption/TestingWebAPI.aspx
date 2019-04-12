<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestingWebAPI.aspx.cs" Inherits="desciption.TestingWebAPI" %>

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
        <asp:Label ID="stat" runat="server"></asp:Label>
        <div class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a href="#" class="navbar-brand">Testing Web API</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav mr-auto">
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <label for="ddlDepartments">Departments</label>
                    <asp:DropDownList ID="ddlDepartments" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartments_SelectedIndexChanged">

                    </asp:DropDownList>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="gvProducts" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Desc" HeaderText="Description" />
                            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}"/>
                            <asp:ImageField DataImageUrlField="Url" HeaderText="Image" ControlStyle-Width="100">
                            </asp:ImageField>
                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="container">
            <p class="display-4">Register Site</p>
            <table class="table table-dark">
                <tbody>
                    <tr class="row">
                        <td><h4>Site ID</h4></td><td><asp:TextBox runat="server" ID="txtRegSiteID" ></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>APIKey</h4></td><td><asp:TextBox runat="server" ID="txtRegAPIKey"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>Desc</h4></td><td><asp:TextBox runat="server" ID="txtRegDesc"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>Email</h4></td><td><asp:TextBox runat="server" ID="txtRegEmail"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>Phone</h4></td><td><asp:TextBox runat="server" ID="txtRegPhone"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>Address</h4></td><td><asp:TextBox runat="server" ID="txtRegAddress"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>City</h4></td><td><asp:TextBox runat="server" ID="txtRegCity"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>State</h4></td><td><asp:TextBox runat="server" ID="txtRegState"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>Zip</h4></td><td><asp:TextBox runat="server" ID="txtRegZip"></asp:TextBox></td>
                    </tr>
                </tbody>
            </table>
            <asp:Button runat="server" ID="btnRegSubmit" Text="Register" CssClass="mr-auto" OnClick="btnRegSubmit_Click" />
        </div>
        <div class="container">
            <p class="display-4">Register Site</p>
            <table class="table table-dark">
                <tbody>
                    <tr class="row">
                        <td><h4>Product ID</h4></td><td><asp:TextBox runat="server" ID="txtRecProductID"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>Quantity</h4></td><td><asp:TextBox runat="server" ID="txtRecQuantity"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>Site ID</h4></td><td><asp:TextBox runat="server" ID="txtRecSiteID"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>API Key</h4></td><td><asp:TextBox runat="server" ID="txtRecAPIKey"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>CustomerID</h4></td><td><asp:TextBox runat="server" ID="txtCustomerID"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>First Name</h4></td><td><asp:TextBox runat="server" ID="txtRecFName"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>Last Name</h4></td><td><asp:TextBox runat="server" ID="txtRecLName"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>Age</h4></td><td><asp:TextBox runat="server" ID="txtRecAge"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>Phone</h4></td><td><asp:TextBox runat="server" ID="txtRecPhone"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>Address</h4></td><td><asp:TextBox runat="server" ID="txtRecAddress"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>City</h4></td><td><asp:TextBox runat="server" ID="txtRecCity"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>State</h4></td><td><asp:TextBox runat="server" ID="txtRecState"></asp:TextBox></td>
                    </tr><tr class="row">
                        <td><h4>Zip</h4></td><td><asp:TextBox runat="server" ID="txtRecZip"></asp:TextBox></td>
                    </tr>
                </tbody>
            </table>
            <asp:Button runat="server" ID="btnRecordSubmit" Text="Record" CssClass="mr-auto" OnClick="btnRecordSubmit_Click" />
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
