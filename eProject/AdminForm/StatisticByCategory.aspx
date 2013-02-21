<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="StatisticByCategory.aspx.cs" Inherits="eProject.AdminForm.StatisticByCategory" %>
<%@ Register src="../UserControl/Admin/StatisticCategory.ascx" tagname="StatisticCategory" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:StatisticCategory ID="StatisticCategory1" runat="server" />
</asp:Content>
