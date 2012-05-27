<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_appointment.aspx.cs" Inherits="manage_appointment" %>

<customControl:header ID="Header1" runat="server" heading="Manage Appointments"/>
<form id="form1" runat="server">
<div>
<p>
    <asp:HyperLink ID="GoBackLink" runat="server" NavigateUrl="~/staff.aspx">Go Back</asp:HyperLink></p>
<p>
    <asp:Label ID="notification" runat="server" Visible="False" ForeColor="Red"></asp:Label>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="appointment_id" 
        DataSourceID="AppointmentSqlDataSource" ForeColor="#333333" GridLines="None" 
        Width="900px" onrowupdated="GridViewAppointmentUpdate" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="appointment_id" HeaderText="Appointment Ref" 
                InsertVisible="False" ReadOnly="True" SortExpression="appointment_id" />
            <asp:TemplateField HeaderText="Date" SortExpression="date">
                <EditItemTemplate>
                    <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
            <asp:BoundField DataField="service" HeaderText="Service" 
                SortExpression="service" />
            <asp:BoundField DataField="confirmed" HeaderText="Confirmed" 
                SortExpression="confirmed" />
            <asp:BoundField DataField="provider_id" HeaderText="Provider ID" 
                SortExpression="provider_id" />
            <asp:BoundField DataField="user_id" HeaderText="User ID" 
                SortExpression="user_id" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#DDDFF7" />
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
    <p>
    
        <asp:SqlDataSource ID="AppointmentSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:sh_dentistConnectionString %>" 
            DeleteCommand="DELETE FROM [appointment] WHERE [appointment_id] = @appointment_id" 
            InsertCommand="INSERT INTO [appointment] ([date], [time], [service], [confirmed], [provider_id], [user_id]) VALUES (@date, @time, @service, @confirmed, @provider_id, @user_id)" 
            SelectCommand="SELECT * FROM [appointment]" 
            UpdateCommand="UPDATE [appointment] SET [date] = @date, [time] = @time, [service] = @service, [confirmed] = @confirmed, [provider_id] = @provider_id, [user_id] = @user_id WHERE [appointment_id] = @appointment_id">
            <DeleteParameters>
                <asp:Parameter Name="appointment_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="date" />
                <asp:Parameter DbType="Time" Name="time" />
                <asp:Parameter Name="service" Type="String" />
                <asp:Parameter Name="confirmed" Type="Byte" />
                <asp:Parameter Name="provider_id" Type="Int32" />
                <asp:Parameter Name="user_id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="date" />
                <asp:Parameter DbType="Time" Name="time" />
                <asp:Parameter Name="service" Type="String" />
                <asp:Parameter Name="confirmed" Type="Byte" />
                <asp:Parameter Name="provider_id" Type="Int32" />
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="appointment_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
</p>
</div>
</form>

<customControl:footer ID="Footer1" runat="server" />
