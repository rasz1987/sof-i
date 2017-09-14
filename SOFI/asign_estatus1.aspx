<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="asign_estatus1.aspx.cs" Inherits="SOFI.asign_estatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

</asp:Content>
