<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_appointment.aspx.cs" Inherits="view_appointment" %>

<customControl:header ID="Header1" runat="server" heading="View Appointments"/>
<form id="form1" runat="server">
<div>
<p>
    <asp:HyperLink ID="HyperLink" runat="server" NavigateUrl="~/appointment.aspx">Go Back</asp:HyperLink></p>
<p>
<asp:GridView ID="AppointmentGridView" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="appointment_id" DataSourceID="AppointmentSqlDataSource" 
    EmptyDataText="There were no outstanding appointments found" CellPadding="4" 
        ForeColor="#333333" GridLines="None" AllowPaging="True" 
        AllowSorting="True" Width="900px" ViewStateMode="Disabled">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="appointment_id" HeaderText="Ref." 
            InsertVisible="False" ReadOnly="True" SortExpression="appointment_id" />
        <asp:BoundField DataField="users_name" HeaderText="Name" ReadOnly="True" 
            SortExpression="users_name" />
        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" 
            DataFormatString="{0:d}" />
        <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
        <asp:BoundField DataField="service" HeaderText="Service" 
            SortExpression="service" />
        <asp:TemplateField HeaderText="Confirmed" SortExpression="confirmed">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("confirmed") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("confirmed") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="provider_name" HeaderText="Provider" 
            ReadOnly="True" SortExpression="provider_name" />
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#777BB4" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#777BB4" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#777BB4" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
</p>

<asp:SqlDataSource ID="AppointmentSqlDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:sh_dentistConnectionString %>"  
        SelectCommand="SELECT appointment.appointment_id, users.title + ' ' + users.forenames + ' ' + users.surname AS users_name, appointment.date, appointment.time, appointment.service, appointment.confirmed, provider.title + ' ' + provider.forenames + ' ' + provider.surname AS provider_name FROM appointment INNER JOIN users ON appointment.user_id = users.user_id INNER JOIN provider ON appointment.provider_id = provider.provider_id WHERE (appointment.user_id = @user_id)">
    <SelectParameters>
        <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Object" 
            DefaultValue="0" />
    </SelectParameters>
</asp:SqlDataSource>

</div>
</form>
<customControl:footer ID="Footer1" runat="server" />
