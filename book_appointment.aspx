<%@ Page Language="C#" AutoEventWireup="true" CodeFile="book_appointment.aspx.cs" Inherits="book_appointment" %>

<customControl:header ID="Header1" runat="server" heading="Appointments"/>
<form id="form1" runat="server">
<div>
	<p class="noMargin">
    <asp:HyperLink ID="HyperLink" runat="server" NavigateUrl="~/appointment.aspx">Go Back</asp:HyperLink>
    </p>
        <asp:Label ID="notification" runat="server" Visible="False" CssClass="notification" 
            ForeColor="Red"></asp:Label>
    <p class="noMargin">
    <table class="formTable">
        <tr>
            <td class="formLabelColumn">
                Date</td>
            <td class="formInputColumn">
                <asp:TextBox ID="DateTextBox" runat="server"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="DateRequiredFieldValidator" runat="server" 
                    ControlToValidate="DateTextBox" Display="Dynamic" 
                    ErrorMessage="A date is required"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="DateRangeValidator" runat="server"
                    ErrorMessage="Please enter valid date e.g. 31/12/2012" MaximumValue="31/12/2200"
                    MinimumValue="1/1/2011" Type="Date" ControlToValidate="DateTextBox" Display="Dynamic"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Time</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TimeTextBox" runat="server"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TimeTextBox" Display="Dynamic" 
                    ErrorMessage="A time is required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="TimeTextBox" Display="Dynamic" 
                    ErrorMessage="Please enter a valid time in the format hh:mm e.g. 14:30" 
                    ValidationExpression="^[0-9]{2}:[0-9]{2}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Service</td>
            <td class="formInputColumn">
                <asp:DropDownList ID="ServiceDropDownList" runat="server">
                    <asp:ListItem>Select a Service...</asp:ListItem>
                    <asp:ListItem>Checkup</asp:ListItem>
                    <asp:ListItem>Treatment</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="ServiceDropDownList" ErrorMessage="Please select a service" 
                    InitialValue="Select a Service..." Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
			<td colspan="2">
						<br />
				        <asp:Button ID="submit" runat="server" onclick="submit_Click" Text="Submit" CssClass="submit_button" />
            </td>
            <td></td>
        </tr>
    </table>
    </p>
</div>
</form>
<customControl:footer ID="Footer1" runat="server" />