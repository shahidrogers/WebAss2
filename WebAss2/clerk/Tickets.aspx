<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="WebAss2.clerk.Tickets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
 
    </div>
    </form>
</body>
</html>
