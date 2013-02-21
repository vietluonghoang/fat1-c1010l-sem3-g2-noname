<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ManageCategory.aspx.cs" Inherits="eProject.AdminForm.ManageCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            color: #000000;
            background-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
        BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" 
        onrowcommand="GridView1_RowCommand">
        <Columns>
            <asp:BoundField DataField="Code" HeaderText="Code" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:TemplateField HeaderText="Active">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonAvail" CommandName='<%# Bind("Available") %>' CommandArgument='<%# Eval("ID") %>' runat="server" Text='<%# Bind("Available") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <a href='EditCategory.aspx?catID=<%# Eval("id") %>'><span class="style1">Edit</span></a>
                </ItemTemplate>
            </asp:TemplateField>
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
    
    <br />
    <a href="EditCategory.aspx">Add New</a>
    
</asp:Content>
