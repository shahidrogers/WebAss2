<%@ Page Title="Cancel Reservation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CancelReservation.aspx.cs" Inherits="WebAss2.CancelReservation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>Enter your Reservation ID below to continue.</p>
    <br />
    <asp:TextBox ID="tbReservationID" class="form-control input-lg" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnSubmit" runat="server" class="btn btn-lg btn-primary btn-block" Text="Continue &raquo;" OnClick="btnSubmit_Click" />
    <br />
    <asp:Panel ID="panelCancelFail" runat="server" Visible="false">
        <div class="alert alert-danger alert-dismissible" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <strong>Unsuccessful!</strong> Cancellation failed.
        </div>
    </asp:Panel>
     <asp:Panel ID="panelCancelSuccess" runat="server" Visible="false">
        <div class="alert alert-success alert-dismissible" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <strong>Success!</strong> Reservation has been cancelled.
        </div>
    </asp:Panel>
</asp:Content>
