<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inasis_diaria.aspx.cs" Inherits="SOFI.inasis_diaria" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>UCOCAR | Act. Inasis. </title>
    
</head>
  
    <header >
        <div class="logotipo">
            <img src="images/SOFI.jpg" width="1000px"  alt="" />
        </div>
        <nav>
            <ul>
                <li><a href="inasis_quincenal.aspx">Inasistencias Quincenal para Cidesa</a></li>
                <li><a href="inicio.aspx">Inasis. con Nombres</a></li>
                <li><a class="active" href="inasis_diaria.aspx">Actualización de Inasistencia</a></li>
                <li><a href="busq_esp.aspx">Búsqueda Específica</a></li>
                <li><a href="asign_estatus.aspx">Asignar Estado de Empleado</a></li>
            </ul>
        </nav>
    </header>
    <!--section class="main">
        <section class="articles">
            <article>
                
            </article>
        </section>
        <aside>
            
        </aside>
    </section-->
    
<body>
    <form id="form1" runat="server">
    <div class="panel">
            
    
        
        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="400px">
        <asp:GridView ID="gv_data" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="1173px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="codemp" HeaderText="C.I." SortExpression="codemp" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="codcon" HeaderText="Código Concepto" ReadOnly="True" SortExpression="codcon" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="fecha" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="monto" HeaderText="Monto" ReadOnly="True" SortExpression="monto" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="acumulado" HeaderText="Acumulado" ReadOnly="True" SortExpression="acumulado" >
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
                <asp:Button ID="Button1" runat="server" Text="Actualizar Inasistencia" Width="177px" OnClick="Button1_Click" Enabled="False"  />
                <asp:Label ID="Label1" runat="server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ATT2007ConnectionString %>" ProviderName="<%$ ConnectionStrings:ATT2007ConnectionString.ProviderName %>" SelectCommand="SELECT codemp, codcon, fecha, monto, acumulado FROM [reporte inasis mejorada]"></asp:SqlDataSource>
    
    
    </div>
    <footer>
        <p>Desarrollado por la Oficina de Sistemas y Tecnologías de la Información</p>
        <p>Se recomienda el uso del Explorador Chrome o Firefox </p>
        <p>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Manual de Usuario</asp:LinkButton>
        </p>
    </footer>
    </form>
    </body>
    

    
</html>
