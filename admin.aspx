<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="controls_admin" %>
<customControl:header ID="Header1" runat="server" heading="Administrator Panel"/>
<form id="form1" runat="server">
<div>
<h2 class="noMargin">Users</h2>
<p class="noMargin">
    <asp:hyperlink runat="server" NavigateUrl="~/new_user.aspx">Create New User</asp:hyperlink><br />
    <asp:hyperlink runat="server" NavigateUrl="~/manage_users.aspx">Manage Existing Users</asp:hyperlink> 
</p>
<br />
<h2 class="noMargin">Appointments</h2>
<p class="noMargin"> 
    <asp:hyperlink runat="server" NavigateUrl="~/book_appointment.aspx">Create New Appointment</asp:hyperlink><br />
    <asp:hyperlink runat="server" NavigateUrl="~/manage_appointment.aspx">Manage Existing Appointments</asp:hyperlink>
</p>
</div>
</form>
<customControl:footer ID="Footer1" runat="server" />
