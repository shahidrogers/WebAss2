﻿<%@ Page Title="Clerk Panel - Event Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="WebAss2.EventDetailsClerk" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <div class="row">
        <div class="col-md-2">
            <center><h3>Clerk Panel</h3></center>
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="panel.aspx">View Reservations</a></li>
                <li role="presentation"><a href="#">Search Reservation</a></li>
                <li role="presentation"><a href="ViewEvents.aspx">View Events</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>Event Details</h2>

            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="600px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateRows="False" DataKeyNames="eventId" DataSourceID="SqlDataSource1" OnItemDeleted="DetailsView1_ItemDeleted">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="eventId" HeaderText="Event ID" InsertVisible="False" ReadOnly="True" SortExpression="eventId" />
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                    <asp:BoundField DataField="venue" HeaderText="Venue" SortExpression="venue" />
                    <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                    <asp:BoundField DataField="numTickets" HeaderText="Number of tickets" SortExpression="numTickets" />
                    <asp:BoundField DataField="price" HeaderText="Price per ticket (RM)" SortExpression="price" DataFormatString="{0:0.00}"/>
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>

            <br />

            <asp:Button ID="btnEdit" runat="server" class="btn btn-lg btn-primary btn-block" Text="Sell Ticket(s)" OnClick="btnSell_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebAss2.Properties.Settings.TicketoConn %>" 
                SelectCommand="SELECT * FROM [Events] WHERE ([eventId] = @eventId)" 
                DeleteCommand="DELETE FROM Events WHERE (eventId = @eventId)" UpdateCommand="UPDATE Events SET title = @title, description = @description, location = @location, date = @date, numTickets = @numTickets, price = price, venue = @venue WHERE (eventId = @eventId)">
                <DeleteParameters>
                    <asp:Parameter Name="eventId" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="eventId" QueryStringField="id" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" />
                    <asp:Parameter Name="description" />
                    <asp:Parameter Name="location" />
                    <asp:Parameter Name="date" />
                    <asp:Parameter Name="numTickets" />
                    <asp:Parameter Name="venue" />
                    <asp:Parameter Name="eventId" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
