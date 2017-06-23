<%@ Page Title="Bitácora" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Bitacora.aspx.vb" Inherits="ElClavoOxidado.Bitacora" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Content/bitacora.css" />
    <br />
    <div class="container">
        <asp:GridView ID="GrillaBitacora" runat="server">
            <HeaderStyle BackColor="#BB9241" Height="30px" />
        </asp:GridView>
    </div>
</asp:Content>

