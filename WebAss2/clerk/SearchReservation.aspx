<%@ Page Title="Clerk Panel - Search Reservation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchReservation.aspx.cs" Inherits="WebAss2.SearchReservation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <div class="row">
        <div class="col-md-2">
            <center><h3>Clerk Panel</h3></center>
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="panel.aspx">View Reservations</a></li>
                <li role="presentation" class="active"><a href="#">Search Reservation</a></li>
                <li role="presentation"><a href="ViewEvents.aspx">View Events</a></li>
            </ul>
            <br />
            <asp:Button class="btn btn-default btn-block" ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" />
        </div>
        <div class="col-md-10">
            <h2>Search Reservation</h2>
            <p>Enter a Reservation ID below to continue.</p>
            <br />
            <asp:TextBox ID="tbReservationID" class="form-control input-lg" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnSubmit" runat="server" class="btn btn-lg btn-primary btn-block" Text="Continue &raquo;" OnClick="btnSubmit_Click" />

        </div>
    </div>

</asp:Content>
