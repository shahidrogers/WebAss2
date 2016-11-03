﻿<%@ Page Title="Admin Panel - Event Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="WebAss2.EventDetailsAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <div class="row">
        <div class="col-md-2">
            <center><h3>Admin Panel</h3></center>
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" class="active"><a href="panel.aspx">View Events</a></li>
                <li role="presentation"><a href="addevent.aspx">Add Event</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>Event Details</h2>

            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="600px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateRows="False" DataKeyNames="eventId" DataSourceID="SqlDataSource1">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="eventId" HeaderText="Event ID" InsertVisible="False" ReadOnly="True" SortExpression="eventId" />
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                    <asp:BoundField DataField="venue" HeaderText="Venue" SortExpression="venue" />
                    <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                    <asp:BoundField DataField="numTickets" HeaderText="Number of tickets" SortExpression="numTickets" />
                    <asp:BoundField DataField="price" HeaderText="Price per ticket (RM)" SortExpression="price" />
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebAss2.Properties.Settings.TicketoConn %>" SelectCommand="SELECT * FROM [Events] WHERE ([eventId] = @eventId)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="eventId" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
