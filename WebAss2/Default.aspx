<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAss2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron text-center" style="background-image:url('/img/bg-event-gif.gif');background-size: cover;background-repeat: no-repeat;">
        <h1 style="color:white;font-weight: bold;text-shadow: 4px 4px 2px #000000;">FIND YOUR<br />NEXT EXPERIENCE</h1>
        <br />
        <center>
            <asp:TextBox ID="tbSearch" runat="server" class="form-control" placeholder="Search for... Maroon 5 perhaps?"></asp:TextBox>
            <asp:Button ID="btnSearch" class="btn btn-default" runat="server" Text="Search" />
        </center>


    </div>

    <div>
        <center>
            <p class="lead" ><b>ticketo</b> is a one-stop platform<br />for discovering events & purchasing tickets.</p>
            <p><a href="/Events" style="width:400px;" class="btn btn-danger btn-lg">Discover all events &raquo;</a></p>
        </center>
    </div>

    <%--<div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>--%>

</asp:Content>
