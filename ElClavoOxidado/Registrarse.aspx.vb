'Imports BE
'Imports BLL
Imports Entity
Imports Negocio

Partial Class Registrarse
    Inherits System.Web.UI.Page
    Dim vUsuarioNegocio As Negocio.Usuario
    Dim vUsuarioEntity As New Entity.Usuario

    Protected Sub Registrarse(sender As Object, e As EventArgs)
        'TODO: Registración efectiva!
        '      If Password.Text = ConfirmPassword.Text Then
        'vUsuario = New Usuario(UserName.Text, Email.Text, Password.Text, New Familia(3, "Usuario"))
        'vUsuarioBLL.Alta(vUsuario)

        'If vUsuarioBLL.InicioSesion(vUsuario) Then
        'Response.Redirect("Inicio.aspx")
        'End If
        'Else
        'MsgBox("Las contraseñas no coinciden")
        'End If
        MsgBox("Se ha registrado con éxito (? mentira falta programar")
    End Sub

End Class
