<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StatisticByCat.ascx.cs" Inherits="eProject.UserControl.Admin.StatisticByCat" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Chart ID="Chart1" runat="server" Width="600px">
    <series>
        <asp:Series Name="SeriesTotalPrice" ChartType="Bar">
        </asp:Series>
    </series>
    <chartareas>
        <asp:ChartArea Name="ChartArea1">
        </asp:ChartArea>
    </chartareas>
</asp:Chart>

<asp:Chart ID="Chart2" runat="server" Palette="SemiTransparent">
    <series>
        <asp:Series Name="SeriesTotal" ChartType="Pie">
        </asp:Series>
    </series>
    <chartareas>
        <asp:ChartArea Name="ChartArea1">
        </asp:ChartArea>
    </chartareas>
</asp:Chart>

<div >
Start Date:
<telerik:RadDatePicker ID="RadDatePicker1" Runat="server">
</telerik:RadDatePicker>

End Date:
<telerik:RadDatePicker ID="RadDatePicker2" Runat="server">
</telerik:RadDatePicker>
    <asp:LinkButton ID="LinkButtonShowChart" runat="server" 
        onclick="LinkButtonShowChart_Click">Show Chart</asp:LinkButton>
</div>



