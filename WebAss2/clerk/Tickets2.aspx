<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tickets2.aspx.cs" Inherits="WebAss2.clerk.Tickets2" %>

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

            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="600px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateRows="False" DataKeyNames="EventId" DataSourceID="SqlDataSource1">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="EventId" HeaderText="Event" InsertVisible="False" ReadOnly="True" SortExpression="EventId" />
                    <asp:BoundField DataField="title" HeaderText="Event Name" SortExpression="title" />
                    <asp:BoundField DataField="location" HeaderText="Event Location" SortExpression="location" />
                    <asp:BoundField DataField="venue" HeaderText="Event Venue" SortExpression="venue" />
                    <asp:BoundField DataField="date" HeaderText="Event Date" SortExpression="date" />
                    <asp:BoundField DataField="price" HeaderText="Ticket Price (RM)" SortExpression="price" />
                    <asp:BoundField DataField="salesDate" HeaderText="Sales Date" SortExpression="salesDate" />
                    <asp:BoundField DataField="seatQuantity" HeaderText="No. of Seats" SortExpression="seatQuantity" />
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebAss2.Properties.Settings.TicketoConn %>" SelectCommand="SELECT Events.EventId, Events.title, Events.location, Events.venue, Events.date, Events.price, Sales.salesDate, Sales.seatQuantity
FROM [Sales]
INNER JOIN Events
ON Sales.eventId=Events.eventId
WHERE (Sales.salesId = @salesId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="salesId" QueryStringField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
 
    </div>
    </form>
</body>
</html>
