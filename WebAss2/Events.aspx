<%@ Page Title="Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebAss2.Events" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>We have retrieved a bunch of events for you.</p>

    <p>
        <asp:GridView ID="gvEvents" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="eventId" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" OnRowDataBound="gvEvents_RowDataBound">
            <Columns>
                <asp:BoundField DataField="eventId" HeaderText="Event ID" InsertVisible="False" ReadOnly="True" SortExpression="eventId" Visible="False" />
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" Visible="False" />
                <asp:BoundField DataField="venue" HeaderText="Venue" SortExpression="venue" />
                <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                <asp:BoundField DataField="numTickets" HeaderText="Ticket Quantity" SortExpression="numTickets" />
                <asp:BoundField DataField="price" HeaderText="Price (RM)" SortExpression="price" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebAss2.Properties.Settings.TicketoConn %>" SelectCommand="SELECT * FROM [Events]"></asp:SqlDataSource>
    </p>
</asp:Content>
