<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Statistic.aspx.cs" Inherits="eProject.AdminForm.Statistic" %>
<%@ Register src="../UserControl/Admin/StatisticByCat.ascx" tagname="StatisticByCat" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:StatisticByCat ID="StatisticByCat1" runat="server" />
</asp:Content>
