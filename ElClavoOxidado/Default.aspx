<%@ Page Title="Inicio" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ElClavoOxidado._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Content/slideshow.css" />
    <script type="text/javascript" src="Scripts/imageslide.js"></script>
    <div class="container buscar">
        <asp:TextBox ID="BuscarTxt" runat="server" BorderStyle="Solid" Width="219px" CssClass="BuscarTxt"></asp:TextBox>
        <asp:Button ID="BuscarBtn" runat="server" Text="Buscar" CssClass="btn btn-default" />
    </div>
    <section id="BannerSection">
        <ul id="galeria">
            <li><img src="Images/nuestramarcas.jpg" border="0" alt="Nuestras marcas" /></li>
            <li><img src="Images/atencionycalidad.jpg" border="0" alt="Atención y calidad" /></li>
            <li><img src="Images/bannerferreteria.jpeg" border="0" alt="Ferreteria" /></li>
        </ul>
    </section>


</asp:Content>

