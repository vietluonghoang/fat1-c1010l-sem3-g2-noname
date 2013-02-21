<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="eProject.AdminForm.EditProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 115px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style1">
                Code</td>
            <td>
                <asp:TextBox ID="TextBoxCode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBoxCode" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Category</td>
            <td>
                <asp:DropDownList ID="DropDownListCat" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Name</td>
            <td>
                <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBoxName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Thumbnail</td>
            <td>
                <asp:Image ID="ImageThumb" runat="server" Height="150px" Width="125px" />
                <br />
                <asp:FileUpload ID="FileUploadThumb" runat="server" />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Save Thumbnail</asp:LinkButton>
&nbsp;<asp:Label ID="LabelThumbnail" runat="server" ForeColor="#006600" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Price</td>
            <td>
                <asp:TextBox ID="TextBoxPrice" runat="server" TextMode="Number"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBoxPrice" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Author</td>
            <td>
                <asp:TextBox ID="TextBoxAuthor" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBoxAuthor" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Manufacturer</td>
            <td>
                <asp:TextBox ID="TextBoxManu" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBoxManu" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Quantity</td>
            <td>
                <asp:TextBox ID="TextBoxQuan" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TextBoxQuan" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Description</td>
            <td>
                <asp:TextBox ID="TextBoxDes" runat="server" Height="89px" TextMode="MultiLine" 
                    Width="283px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:CheckBox ID="CheckBoxAvailable" runat="server" Text="Available" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:LinkButton ID="LinkButtonSave" runat="server" 
                    onclick="LinkButtonSave_Click">Save</asp:LinkButton>
            </td>
            <td>
                <asp:Label ID="LabelMessage" runat="server" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
