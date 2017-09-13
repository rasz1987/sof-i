<%@ Page Title="" Language="C#" MasterPageFile="~/inicio1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SOFI.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel">
        <div class="panel">
            <h2>acceso </h2>
        </div>
        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="400px">
            <asp:Login ID="Login1" runat="server"></asp:Login>
        </asp:Panel>
    </div>

</asp:Content>
