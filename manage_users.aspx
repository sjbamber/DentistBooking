<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_users.aspx.cs" Inherits="manage_users" %>

<customControl:header ID="Header1" runat="server" heading="Manage Appointments"/>
<form id="form1" runat="server">
<div>
<p>
    <asp:HyperLink ID="HyperLink" runat="server" NavigateUrl="~/admin.aspx">Go Back</asp:HyperLink></p>
<p>
    <asp:Label ID="notification" runat="server" Visible="False" ForeColor="Red"></asp:Label>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="user_id" DataSourceID="UsersSqlDataSource" 
        ForeColor="#333333" GridLines="None" onrowupdated="GridViewUsersUpdate">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="user_id" HeaderText="User ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="user_id" />
            <asp:TemplateField HeaderText="Title" SortExpression="title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>' 
                        Width="30px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="forenames" HeaderText="Forenames" 
                SortExpression="forenames" />
            <asp:BoundField DataField="surname" HeaderText="Surname" 
                SortExpression="surname" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" />
            <asp:BoundField DataField="username" HeaderText="Username" 
                SortExpression="username" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
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
    
        <asp:SqlDataSource ID="UsersSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:sh_dentistConnectionString %>" 
            DeleteCommand="DELETE FROM [users] WHERE [user_id] = @user_id" 
            InsertCommand="INSERT INTO [users] ([title], [forenames], [surname], [street_no], [address1], [address2], [address3], [town], [county], [postcode], [tel_no], [email], [date_of_birth], [role], [username], [hashed_password], [salt]) VALUES (@title, @forenames, @surname, @street_no, @address1, @address2, @address3, @town, @county, @postcode, @tel_no, @email, @date_of_birth, @role, @username, @hashed_password, @salt)" 
            SelectCommand="SELECT * FROM [users]" 
            UpdateCommand="UPDATE [users] SET [title] = @title, [forenames] = @forenames, [surname] = @surname, [street_no] = @street_no, [address1] = @address1, [address2] = @address2, [address3] = @address3, [town] = @town, [county] = @county, [postcode] = @postcode, [tel_no] = @tel_no, [email] = @email, [date_of_birth] = @date_of_birth, [role] = @role, [username] = @username, [hashed_password] = @hashed_password, [salt] = @salt WHERE [user_id] = @user_id">
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="forenames" Type="String" />
                <asp:Parameter Name="surname" Type="String" />
                <asp:Parameter Name="street_no" Type="String" />
                <asp:Parameter Name="address1" Type="String" />
                <asp:Parameter Name="address2" Type="String" />
                <asp:Parameter Name="address3" Type="String" />
                <asp:Parameter Name="town" Type="String" />
                <asp:Parameter Name="county" Type="String" />
                <asp:Parameter Name="postcode" Type="String" />
                <asp:Parameter Name="tel_no" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter DbType="Date" Name="date_of_birth" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="hashed_password" Type="String" />
                <asp:Parameter Name="salt" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="forenames" Type="String" />
                <asp:Parameter Name="surname" Type="String" />
                <asp:Parameter Name="street_no" Type="String" />
                <asp:Parameter Name="address1" Type="String" />
                <asp:Parameter Name="address2" Type="String" />
                <asp:Parameter Name="address3" Type="String" />
                <asp:Parameter Name="town" Type="String" />
                <asp:Parameter Name="county" Type="String" />
                <asp:Parameter Name="postcode" Type="String" />
                <asp:Parameter Name="tel_no" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter DbType="Date" Name="date_of_birth" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="hashed_password" Type="String" />
                <asp:Parameter Name="salt" Type="String" />
                <asp:Parameter Name="user_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
</p>
</div>
</form>

<customControl:footer ID="Footer1" runat="server" />
