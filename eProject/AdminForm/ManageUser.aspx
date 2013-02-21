<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="eProject.AdminForm.ManageUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridViewUser" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="100%" 
        DataKeyNames="ID" onrowcommand="GridViewUser_RowCommand">
        <Columns>
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:TemplateField HeaderText="Active">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonAvail" CommandName='<%# Bind("Available") %>' CommandArgument='<%# Eval("CustomerID") %>' runat="server" Text='<%# Bind("Available") %>' />

                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
            <asp:BoundField DataField="Address" HeaderText="Address" />
<asp:BoundField DataField="City" HeaderText="City"></asp:BoundField>
            <asp:BoundField DataField="Country" HeaderText="Country" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Left" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
</asp:Content>
