<%@ Page Language="C#" AutoEventWireup="true" CodeFile="new_user.aspx.cs" Inherits="NewUser" %> <!--Add ClientTarget="downlevel" to disable client side scripting-->
<customControl:header ID="Header1" runat="server" heading="Create Account"/>
<form id="form1" runat="server">
<div>

    <asp:Label ID="notification" runat="server" ForeColor="Red" Visible="False"></asp:Label>

    <table class="formTable">
        <tr>
            <td class="formLabelColumn">
                Title</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxTitle" runat="server" MaxLength="10" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" runat="server" EnableClientScript="false"
                    ControlToValidate="TextBoxTitle" ErrorMessage="Please enter a Title" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Forename(s)</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxFname" runat="server" MaxLength="40" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="forenameRequiredFieldValidator" runat="server" 
                    ControlToValidate="TextBoxFname" ErrorMessage="Please enter a Forename" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Surname</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxSname" runat="server" MaxLength="40" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="surnameRequiredFieldValidator" runat="server" 
                    ControlToValidate="TextBoxSname" ErrorMessage="Please enter a Surname" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Street No.</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxStreetno" runat="server" Rows="6" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation"></td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Address</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxAddress1" runat="server" Rows="30" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="addressRequiredFieldValidator" runat="server" 
                    ControlToValidate="TextBoxAddress1" ErrorMessage="Please enter an Address" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn"></td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxAddress2" runat="server" Rows="30" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation"></td>
        </tr>
        <tr>
            <td class="formLabelColumn"></td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxAddress3" runat="server" Rows="30" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation"></td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Town/City</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxTown" runat="server" Rows="30" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="townRequiredFieldValidator" runat="server" 
                    ControlToValidate="TextBoxTown" ErrorMessage="Please enter a Town or City" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                County</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxCounty" runat="server" Rows="30" Width="180px">Lancashire</asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="countyRequiredFieldValidator" runat="server" 
                    ControlToValidate="TextBoxCounty" ErrorMessage="Please enter a County" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Postcode</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxPostcode" runat="server" Rows="8" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="PostcodeRequiredFieldValidator" runat="server" 
                    ControlToValidate="TextBoxPostcode" ErrorMessage="Please enter a Postcode" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="PostcodeRegExpValidator" runat="server"
                    ControlToValidate="TextBoxPostcode" ErrorMessage="*please enter a valid UK postcode e.g. PR1 1VB" 
                    ValidationExpression="^([a-zA-Z]){1,2}[0-9]{1,2}([a-zA-Z])? *[0-9]{1}([a-zA-Z]){2}$" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Telephone No.</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxTelno" runat="server" Rows="30" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="TelNoRequiredFieldValidator" runat="server" 
                    ControlToValidate="TextBoxTelno" ErrorMessage="Please enter a Telephone No." Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="TelNoRegExpValidator" runat="server"
                    ControlToValidate="TextBoxTelno" ErrorMessage="*please enter a valid telephone no. e.g. 01772 652147"
                    ValidationExpression="^\+?[0-9]* *\(?[0-9]*\)?( *[0-9]+ *)*$" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Email</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxEmail" runat="server" Rows="50" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" 
                    ControlToValidate="TextBoxEmail" ErrorMessage="Please enter a Email address" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server" 
                    Display="Dynamic" ControlToValidate="TextBoxEmail"
                    ErrorMessage="Please enter a vaild email address e.g. mail@domain.com" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Date of Birth</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxDOB" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="DOBRequiredFieldValidator" runat="server" 
                    ControlToValidate="TextBoxDOB" ErrorMessage="Please enter a Date of Birth" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="DOBRangeValidator" runat="server"
                    ErrorMessage="Please enter valid date e.g. 31/12/1985" MaximumValue="31/12/2100"
                    MinimumValue="1/1/1900" Type="Date" ControlToValidate="TextBoxDOB" Display="Dynamic"></asp:RangeValidator>
            </td>
        </tr>
        <asp:panel runat="server" ID="rolePanel" Visible="False">
        <tr>
            <td class="formLabelColumn">
                <asp:label runat="server" text="Role" ID="RoleLabel"></asp:label>
            </td>
            <td class="formInputColumn">
                <asp:DropDownList ID="DropDownListRole" runat="server" Width="180px">
                    <asp:ListItem Selected="True">Customer</asp:ListItem>
                    <asp:ListItem>Staff</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="formValidation">
            </td>
        </tr>
        </asp:panel>
        <tr>
            <td class="formLabelColumn">
                Username</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxUsername" runat="server" MaxLength="30" Width="180px"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="UsernameRequiredFieldValidator" runat="server" 
                    ControlToValidate="TextBoxUsername" ErrorMessage="Please enter a Username" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Password</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxPassword" runat="server" MaxLength="30" Width="180px" 
                    TextMode="Password"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" 
                    ControlToValidate="TextBoxPassword" ErrorMessage="Please enter a Password" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formLabelColumn">
                Confirm Password</td>
            <td class="formInputColumn">
                <asp:TextBox ID="TextBoxConfirmPassword" runat="server" MaxLength="30" 
                    Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="formValidation">
                <asp:RequiredFieldValidator ID="ConfirmPasswordRequiredFieldValidator" runat="server" 
                    ControlToValidate="TextBoxConfirmPassword" 
                    ErrorMessage="Please confirm your Password" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="PasswordCompareValidator" runat="server" 
                    ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirmPassword" 
                    ErrorMessage="Passwords do not match" Display="Dynamic"></asp:CompareValidator>
            </td>
        </tr>
    </table>
    <p>
        <asp:Button ID="Submit" runat="server" onclick="Submit_Click" Text="Submit" 
            CssClass="submit_button" />
        <input id="ClearForm" type="reset" value="Clear Form" class="submit_button" />
    </p>
    
</div>
</form>
<customControl:footer ID="Footer1" runat="server" />