<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="asign_estatus.aspx.cs" Inherits="SOFI.asign_estatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>UCOCAR | Asignar Estado </title>
    
</head>
  
    <header >
        <div class="logotipo">
            <img src="images/SOFI.jpg" width="1000px"  alt="" />
        </div>
        <nav>
            <ul>
                <li><a href="inasis_quincenal.aspx">Inasistencias Quincenal para Cidesa</a></li>
                <li><a href="inicio.aspx">Inasis. con Nombres</a></li>
                <li><a href="inasis_diaria.aspx">Actualización de Inasistencia</a></li>
                <li><a href="busq_esp.aspx">Búsqueda Específica</a></li>
                <li><a class="active" href="asign_estatus.aspx">Asignar Estado de Empleado</a></li>
                
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
        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="270px">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="SSN"></asp:CheckBoxList>   
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ATT2007ConnectionString %>" ProviderName="<%$ ConnectionStrings:ATT2007ConnectionString.ProviderName %>" SelectCommand="SELECT SSN, NAME FROM USERINFO WHERE (SSN &lt;&gt; '') AND (NOT EXISTS (SELECT ci FROM ESTATUS WHERE (USERINFO.SSN = ci) AND (fec_hasta &gt;= date()))) ORDER BY NAME"></asp:SqlDataSource>
        </asp:Panel>
        <asp:Label ID="Label1" runat="server" Text="Estado del Empleado: "></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="id_falta" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="0">Seleccione</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Fecha Inicial: "></asp:Label>
        &nbsp;<asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
        &nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Ingrese la fecha inicial"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="Fecha Final: "></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Ingrese la fecha final"></asp:RequiredFieldValidator>
        &nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="La fecha inicial no puede ser menor a la Fecha Actual." Type="Date"></asp:RangeValidator>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Descripción del Permiso: " Visible="False"></asp:Label>
        <asp:TextBox ID="tb1" runat="server" Width="650px" Visible="False"></asp:TextBox>
        &nbsp;<br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tb1" ErrorMessage="Seleccione un empleado / Escriba la descripción."></asp:RequiredFieldValidator>
        <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="GUARDAR ESTATUS DEL EMPLEADO" Height="28px" OnClick="Button1_Click" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ATT2007ConnectionString %>" ProviderName="<%$ ConnectionStrings:ATT2007ConnectionString.ProviderName %>" SelectCommand="SELECT id_falta, descripcion FROM FALTA"></asp:SqlDataSource>
                
        
    
    </div>
    </form>
    <footer>
        <p>Desarrollado por la Oficina de Sistemas y Tecnologías de la Información</p>
        <p>Se recomienda el uso del Explorador Chrome o Firefox</p>
    </footer>
</body>
</html>
