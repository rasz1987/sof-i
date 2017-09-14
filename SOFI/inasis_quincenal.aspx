﻿<%@ Page Title="" Language="C#" MasterPageFile="~/orh.Master" AutoEventWireup="true" CodeBehind="inasis_quincenal.aspx.cs" Inherits="SOFI.inasis_quincenal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel">
        <div>
            <h2>Descargas txt </h2>
        </div>

        <asp:Label ID="Label1" runat="server" Text="Fecha Inicial:"></asp:Label>
        <asp:TextBox ID="tb1" runat="server" TextMode="Date"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Fecha Final:"></asp:Label>
        <asp:TextBox ID="tb2" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Height="31px" Text="Calcular txt" Width="140px" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Height="31px" Width="140px" Text="Generar .xls" Enabled="False" />
&nbsp;<asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="400px">
            <asp:GridView ID="gv_data" runat="server" >
            </asp:GridView>
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ATT2007ConnectionString %>" ProviderName="<%$ ConnectionStrings:ATT2007ConnectionString.ProviderName %>" SelectCommand="SELECT [codemp], [codcon], [cantidad], [monto], [acumulado] FROM [REPORTE PARA CIDESA]"></asp:SqlDataSource>
    </div>

</asp:Content>
