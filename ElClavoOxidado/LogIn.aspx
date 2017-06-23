<%@ Page Title="Iniciar sesión" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="LogIn.aspx.vb" Inherits="ElClavoOxidado.LogIn" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2></h2>
    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Si tiene una cuenta inicie sesión con su nombre de usuario</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Nombre de usuario</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="text-danger" ErrorMessage="The user name field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Contraseña</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Mantener sesión iniciada?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" Text="Log in" CssClass="btn btn-default" ID="LogInBtn" OnClientClick="javascript:getHash()" OnClick="LogInBtn_Click" />
                        </div>
                    </div>
                </div>
                <p>
                    En caso de que no posea una cuenta registrese 
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" NavigateUrl="Registrarse.aspx" >aquí</asp:HyperLink>.
                </p>
            </section>
        </div>
    </div>

    <script type="text/javascript" src="Scripts/sha.js"></script>
    <script type="text/javascript">
        function getHash() {
        var hashInput = document.getElementById("<%=Password.ClientID%>");
        var hash = new jsSHA(hashInput.value, "TEXT");
        var hashOutput = document.getElementById("<%=Password.ClientID%>");
        hashOutput.value = hash.getHash("SHA-256", "HEX");
      }</script>
</asp:Content>
