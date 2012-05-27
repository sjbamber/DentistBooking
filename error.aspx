<%@ Page Language="C#" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="error" %>

<form id="form1" runat="server">

<customControl:header ID="Header1" runat="server" heading="Error: A general has occured"/>
    <p>
        <asp:Label ID="errorLabel" runat="server" Text="An error occurred processing the page.  Please try again.  If the problem persists, contact the site administrator."></asp:Label>
    </p>
	<p><a href="index.aspx">Go to the home page</a></p>
<customControl:footer ID="Footer1" runat="server" />
</form>

