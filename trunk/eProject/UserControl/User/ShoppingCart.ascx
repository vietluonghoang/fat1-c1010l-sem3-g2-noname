<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.ascx.cs"
    Inherits="eProject.UserControl.User.ShoppingCart" %>
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="ViewOut" runat="server">
        Login to use shopping cart.
    </asp:View>
    <asp:View ID="ViewIn" runat="server">
        <asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
            BorderStyle="None" Width="300px" DataKeyNames="id" OnRowCommand="GridViewCart_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="Produce">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quatity">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                    <FooterTemplate>
                        Total:
                        <asp:Label ID="LabelTotalPrice" runat="server" Text="Label"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                        &nbsp;$
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DeleteFromCart" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex")%>'>
                            <asp:Image ID="Image1" ImageUrl="~/Resource/icon/round_delete.png" runat="server" /></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                Your cart is empty
            </EmptyDataTemplate>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" HorizontalAlign="Left" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelTotalPrice" runat="server" Text="Label" Font-Size="16px"></asp:Label>
        <div style="text-align:right"> 
            <asp:LinkButton ID="LinkButtonSubmitCart" runat="server" 
                onclick="LinkButtonSubmitCart_Click">
                <asp:Image ToolTip="Submit" ID="Image2" ImageUrl="~/Resource/icon/checkbox_checked.png" runat="server" /></asp:LinkButton>
            &nbsp;
            <asp:LinkButton ID="LinkButtonClearCart" runat="server" OnClick="LinkButtonClearCart_Click">
                <asp:Image ToolTip="Clear" ID="Image3" ImageUrl="~/Resource/icon/trash.png" runat="server" /></asp:LinkButton>
        </div>
    </asp:View>
</asp:MultiView>