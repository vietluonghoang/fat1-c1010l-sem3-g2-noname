<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BookList.ascx.cs" Inherits="eProject.UserControl.User.BookList" %>
<asp:GridView ID="GridViewBooks" runat="server" AutoGenerateColumns="False" 
    CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="False" Font-Size="12px"
    Width="100%" onrowdatabound="GridViewBooks_RowDataBound" 
    onrowcommand="GridViewBooks_RowCommand" DataKeyNames="id">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <div class="ProImg">
                    <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl='<%# Eval("Thumbnail") %>'
                        Width="100px" />
                </div>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                Code:
                <asp:Label ID="LabelCode" runat="server" Text='<%# Eval("Code") %>'></asp:Label>
                <br />
                Name:
                <asp:Label ID="LabelName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                <br />
                Author:
                <asp:Label ID="LabelAuth" runat="server" Text='<%# Eval("Author") %>'></asp:Label>
                <br />
                Manufacturer:
                <asp:Label ID="LabelManuf" runat="server" Text='<%# Eval("Manufacturer") %>'></asp:Label>
                <br />
                &nbsp;&nbsp;
                <asp:Label ID="LabelDes" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle Width="270px" />
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                &nbsp;<asp:Label ID="LabelQuant" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                &nbsp;left !<br /> Price:
                <asp:Label ID="LabelPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                &nbsp;$
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButtonAddToCart" ToolTip="Add to cart" CommandName="AddToCart" CommandArgument='<%# DataBinder.Eval(Container,"RowIndex") %>' runat="server">
                    <asp:Image ID="Image2" ImageUrl="~/Resource/icon/shop_cart.png" runat="server" /></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EditRowStyle BackColor="#7C6F57" />
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F8FAFA" />
    <SortedAscendingHeaderStyle BackColor="#246B61" />
    <SortedDescendingCellStyle BackColor="#D4DFE1" />
    <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>
