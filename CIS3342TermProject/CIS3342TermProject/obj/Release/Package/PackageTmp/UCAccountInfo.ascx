<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAccountInfo.ascx.cs" Inherits="CIS3342TermProject.UCAccountInfo" %>
<div class="jumbotron bg-dark text-light">
    <div class="row">
        <div class="col"><label class="h2 text-right">Username: </label><asp:Label ID="lblUseranme" runat="server" CssClass="h3 text-muted ml-5"></asp:Label><asp:TextBox runat="server" ID="txtUseranme" CssClass="form-contorl" Visible="false"></asp:TextBox></div>
        
    </div>
    <div class="row">
        <div class="col"><label class="h2 text-right">Name: </label><asp:Label ID="lblName" runat="server" CssClass="h3 text-muted ml-5"></asp:Label><asp:TextBox runat="server" ID="txtName" CssClass="form-contorl" Visible="false"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col"><label class="h2 text-right">Address: </label><asp:Label ID="lblAddress" runat="server" CssClass="h3 text-muted ml-5"></asp:Label><asp:TextBox runat="server" ID="txtAddress" CssClass="form-contorl" Visible="false"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col"><label class="h2 text-right">City: </label><asp:Label ID="lblCity" runat="server" CssClass="h3 text-muted ml-5"></asp:Label><asp:TextBox runat="server" ID="txtCity" CssClass="form-contorl" Visible="false"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col"><label class="h2 text-right">State: </label><asp:Label ID="lblState" runat="server" CssClass="h3 text-muted ml-5"></asp:Label><asp:TextBox runat="server" ID="txtState" CssClass="form-contorl" Visible="false"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col"><label class="h2 text-right">Zip: </label><asp:Label ID="lblZipCode" runat="server" CssClass="h3 text-muted ml-5"></asp:Label><asp:TextBox runat="server" ID="txtZipCode" CssClass="form-contorl" Visible="false"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col"><label class="h2 text-right">Email: </label><asp:Label ID="lblEmail" runat="server" CssClass="h3 text-muted ml-5"></asp:Label><asp:TextBox runat="server" ID="txtEmail" CssClass="form-contorl" Visible="false"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col"><label class="h2 text-right">Phone: </label><asp:Label ID="lblPhone" runat="server" CssClass="h3 text-muted ml-5"></asp:Label><asp:TextBox runat="server" ID="txtPhone" CssClass="form-contorl" Visible="false"></asp:TextBox></div>
    </div>
 </div>
<asp:Button id="btnChange" runat="server" OnClick="btnChange_Click" class="btn btn-primary float-right" Text="Change Info"></asp:Button>
<asp:Button id="btnSave" runat="server" OnClick="btnSave_Click" class="btn btn-primary float-right" Text="Save Info" Visible="false"></asp:Button>