<%@ Page Title="Admin Panel - View Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="panel.aspx.cs" Inherits="WebAss2.adminpanel" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <div class="row">
        <div class="col-md-2">
            <center><h3>Admin Panel</h3></center>
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" class="active"><a href="#">View Events</a></li>
                <li role="presentation"><a href="addevent.aspx">Add Event</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>View Events</h2>
            <p>Here are all of your events.</p>

            <p>
                <asp:GridView ID="gvEvents" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="eventId" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField DataField="eventId" HeaderText="Event ID" InsertVisible="False" ReadOnly="True" SortExpression="eventId" />
                        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                        <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                        <asp:BoundField DataField="venue" HeaderText="Venue" SortExpression="venue" />
                        <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                        <asp:BoundField DataField="numTickets" HeaderText="Ticket Quantity" SortExpression="numTickets" />
                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
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
        </div>
    </div>
  
</asp:Content>
