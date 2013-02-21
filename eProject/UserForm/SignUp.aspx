<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Normal.Master" AutoEventWireup="true"
    CodeBehind="SignUp.aspx.cs" Inherits="eProject.UserForm.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../StyleSheet/Account/Login.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style3
        {
            width: 166px;
        }
        .style8
        {
            width: 150px;
        }
        .style9
        {
            width: 155px;
        }
        .style10
        {
            width: 167px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="Panel1" runat="server" Width="100%">
    <asp:Label ID="Label1" runat="server" Text="Free Sign Up" CssClass="Title"></asp:Label>
    <br />
    <br />
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <asp:Label ID="LabelName" runat="server" Text="Full Name"></asp:Label>
            </td>
            <td class="style8">
                <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBoxName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
            </td>
            <td class="style8">
                <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="TextBoxEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="regexEmailValid" runat="server" 
                    ControlToValidate="TextBoxEmail" ErrorMessage="Invalid Email Format" 
                    ForeColor="Red" 
                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="LabelPass" runat="server" Text="Password"></asp:Label>
            </td>
            <td class="style8">
                <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBoxPass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="LabelPass2" runat="server" Text="Retype Password"></asp:Label>
            </td>
            <td class="style8">
                <asp:TextBox ID="TextBoxPass2" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBoxPass2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    
    </asp:Panel>
    <asp:Panel ID="PanelAddress" runat="server">
        <table style="width: 100%;">
            <tr>
                <td class="style10">
                    Address</td>
                <td class="style9">
                    <asp:TextBox ID="TextBoxAddress" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style10">
                    City</td>
                <td class="style9">
                    <asp:TextBox ID="TextBoxCity" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="TextBoxCity" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style10">
                    Country</td>
                <td class="style9">
                    <asp:TextBox ID="TextBoxCountry" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="TextBoxCountry" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style10">
                    Phone</td>
                <td class="style9">
                    <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="TextBoxPhone" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style10">
                    &nbsp;
                    <asp:LinkButton ID="LinkButtonCompleted" runat="server" 
                        onclick="LinkButtonCompleted_Click">Sign Up</asp:LinkButton>
                </td>
                <td class="style9">
                    &nbsp;
                    <asp:Label ID="LabelError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
</asp:Content>
