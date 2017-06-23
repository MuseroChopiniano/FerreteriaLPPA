Imports Negocio
Imports Entity
Public Class Registrarse
    Inherits System.Web.UI.Page

    Dim _usuarioNegocio As New Negocio.Usuario
    Dim _usuarioEntity As Entity.Usuario
    Protected Sub Registrarse(sender As Object, e As EventArgs)

        If Password.Text = ConfirmPassword.Text Then
            _usuarioEntity = New Entity.Usuario
            _usuarioEntity.Usuario = UserName.Text
            _usuarioEntity.Email = Email.Text
            _usuarioEntity.Password = Password.Text
            _usuarioEntity.Familia = 3

            If _usuarioNegocio.Chequear_Usuario(_usuarioEntity.Usuario) = False Then
                ErrorMessage.Text = "El nombre de usuario ingresado ya existe, pruebe otro nombre de usuario"
                ErrorMessage.Visible = True
            Else
                _usuarioNegocio.Alta_Usuario(_usuarioEntity)
                CargarBitacoraRegistrar(_usuarioEntity.Usuario)
                LogIn()
            End If
        End If
    End Sub

    Private Sub LogIn()
        Try
            FormsAuthentication.SetAuthCookie(UserName.Text, False)
            If Roles.IsUserInRole(_usuarioEntity.Usuario, _usuarioEntity.Familia) = False Then
                Roles.AddUserToRole(_usuarioEntity.Usuario, _usuarioEntity.Familia)
            End If
            CargarBitacoraLogIn(_usuarioEntity.Usuario)
            Response.Redirect("/Default", True)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub CargarBitacoraLogIn(usuario As String)
        Dim _bitacoraNeg As New Negocio.Bitacora
        Dim _bitacoraEntity As New Entity.Bitacora

        Dim _listaBitacora = _bitacoraNeg.Obtener_Bitacora()
        If _listaBitacora.Count > 0 Then
            _bitacoraEntity.Id = _listaBitacora.Last.Id + 1
        Else
            _bitacoraEntity.Id = 1
        End If
        _bitacoraEntity.Usuario = usuario
        _bitacoraEntity.Tipo = "Inicio de sesión"
        _bitacoraEntity.Actividad = usuario & " inició sesión"
        _bitacoraNeg.Alta_Bitacora(_bitacoraEntity)
    End Sub

    Private Sub CargarBitacoraRegistrar(usuario As String)
        Dim _bitacoraNeg As New Negocio.Bitacora
        Dim _bitacoraEntity As New Entity.Bitacora

        Dim _listaBitacora = _bitacoraNeg.Obtener_Bitacora()
        If _listaBitacora.Count > 0 Then
            _bitacoraEntity.Id = _listaBitacora.Last.Id + 1
        Else
            _bitacoraEntity.Id = 1
        End If
        _bitacoraEntity.Usuario = usuario
        _bitacoraEntity.Tipo = "Registro"
        _bitacoraEntity.Actividad = "Se ha registrado el usuario " & usuario
        _bitacoraNeg.Alta_Bitacora(_bitacoraEntity)
    End Sub
End Class