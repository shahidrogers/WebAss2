<%@ Page Title="Cancel Reservation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CancelReservation.aspx.cs" Inherits="WebAss2.CancelReservation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>Enter your Reservation ID below to continue.</p>
    <br />
    <asp:TextBox ID="tbReservationID" class="form-control input-lg" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnSubmit" runat="server" class="btn btn-lg btn-primary btn-block" Text="Continue &raquo;" OnClick="btnSubmit_Click" />
</asp:Content>
