<%@ Page Title="" Language="C#" MasterPageFile="~/orh.Master" AutoEventWireup="true" CodeBehind="asistencias.aspx.cs" Inherits="SOFI.asistencias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel">
        <div class="panel">
            <h2>Historico Asistencias </h2>
        </div>
        <br />
        <div>
            <asp:Label ID="Label2" runat="server" Text="Cédula de identidad"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" MaxLength="8"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Número de cédula." ControlToValidate="TextBox1" ValidationExpression="\d+"></asp:RegularExpressionValidator>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Búsqueda" OnClick="Button1_Click" />
        </div>
        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="400px">
            <asp:GridView ID="gv_data" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ssn" HeaderText="Cedula" SortExpression="ssn" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle BorderStyle="None" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="Nombre" SortExpression="name" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle BorderStyle="None" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="checktime" HeaderText="Asistencias" SortExpression="checktime" >
                <HeaderStyle HorizontalAlign="Center" />
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
    </div>

</asp:Content>
