<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inasis_quincenal.aspx.cs" Inherits="SOFI.inasis_quincenal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>UCOCAR | Inasistencias Quincenal </title>
</head>
    <header >
        <div class="logotipo">
            <img src="images/SOFI.jpg" width="1000px"  alt="" />
        </div>
        <nav>
            <ul>
                <li><a class="active" href="inasis_quincenal.aspx">Inasistencias Quincenal para Cidesa</a></li>
                <li><a href="inicio.aspx">Inasis. con Nombres</a></li>
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
    </form>
</body>
     <footer>
        <p>Desarrollado por la Oficina de Sistemas y Tecnologías de la Información</p>
        <p>Se recomienda el uso del Explorador Chrome o Firefox</p>
    </footer>
</html>
