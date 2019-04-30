<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAccountInfoChange.ascx.cs" Inherits="CIS3342TermProject.UCAccountInfoChange" %>
<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <label for="txtUserId">User ID:</label>
            <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <label for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <label for="txtAddress">Address:</label>
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="8" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
</div>
<asp:Button ID="btnChange" runat="server" CssClass="btn btn-primary" Text="Save Info" />