<%@ Page Title="Edit Event" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="updateevent.aspx.cs" Inherits="WebAss2.updateevent" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <div class="row">
        <div class="col-md-2">
            <center><h3>Admin Panel</h3></center>
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="panel.aspx">View Events</a></li>
                <li role="presentation"><a href="#">Add Event</a></li>
            </ul>
            <br />
            <asp:Button class="btn btn-default btn-block" ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" />
        </div>
        <div class="col-md-10">
            <h2>Editing event</h2>
            <p>Please fill in the following event details to proceed.</p>
            <asp:ValidationSummary 
                ID="ValidationSummary" 
                runat="server" 
                HeaderText="Errors found:" 
                ShowMessageBox="false" 
                DisplayMode="BulletList" 
                ShowSummary="true"
                Width="450"
                ForeColor="Red"
                Font-Italic="true"
                />
             <p>
                <div class="row">
                  <div class="col-md-2"><b>Title</b></div>
                  <div class="col-md-10"><asp:TextBox ID="tbTitle" Width="200px" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate ="tbTitle" ErrorMessage="Please enter a name" Text="*Required"></asp:RequiredFieldValidator>
                  </div>
                </div>
            </p>
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Description</b></div>
                  <div class="col-md-10"><asp:TextBox ID="tbDescription" runat="server" Height="100px" Width="200px" TextMode="MultiLine"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate ="tbDescription" ErrorMessage="Please enter a description" Text="*Required"></asp:RequiredFieldValidator>
                  </div>
                </div>
            </p>
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Venue</b></div>
                  <div class="col-md-10"><asp:TextBox ID="tbVenue" Width="200px" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rfvVenue" runat="server" ControlToValidate ="tbVenue" ErrorMessage="Please enter a venue" Text="*Required"></asp:RequiredFieldValidator>
                  </div>
                </div>
            </p>
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Location</b></div>
                  <div class="col-md-10">
                      <%--<asp:TextBox ID="tbLocation" Width="200px" runat="server"></asp:TextBox>--%>
                      <asp:DropDownList ID="ddlLocation" Width="200px" runat="server">
                          <asp:ListItem Text="Kuala Lumpur, Malaysia" Value="Kuala Lumpur, Malaysia"></asp:ListItem>
                          <asp:ListItem Text="Petaling Jaya, Malaysia" Value="Petaling Jaya, Malaysia"></asp:ListItem>
                          <asp:ListItem Text="Shah Alam, Malaysia" Value="Shah Alam, Malaysia"></asp:ListItem>
                      </asp:DropDownList>
                  </div>
                </div>
            </p>
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Date</b></div>
                  <div class="col-md-10">
                      <asp:Calendar ID="calDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="calDate_SelectionChanged">
                          <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                          <NextPrevStyle VerticalAlign="Bottom" />
                          <OtherMonthDayStyle ForeColor="#808080" />
                          <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                          <SelectorStyle BackColor="#CCCCCC" />
                          <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                          <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                          <WeekendDayStyle BackColor="#FFFFCC" />
                      </asp:Calendar>
                       <asp:CustomValidator ID="CVDate" runat="server" OnServerValidate="ValidateDate" Text="Cannot be backdated!" ValidationGroup="group2"></asp:CustomValidator>
                  </div>
                </div>
            </p>
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Ticket Quantity</b></div>
                  <div class="col-md-10"><asp:TextBox ID="tbTicketQty" Width="200px" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfvTicket" runat="server" ControlToValidate ="tbTicketQty" ErrorMessage="Please enter ticket quantity" Text="*Required"></asp:RequiredFieldValidator>
                      <asp:RangeValidator ID="rvTicket" runat="server" ControlToValidate="tbTicketQty" ErrorMessage="Invalid ticket quantity" MinimumValue="1" MaximumValue="2147483647" Type="Integer" Text="*Invalid"></asp:RangeValidator>
                  </div>
                </div>
            </p>
            <p>
                <div class="row">
                  <div class="col-md-2"><b>Ticket Price (RM)</b></div>
                  <div class="col-md-10"><asp:TextBox ID="tbPrice" Width="200px" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate ="tbPrice" ErrorMessage="Please enter ticket price" Text="*Required"></asp:RequiredFieldValidator>
                      <asp:RangeValidator ID="rvPrice" runat="server" ControlToValidate="tbPrice" ErrorMessage="Invalid ticket price" MinimumValue="0.05" MaximumValue ="10000000.00" Type="Currency" Text="*Invalid"></asp:RangeValidator>  
                  </div>
                </div>
            </p>
            <br />
            <asp:Button ID="btnSubmit" runat="server" class="btn btn-lg btn-primary btn-block" Text="Save Changes" OnClick="btnSubmit_Click" />
        </div>
    </div>
  
</asp:Content>
