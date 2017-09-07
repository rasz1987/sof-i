<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="inasis_quincenal.aspx.cs" Inherits="SOFI.inasis_quincenal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel">
        

        <asp:Label ID="Label1" runat="server" Text="Fecha Inicial:"></asp:Label>
&nbsp;<asp:TextBox ID="tb1" runat="server" TextMode="Date"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Fecha Final:"></asp:Label>
        <asp:TextBox ID="tb2" runat="server" TextMode="Date"></asp:TextBox>
&nbsp;
        <asp:Button ID="Button1" runat="server" Height="31px" Text="Calcular Inasistencias para CIDESA" Width="233px" OnClick="Button1_Click" />
        &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Height="31px" Width="233px" Text="Exportar inasistencia a .xls" Enabled="False" />
&nbsp;<asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="400px">
            <asp:GridView ID="gv_data" runat="server" >
            </asp:GridView>
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ATT2007ConnectionString %>" ProviderName="<%$ ConnectionStrings:ATT2007ConnectionString.ProviderName %>" SelectCommand="SELECT [codemp], [codcon], [cantidad], [monto], [acumulado] FROM [REPORTE PARA CIDESA]"></asp:SqlDataSource>
    
    </div>

</asp:Content>
