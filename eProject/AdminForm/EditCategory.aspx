<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="EditCategory.aspx.cs" Inherits="eProject.AdminForm.EditCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Code:
    <asp:TextBox ID="TextBoxCode" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBoxCode" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    Name
    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="TextBoxName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    Description<br />
&nbsp;<asp:TextBox ID="TextBoxDes" runat="server" Rows="4" TextMode="MultiLine" 
        Width="267px"></asp:TextBox>
    <br />
    <br />
    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
        oncheckedchanged="CheckBox1_CheckedChanged" Text="Parent" />
    <br />
    <br />
    Parent
    <asp:DropDownList ID="DropDownListParent" runat="server" DataValueField="ID" DataTextField="Code" >
    </asp:DropDownList>
    <br />
    <br />
    Status
    <asp:DropDownList ID="DropDownListStatus" runat="server">
        <asp:ListItem>True</asp:ListItem>
        <asp:ListItem>False</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:LinkButton ID="LinkButtonSave" runat="server" 
        onclick="LinkButtonSave_Click">Save</asp:LinkButton>
&nbsp;<br />
    <br />
    <asp:Label ID="LabelMessage" runat="server"></asp:Label>
&nbsp;
</asp:Content>
