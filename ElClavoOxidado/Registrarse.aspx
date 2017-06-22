﻿<%@ Page Title="Registrarse" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Registrarse.aspx.vb" Inherits="Registrarse" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Crear cuenta</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Nombre de Usuario (*)</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="Ingrese un nombre de usuario." />--%>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email (*)</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" />
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="Ingrese un email correcto." />--%>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Contraseña (*)</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    <%--CssClass="text-danger" ErrorMessage="Ingrese una contraseña." />--%>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Repita la contraseña (*)</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"--%>
                    <%--CssClass="text-danger" Display="Dynamic" ErrorMessage="Ingrese nuevamente la contraseña." />--%>
                <%--<asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Las contraseñas no coinciden." />--%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
<<<<<<< HEAD
                <asp:Button runat="server" Text="Registrarse" CssClass="btn btn-default" OnClientClick="javascript:getHash()" OnClick="Registrarse" ID="RegistrarseBtn" />
=======
                <asp:Button runat="server" Text="Registrarse" CssClass="btn btn-default" ID="RegistrarseBtn" />
>>>>>>> origin/master
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="Scripts/sha.js"></script>
    <script type="text/javascript">
        function getHash() {
        var hashInput = document.getElementById("<%=Password.ClientID%>");
        var hash = new jsSHA(hashInput.value, "TEXT");
        var hashOutput = document.getElementById("<%=Password.ClientID%>");
        hashOutput.value = hash.getHash("SHA-256", "HEX");
        alert(hashOutput.value);
      }</script>
</asp:Content>
