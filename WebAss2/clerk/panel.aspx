<%@ Page Title="Clerk Panel - View Reservations" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="panel.aspx.cs" Inherits="WebAss2.clerkpanel" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <div class="row">
        <div class="col-md-2">
            <center><h3>Clerk Panel</h3></center>
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" class="active"><a href="#">View Reservations</a></li>
                <li role="presentation"><a href="SearchReservation.aspx">Search Reservation</a></li>
                <li role="presentation"><a href="ViewEvents.aspx">View Events</a></li>
            </ul>
            <br />
            <asp:Button class="btn btn-default btn-block" ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" />
        </div>
        <div class="col-md-10">
            <h2>View Reservations</h2>
            <p>Here are all of your customers' reservations.</p>

            <p>
                <asp:GridView ID="gvReservations" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="reservationId,EventId,userId" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" OnRowDataBound="gvReservations_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="reservationId" HeaderText="Reservation" InsertVisible="False" ReadOnly="True" SortExpression="reservationId" />
                        <asp:BoundField DataField="EventId" HeaderText="Event" SortExpression="EventId" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="title" HeaderText="Event Name" SortExpression="title" />
                        <asp:BoundField DataField="userId" HeaderText="User" InsertVisible="False" ReadOnly="True" SortExpression="userId" />
                        <asp:BoundField DataField="name" HeaderText="User Name" SortExpression="name" />
                        <asp:BoundField DataField="seatQuantity" HeaderText="Number of Tickets" SortExpression="seatQuantity" />
                        <asp:BoundField DataField="reservationTime" HeaderText="Reservation Time" SortExpression="reservationTime" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebAss2.Properties.Settings.TicketoConn %>" SelectCommand="SELECT Reservations.reservationId, Reservations.reservationTime, Reservations.seatQuantity, Events.EventId, Events.title, Users.userId, Users.name  
FROM [Reservations] 
INNER JOIN Events
ON Reservations.eventId=Events.eventId
INNER JOIN Users
ON Reservations.userId=Users.userId"></asp:SqlDataSource>
            </p>
        </div>
    </div>

</asp:Content>
