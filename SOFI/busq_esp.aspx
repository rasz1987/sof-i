<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="busq_esp.aspx.cs" Inherits="SOFI.busq_esp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel">
            
        <asp:RadioButton ID="rb1" runat="server" AutoPostBack="True"  Text="Cédula" GroupName="busqueda" OnCheckedChanged="rb1_CheckedChanged" />
        <asp:RadioButton ID="rb2" runat="server" AutoPostBack="True"  Text="Fecha" GroupName="busqueda" OnCheckedChanged="rb2_CheckedChanged"  />
        &nbsp;
        <asp:TextBox ID="tb1" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Calcular" OnClick="Button2_Click" Enabled="False"/>
        &nbsp;
        <asp:Label ID="Label2" runat="server" ></asp:Label>
        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="400px">
        <asp:GridView ID="gv_data" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="554px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="codemp" HeaderText="C.I." SortExpression="codemp" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="Nombre y Apellido" ReadOnly="True" SortExpression="codcon" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="fecha" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </asp:Panel>
                
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ATT2007ConnectionString %>" ProviderName="<%$ ConnectionStrings:ATT2007ConnectionString.ProviderName %>" SelectCommand="SELECT codemp, codcon, fecha, monto, acumulado FROM [Reporte de inasistencia]"></asp:SqlDataSource>
    
    
    </div>

</asp:Content>
