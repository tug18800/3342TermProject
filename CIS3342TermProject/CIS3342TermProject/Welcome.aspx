<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="CIS3342TermProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container h-100">
       <div class="row h-100 text-center">
           <div class="col-12">
               <div class="jumbotron">
                   <div class="container">
                       <p class="display-4 text-center">Log In</p>
                       <asp:TextBox runat="server" ID="txtLogUser" Placeholder="Username..." CssClass="form-control w-50 ml-auto mr-auto"></asp:TextBox>
                       <asp:TextBox runat="server" ID="txtLogPass" Placeholder="Password..." CssClass="form-control w-50 mb-5 ml-auto mr-auto"></asp:TextBox>
                       <asp:Button runat="server" CssClass="btn btn-dark mb-5" ID="btnLog" Text="Log In!" />
                       <hr />
                       <p class="display-4 text-center">Sign Up</p>
                       <asp:TextBox runat="server" ID="txtSignUser" Placeholder="Username..." CssClass="form-control w-50 ml-auto mr-auto"></asp:TextBox>
                       <asp:TextBox runat="server" ID="txtSignPass" Placeholder="Password..." CssClass="form-control w-50 mb-5 ml-auto mr-auto"></asp:TextBox>
                       <asp:Button runat="server" CssClass="btn btn-dark mb-5" ID="btnSign" Text="Log In!" />
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
