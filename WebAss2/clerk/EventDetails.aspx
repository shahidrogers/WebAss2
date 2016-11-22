<%@ Page Title="Clerk Panel - Event Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="WebAss2.EventDetailsClerk" %>

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

            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="600px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateRows="False" DataKeyNames="eventId" DataSourceID="SqlDataSource1" >
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
            Select number of tickets:
            <asp:DropDownList ID="DDLNumTickets" runat="server">
                <asp:ListItem Selected="True">1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
            <asp:CustomValidator ID="CVNumTickets" runat="server" OnServerValidate="ValidateNumTickets" Text="Not enough tickets available!"></asp:CustomValidator>
            <br /> 
            <asp:Button ID="btnEdit" runat="server" class="btn btn-lg btn-primary btn-block" Text="Sell Ticket(s)" OnClick="btnSell_Click" />
            <br />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebAss2.Properties.Settings.TicketoConn %>" 
                SelectCommand="SELECT * FROM [Events] WHERE ([eventId] = @eventId)" UpdateCommand="UPDATE Events SET title = @title, description = @description, location = @location, date = @date, numTickets = @numTickets, price = price, venue = @venue WHERE (eventId = @eventId)">
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
