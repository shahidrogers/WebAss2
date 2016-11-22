<%@ Page Title="Event Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="WebAss2.EventDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelSignupSuccessful" runat="server" Visible="false" Width="500px">
        <div class="alert alert-success alert-dismissible" role="alert" Width="500px">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <strong>Sign up successful!</strong> You may now proceed to make a booking below.</strong>
        </div>
        <br />
    </asp:Panel>
    
    <h2><%: Title %></h2>

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
            <asp:BoundField DataField="price" HeaderText="Price per ticket (RM)" SortExpression="price" DataFormatString="{0:0.00}" />
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
    <asp:HiddenField ID="hfRecentSignup" runat="server" value="false" />
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
    <asp:Button ID="btnBookTicket" runat="server" class="btn btn-primary" Text="Book Ticket" OnClick="btnBookTicket_Click" />
    <br /><br />
    <asp:Panel ID="panelLoginContinue" runat="server" Visible="false" Width="500px">
        <div class="alert alert-danger alert-dismissible" role="alert" Width="500px">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <strong>You have to be logged in to book ticket!</strong>
            <br /><br />
            Already registered? <strong><a href="Login.aspx">Log in now</a></strong>
            </strong><hr />
            Haven't registered?<strong> Enter your details below to sign up.<br /><br />
            <asp:TextBox runat="server" type="text" ID="tbFullName" class="form-control" placeholder="Full Name" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate ="tbFullName" ErrorMessage="Please enter a name"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" type="text" ID="tbContactNo" class="form-control" placeholder="Phone Number" />
            <asp:RequiredFieldValidator ID="rfvContactNo" runat="server" ControlToValidate ="tbContactNo" ErrorMessage="Please enter a contact number"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revContactNo" runat="server" ErrorMessage="The number entered is not valid" ControlToValidate="tbContactNo" ValidationExpression="^[0][1]\d{8,9}$" />
            <asp:TextBox runat="server" type="text" ID="tbUsername" class="form-control" placeholder="Username" />
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate ="tbUsername" ErrorMessage="Please enter a username"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" type="Password" ID="tbPassword" class="form-control" placeholder="Password" />
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate ="tbPassword" ErrorMessage="Please enter a password"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btnSignUp" runat="server" class="btn btn-lg btn-primary" Text="Sign up to continue" OnClick="btnSignUp_Click" />
        </div>
        </strong>
    </asp:Panel>
    <asp:Panel ID="panelBookFail" runat="server" Visible="false" Width="500px">
        <div class="alert alert-danger alert-dismissible" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <strong>Unsuccessful!</strong> Booking failed.
        </div>
    </asp:Panel>
     <asp:Panel ID="panelBookingSuccess" runat="server" Visible="false" Width="500px">
        <div class="alert alert-success alert-dismissible" role="alert" Width="500px">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <strong>Success!</strong> Your booking has been made. 
          <br />Your reservation ID is : <strong><asp:Label ID="lblReservationString" runat="server"></asp:Label></strong>
        </div>
    </asp:Panel>
</asp:Content>
