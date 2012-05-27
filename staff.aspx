<%@ Page Language="C#" AutoEventWireup="true" CodeFile="staff.aspx.cs" Inherits="controls_staff" %>

<customControl:header ID="Header1" runat="server" heading="Staff Panel"/>
<form id="form1" runat="server">
<div>
<h2 class="noMargin">Appointments</h2>
<p class="noMargin"> 
    <asp:hyperlink runat="server" NavigateUrl="~/book_appointment.aspx">Create New Appointment</asp:hyperlink><br />
    <asp:hyperlink runat="server" NavigateUrl="~/manage_appointment.aspx">Manage Existing Appointments</asp:hyperlink>
</p>
</div>
</form>
<customControl:footer ID="Footer1" runat="server" />