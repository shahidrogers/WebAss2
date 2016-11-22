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

            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="600px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateRows="False" DataKeyNames="reservationId,EventId,userId" DataSourceID="SqlDataSource1">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="reservationId" HeaderText="Reservation" InsertVisible="False" ReadOnly="True" SortExpression="reservationId" />
                    <asp:BoundField DataField="reservationTime" HeaderText="Reservation Time" SortExpression="reservationTime" />
                    <asp:BoundField DataField="userId" HeaderText="User" SortExpression="userId" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="name" HeaderText="User Name" SortExpression="name" />
                    <asp:BoundField DataField="EventId" HeaderText="Event" SortExpression="EventId" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="title" HeaderText="Event Name" SortExpression="title" />
                    <asp:BoundField DataField="seatQuantity" HeaderText="No. of Tickets" SortExpression="seatQuantity" />
                    <asp:BoundField DataField="location" HeaderText="Event Location" SortExpression="location" />
                    <asp:BoundField DataField="venue" HeaderText="Event Venue" SortExpression="venue" />
                    <asp:BoundField DataField="date" HeaderText="Event Date" SortExpression="date" />
                    <asp:BoundField DataField="price" HeaderText="Ticket Price (RM)" SortExpression="price" DataFormatString="{0:0.00}"/>
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebAss2.Properties.Settings.TicketoConn %>" 
                SelectCommand="SELECT Reservations.reservationId, Reservations.reservationTime, Reservations.seatQuantity, Events.EventId, 
                Events.title, Events.location, Events.venue, Events.date, Events.price, Users.userId, Users.name  
                FROM [Reservations] 
                INNER JOIN Events
                ON Reservations.eventId=Events.eventId
                INNER JOIN Users
                ON Reservations.userId=Users.userId
                WHERE (Reservations.reservationId = @reservationId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="reservationId" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="btnConfirmReservation" runat="server" class="btn btn-primary" Text="Confirm Reservation" OnClick="btnConfirmReservation_Click" />
            <asp:Button ID="btnCancelReservation" runat="server" class="btn btn-danger" Text="Cancel Reservation" OnClick="btnCancelReservation_Click" />
            <br />
             <asp:Panel ID="panelCancelFail" runat="server" Visible="false">
                <div class="alert alert-danger alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <strong>Unsuccessful!</strong> Cancellation failed.
                </div>
            </asp:Panel>
             <asp:Panel ID="panelConfirmSuccess" runat="server" Visible="false">
                <div class="alert alert-success alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <strong>Success!</strong> Sale has been recorded.
                  <br />
                  <a ID="linkTicket" href="#" runat="server" class="alert-link" target="_blank">Click here to print the ticket.</a>
                </div>
            </asp:Panel>
            <asp:Panel ID="panelConfirmFail" runat="server" Visible="false">
                <div class="alert alert-danger alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <strong>Unsuccessful!</strong> Sale could not be recorded.
                </div>
            </asp:Panel>
        </div>
    </div>
    
</asp:Content>
