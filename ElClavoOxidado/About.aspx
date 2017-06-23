<%@ Page Title="Quiénes somos" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.vb" Inherits="ElClavoOxidado.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p class="About">Somos una empresa dedicada a la comercialización de artículos de ferretería, que surge hace ya unos años con el objetivo de brindar
    productos de calidad y una atención centrada en las necesidades del cliente. Para esto trabajamos con las mejores marcas como Karcher,
    DeWalt, Bosch y Black&Decker</p>
    <p class="About">El equipo humano de la ferretería tiene una larga experiencia en el rubro, lo que nos permite asesorar a los clientes mejor que nadie
    ante cualquier tipo de duda o consulta que tengan.</p>
    <p class="About">En la actualidad ofrecemos servicios de proveedor de artículos de ferretería para distintas empresas y negocios, como así también 
    productos específicos para consumidores finales.</p>
    <asp:Image ID="Herramientas1" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="Herramientas" ImageUrl="~/Images/herramientas.jpg" Height="300px"  />
    <asp:Image ID="Herramientas2" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="Herramientas" ImageUrl="~/Images/herramientas2.jpg" ImageAlign="Right" Height="300px" />
    <br />
</asp:Content>