<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAss2.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>To proceed to the admin/clerk panel, please enter your details below.</p>

    <label class="sr-only">Username</label>
    <asp:TextBox runat="server" type="text" ID="tbUsername" class="form-control" placeholder="Username" />
    <label class="sr-only">Password</label>
    <asp:TextBox runat="server" type="Password" id="tbPassword" class="form-control" placeholder="Password" />
    <div class="checkbox">
        <label>
            <asp:CheckBox ID="cbRememberMe" runat="server" /> Remember Me
        </label>
    </div>
    <asp:Button ID="btnSubmit" runat="server" class="btn btn-lg btn-primary" Text="Log in" OnClick="btnSubmit_Click" />

</asp:Content>
