<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Normal.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="eProject.User" %>
<%@ Register src="UserControl/User/BookList.ascx" tagname="BookList" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:BookList ID="BookList1" runat="server" />
</asp:Content>
