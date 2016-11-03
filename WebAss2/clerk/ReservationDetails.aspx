<%@ Page Title="Clerk Panel - Reservation Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReservationDetails.aspx.cs" Inherits="WebAss2.ReservationDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <div class="row">
        <div class="col-md-2">
            <center><h3>Clerk Panel</h3></center>
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="panel.aspx">View Reservations</a></li>
                <li role="presentation"><a href="SearchReservation.aspx">Search Reservation</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>Reservation Details</h2>

            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="600px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateRows="False" DataKeyNames="reservationId" DataSourceID="SqlDataSource1">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="reservationId" HeaderText="Reservation ID" InsertVisible="False" ReadOnly="True" SortExpression="reservationId" />
                    <asp:BoundField DataField="eventId" HeaderText="Event ID" SortExpression="eventId" />
                    <asp:BoundField DataField="userId" HeaderText="User ID" SortExpression="userId" />
                    <asp:BoundField DataField="reservationTime" HeaderText="Reservation Time" SortExpression="reservationTime" />
                    <asp:BoundField DataField="seatQuantity" HeaderText="Quantity of Seat(s)" SortExpression="seatQuantity" />
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebAss2.Properties.Settings.TicketoConn %>" SelectCommand="SELECT * FROM [Reservations] WHERE ([reservationId] = @reservationId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="reservationId" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="btnConfirmReservation" runat="server" class="btn btn-primary" Text="Confirm Reservation" OnClick="btnConfirmReservation_Click" />
            <asp:Button ID="btnCancelReservation" runat="server" class="btn btn-danger" Text="Cancel Reservation" OnClick="btnCancelReservation_Click" />
        </div>
    </div>
    
</asp:Content>
