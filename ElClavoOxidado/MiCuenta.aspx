<%@ Page Title="Mi cuenta" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MiCuenta.aspx.vb" Inherits="ElClavoOxidado.MiCuenta" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%:Title %>.</h2>

     <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%:SuccessMessageText %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="span7">
            <section id="passwordForm">
               <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                    <p>Ha iniciado sesión como <strong><%: User.Identity.Name%></strong>.</p>
                    <div class="form-horizontal">
                        <h4>Reestablezca su contraseña</h4>
                        <hr />
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" ID="ContraseñaLbl" AssociatedControlID="ContraseñaActual" CssClass="col-md-2 control-label">Contraseña actual</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ContraseñaActual" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ContraseñaActual"
                                    CssClass="text-danger" ErrorMessage="Ingrese su contraseña actual."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="ContraseñaNuevaLbl" AssociatedControlID="ContraseñaNueva" CssClass="col-md-2 control-label">Contraseña nueva</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ContraseñaNueva" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ContraseñaNueva"
                                    CssClass="text-danger" ErrorMessage="Ingrese la nueva contraseña."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="ConfirmarContraseñaLbl" AssociatedControlID="ConfirmarContraseña" CssClass="col-md-2 control-label">Vuelva a ingresar la nueva contraseña</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ConfirmarContraseña" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmarContraseña"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Ingrese nuevamente la nueva contraseña."
                                    ValidationGroup="ChangePassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="ContraseñaNueva" ControlToValidate="ConfirmarContraseña"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Las contraseñas no coinciden."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" Text="Cambiar contraseña" OnClick="ChangePassword_Click" CssClass="btn btn-default" ValidationGroup="ChangePassword" ID="CambiarContraseñaBtn" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>
            </section>
         </div>
    </div>
</asp:Content>
