<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ManageOrder.aspx.cs" Inherits="eProject.AdminForm.ManageOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="100%">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="CreatedOn" HeaderText="Create On" />
            <asp:BoundField DataField="City" HeaderText="City" />
            <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" />
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonAvail" CommandName='<%# Bind("StatusID") %>' CommandArgument='<%# Eval("ID") %>' runat="server" Text='<%# Bind("StatusID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Left" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#999966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
</asp:Content>
