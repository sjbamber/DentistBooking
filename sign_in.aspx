<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sign_in.aspx.cs" Inherits="includes_sign_in" %>
<customControl:header ID="Header1" runat="server" heading="Sign In"/>

<form id="form1" runat="server">
<div>
<p><asp:Label ID="notification" runat="server" Visible="False" ForeColor="Red"></asp:Label></p>
<table class="formTable">
    <tr>
        <td class="formLabelColumn">Username</td>
        <td class="formInputColumn">
            <asp:TextBox ID="TextBoxUsername" runat="server" MaxLength="30" Width="180px"></asp:TextBox>
        </td>
        <td class="formValidation">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" 
                ControlToValidate="TextBoxUsername" Display="Dynamic" 
                ErrorMessage="Please Enter a Username"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="formLabelColumn">Password</td>
        <td class="formInputColumn">
            <asp:TextBox ID="TextBoxPassword" runat="server" MaxLength="30" 
                TextMode="Password" Width="180px"></asp:TextBox>
        </td>
        <td class="formValidation">            
            <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" 
                ControlToValidate="TextBoxPassword" Display="Dynamic" 
                ErrorMessage="Please Enter a Password"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td></td>
        <td colspan="2"><br />
            <asp:Button ID="login" runat="server" onclick="Login_Click" Text="Login" 
                CssClass="submit_button" />
        </td>
    </tr>
</table>
<p>&nbsp;</p>

</div>
</form>
    
<customControl:footer ID="Footer1" runat="server" />