<%@ Page Title="Contacto" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="ElClavoOxidado.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p>Puedes comunicarte con nosotros por teléfono y vía email o si lo prefiere por medio del siguiente formulario</p>
    <br />
    <br />
    <div class="form-left">
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="NombreYApellido" CssClass="col-md-2 control-label">Nombre completo(*)</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="NombreYApellido" CssClass="form-control" Width="350px" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="NombreYApellido"
                                CssClass="text-danger" ErrorMessage="Ingrese su nombre" />
                        </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email(*)</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" Width="350px" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" 
                        CssClass="text-danger" ErrorMessage="Ingrese su dirección de email" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Telefono" CssClass="col-md-2 control-label">Telefono</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Telefono" CssClass="form-control" Width="350px" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Comentarios" CssClass="col-md-2 control-label">Comentarios</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Comentarios" CssClass="form-control" TextMode="MultiLine" Width="350px" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" OnClick="EnviarComentario" Text="Enviar comentario" CssClass="btn btn-default" />
                </div>
            </div>
        </div>
    </div>
    
    <div class="form-right">
        <asp:Image ID="ContactoImg" runat="server" ImageUrl="~/Images/contacto.jpg" Width="450px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
    </div>
    
    <address>
        San Juan 951<br />
        Capital Federal, Buenos Aires, Argentina<br />
        <abbr title="Phone">Teléfono:</abbr> 425.555.0100
    </address>
    <address>
        <strong>El clavo oxidado:</strong> 
        <a href="mailto:ElClavoOxidado@gmail.com">ElClavoOxidado@gmail.com</a><br />
        <strong>Facundo Tripelhorn:</strong> 
        <a href="mailto:Facundo.Tripelhorn@gmail.com">Facundo.Tripelhorn@gmail.com</a>
    </address>
</asp:Content>
