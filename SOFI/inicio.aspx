<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="SOFI.inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>UCOCAR | Inasistencia con Nombres </title>
</head>
    <header >
        <div class="logotipo">
            <img src="images/SOFI.jpg" width="1000px"  alt="" />
        </div>
        <nav>
            <ul>
                <li><a href="inasis_quincenal.aspx">Inasistencias Quincenal para Cidesa</a></li>
                <li><a class="active" href="inicio.aspx">Inasis. con Nombres</a></li>
                <li><a href="inasis_diaria.aspx">Actualización de Inasistencia</a></li>
                <li><a href="busq_esp.aspx">Búsqueda Específica</a></li>
                <li><a href="asign_estatus.aspx">Asignar Estado de Empleado</a></li>
            </ul>
        </nav>
    </header>
    <section class="main">
        <!--section class="articles">
            <article>
                
            </article>
        </!--section-->
        <aside>
            
        </aside>
    </section>
<body>
    <form id="form1" runat="server">
    <div class="panel">
        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="400px">
        <asp:GridView ID="gv_data" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="965px" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="codemp" HeaderText="Cedula" SortExpression="codemp" >
                <ItemStyle BorderStyle="None" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="Nombre" SortExpression="name" >
                <ItemStyle BorderStyle="None" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="oficina" HeaderText="Oficina" SortExpression="oficina" >
                <ItemStyle BorderStyle="None" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="fecha" DataFormatString="{0:d}" >
                <ItemStyle BorderStyle="None" HorizontalAlign="Center" />
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
                <asp:Label ID="Label1" runat="server"></asp:Label>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ATT2007ConnectionString %>" ProviderName="<%$ ConnectionStrings:ATT2007ConnectionString.ProviderName %>" SelectCommand="SELECT a.codemp, b.name, c.deptname AS oficina, DATE() AS fecha FROM (inasistencia AS a INNER JOIN userinfo AS b ON a.codemp = b.ssn ) INNER JOIN departments AS c ON b.defaultdeptid=c.deptid WHERE a.fecha=DATE() AND b.ssn IS NOT NULL ORDER BY c.deptname"></asp:SqlDataSource>
    
    
    </div>
    </form>
    <footer>
        <p>Desarrollado por la Oficina de Sistemas y Tecnologías de la Información</p>
        <p>Se recomienda el uso del Explorador Chrome o Firefox</p>
    </footer>
</body>
    
</html>
