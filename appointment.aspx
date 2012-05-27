<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appointment.aspx.cs" Inherits="appointment" %>

<customControl:header ID="Header1" runat="server" heading="Appointments"/>
<form id="form1" runat="server">
<div>
	<asp:Label ID="notification" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <asp:Panel ID="PanelSignedOut" runat="server" Visible="False">
        <p>
            <asp:Label ID="AppointmentLabel1" runat="server" Text="To book an appointment online you need to be signed in.  Alternatively, please call us on: 01995 605707 / 01995 606242"></asp:Label>
        </p>
        <p>
            <asp:HyperLink ID="SignInLink" runat="server" NavigateUrl="~/sign_in.aspx">Sign In</asp:HyperLink><br />
            <asp:HyperLink ID="NewUserLink" runat="server" NavigateUrl="~/new_user.aspx">Create an Account</asp:HyperLink>
        </p>
    </asp:Panel>

    <asp:Panel ID="PanelSignedIn" runat="server" Visible="False">
        <p>
            <asp:Label ID="AppointmentLabel2" runat="server" Text="Choose an option below to manage your appointments."></asp:Label>
        </p>
        <p>
            <asp:HyperLink ID="BookAppointmentLink" runat="server" NavigateUrl="~/book_appointment.aspx">Book a new appointment</asp:HyperLink><br />
            <asp:HyperLink ID="ViewAppointmentLink" runat="server" NavigateUrl="~/view_appointment.aspx">View your appointments</asp:HyperLink>
        </p>
    </asp:Panel>
</div>
</form>
<customControl:footer ID="Footer1" runat="server" />
