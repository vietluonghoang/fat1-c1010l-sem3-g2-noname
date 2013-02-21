<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StatisticCategory.ascx.cs" Inherits="eProject.UserControl.Admin.StatisticCategory" %>
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
<br />
<asp:DropDownList ID="DropDownListCategory" runat="server" 
    DataTextField="Name" DataValueField="ID" AppendDataBoundItems="True">
</asp:DropDownList>

<asp:LinkButton ID="LinkButtonShowChart" runat="server" 
    onclick="LinkButtonShowChart_Click">Show Chart</asp:LinkButton>


