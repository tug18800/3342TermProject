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
                            <asp:BoundField DataField="Price" HeaderText="Price" />
                            <asp:ImageField DataImageUrlField="ProductURL" HeaderText="Image" ControlStyle-Width="100">
                            </asp:ImageField>
                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
