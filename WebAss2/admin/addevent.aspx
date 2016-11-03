<%@ Page Title="Admin Panel - Add Event" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addevent.aspx.cs" Inherits="WebAss2.addevent" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <div class="row">
        <div class="col-md-2">
            <center><h3>Admin Panel</h3></center>
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="panel.aspx">View Events</a></li>
                <li role="presentation" class="active"><a href="#">Add Event</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>Add a new event</h2>
            <p>Please fill in the following event details to proceed.</p>
            <br />
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Title</b></div>
                  <div class="col-md-10"><asp:TextBox ID="tbTitle" Width="200px" runat="server"></asp:TextBox></div>
                </div>
            </p>
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Description</b></div>
                  <div class="col-md-10"><asp:TextBox ID="tbDescription" runat="server" Height="100px" Width="200px" TextMode="MultiLine"></asp:TextBox></div>
                </div>
            </p>
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Venue</b></div>
                  <div class="col-md-10"><asp:TextBox ID="tbVenue" Width="200px" runat="server"></asp:TextBox></div>
                </div>
            </p>
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Location</b></div>
                  <div class="col-md-10"><asp:TextBox ID="tbLocation" Width="200px" runat="server"></asp:TextBox></div>
                </div>
            </p>
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Date</b></div>
                  <div class="col-md-10">
                      <asp:Calendar ID="calDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                          <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                          <NextPrevStyle VerticalAlign="Bottom" />
                          <OtherMonthDayStyle ForeColor="#808080" />
                          <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                          <SelectorStyle BackColor="#CCCCCC" />
                          <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                          <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                          <WeekendDayStyle BackColor="#FFFFCC" />
                      </asp:Calendar>
                  </div>
                </div>
            </p>
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Ticket Quantity</b></div>
                  <div class="col-md-10"><asp:TextBox ID="tbTicketQty" Width="200px" runat="server"></asp:TextBox></div>
                </div>
            </p>
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Ticket Price (RM)</b></div>
                  <div class="col-md-10"><asp:TextBox ID="tbPrice" Width="200px" runat="server"></asp:TextBox></div>
                </div>
            </p>
            <br />
            <asp:Button ID="btnSubmit" runat="server" class="btn btn-lg btn-primary btn-block" Text="Add Event" OnClick="btnSubmit_Click" />
        </div>
    </div>
  
</asp:Content>
