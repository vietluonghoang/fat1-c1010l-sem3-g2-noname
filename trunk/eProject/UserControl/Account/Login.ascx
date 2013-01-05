<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="eProject.UserControl.Account.Login" %>
<link href="../../StyleSheet/Account/Login.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .style1
    {
        width: 208px;
    }
    .style2
    {
        width: 105px;
    }
</style>
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="ViewLoginForm" runat="server">
        <asp:Login ID="Login1" runat="server" PasswordLabelText="Password" RememberMeText="Remember me"
            TitleText="Sign in" UserNameLabelText="User Name" Height="136px" 
            Width="250px">
            <LayoutTemplate>
                <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                    <tr>
                        <td>
                            <table cellpadding="0" style="width: 250px;">
                                <tr>
                                    <td align="center" class="LoginTitle" colspan="2">
                                        Log in
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style2">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name</asp:Label>
                                    </td>
                                    <td class="style1">
                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                            ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="ctl00$Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style2">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password</asp:Label>
                                    </td>
                                    <td class="style1">
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                            ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ctl00$Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="ctl00$Login1" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <TitleTextStyle CssClass="LoginTitle" />
        </asp:Login>
    </asp:View>
    <asp:View ID="ViewUser" runat="server">
        <div id="UserPaneWrap">
            <asp:LinkButton ID="BtnUserProfile" runat="server"></asp:LinkButton>
            <asp:LinkButton ID="BtnLogout" runat="server">Log out</asp:LinkButton>
        </div>
    </asp:View>
    <asp:View ID="ViewLoginButton" runat="server">
        <asp:LinkButton ID="BtnLogin" runat="server" onclick="BtnLogin_Click">Login</asp:LinkButton>
    </asp:View>
</asp:MultiView>
