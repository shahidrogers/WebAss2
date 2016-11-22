<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="WebAss2.clerk.Tickets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Thank you for your purchase.</h2>
        <p><strong>Protect this ticket!</strong> Present this ticket for verification at the time of admission to the event.</p>

            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="600px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateRows="False" DataKeyNames="reservationId" DataSourceID="SqlDataSource1">
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebAss2.Properties.Settings.TicketoConn %>" SelectCommand="SELECT Reservations.reservationId, Reservations.reservationTime, Reservations.seatQuantity, Events.EventId, Events.title, Events.location, Events.venue, Events.date, Events.price, Users.userId, Users.name  
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
 
    </div>
    </form>
</body>
</html>
