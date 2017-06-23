Imports Negocio
Imports Entity
Public Class LogIn
    Inherits System.Web.UI.Page

    Dim _usuarioNeg As New Negocio.Usuario
    Dim _usuarioEntity As Entity.Usuario
    Dim _bitacoraNeg As New Negocio.Bitacora
    Dim _bitacoraEntity As Entity.Bitacora


    Protected Sub LogInBtn_Click(sender As Object, e As EventArgs) Handles LogInBtn.Click
        _usuarioEntity = New Entity.Usuario With {.Usuario = UserName.Text, .Password = Password.Text}
        Try
            If _usuarioNeg.Validar_Login(_usuarioEntity, _usuarioEntity.Password) Then
                If RememberMe.Checked Then
                    FormsAuthentication.SetAuthCookie(UserName.Text, True)
                Else
                    FormsAuthentication.SetAuthCookie(UserName.Text, False)
                End If
                If Roles.IsUserInRole(_usuarioEntity.Usuario, _usuarioEntity.Familia) = False Then
                    Roles.AddUserToRole(_usuarioEntity.Usuario, _usuarioEntity.Familia)
                End If
                CargarBitacora(_usuarioEntity.Usuario)
                MsgBox("Usted se ha logueado correctamente")
                MsgBox("Bienvenido " + UserName.Text)
                Response.Redirect("/Default", True)

            Else
                _usuarioEntity.Cant_Bloqueos += 1
            End If
        Catch ex As Exception
        End Try
    End Sub

    Private Sub LogIn_PreLoad(sender As Object, e As EventArgs) Handles Me.PreLoad
        Dim isSomeoneLoggedIn As Boolean = HttpContext.Current.User.Identity.IsAuthenticated
        If isSomeoneLoggedIn Then
            Response.Redirect("~/Default", True)
        End If
    End Sub

    Private Sub CargarBitacora(usuario As String)
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
End Class