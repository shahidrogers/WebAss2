<%@ Page Title="Check Reservation Status" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckStatus.aspx.cs" Inherits="WebAss2.CheckStatus" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>Enter your Reservation ID below to continue.</p>
    <br />
    <asp:TextBox ID="tbReservationID" class="form-control input-lg" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnSubmit" runat="server" class="btn btn-lg btn-primary btn-block" Text="Continue &raquo;" OnClick="btnSubmit_Click" />
    <br />
    <asp:Panel ID="panelBookFail" runat="server" Visible="false">
        <div class="alert alert-danger alert-dismissible" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <strong>Unsuccessful!</strong> Booking failed.
        </div>
    </asp:Panel>
     <asp:Panel ID="panelCheckSuccess" runat="server" Visible="false">
        <div class="panel panel-success">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="600px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateRows="False" DataKeyNames="eventId" DataSourceID="SqlDataSource1">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="eventId" HeaderText="Event ID" InsertVisible="False" ReadOnly="True" SortExpression="eventId" />
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                    <asp:BoundField DataField="venue" HeaderText="Venue" SortExpression="venue" />
                    <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                    <asp:BoundField DataField="price" HeaderText="Price per ticket (RM)" SortExpression="price" DataFormatString="{0:0.00}" />
                    <asp:TemplateField HeaderText ="Number of Tickets">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#GetNumTickets() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText ="Payment Status">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#GetPaidStatus() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebAss2.Properties.Settings.TicketoConn %>" 
                SelectCommand="SELECT eventId, title, description, location, date, price, venue FROM Events WHERE 
                (eventId IN (SELECT eventId FROM Reservations WHERE (reservationId = @reservationId)))">
            </asp:SqlDataSource>
            <br />

        </div>
    </asp:Panel>

</asp:Content>
