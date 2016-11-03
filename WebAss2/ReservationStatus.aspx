<%@ Page Title="Reservation Status" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReservationStatus.aspx.cs" Inherits="WebAss2.ReservationStatus" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>Your reservation (ID:
        <asp:Label ID="lblReservationID" runat="server" Text="~"></asp:Label>
        ) status:</p>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    </asp:DetailsView>
</asp:Content>
