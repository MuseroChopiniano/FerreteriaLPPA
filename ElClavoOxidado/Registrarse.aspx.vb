Imports BE
Imports BLL
Partial Class Registrarse
    Inherits System.Web.UI.Page
    'Dim vUsuario As Usuario
    'Dim vUsuarioBLL As New UsuarioBLL

    'Protected Sub Registrarse(sender As Object, e As EventArgs)
    '    If Password.Text = ConfirmPassword.Text Then
    '        vUsuario = New Usuario(UserName.Text, Email.Text, Password.Text, New Familia(3, "Usuario"))
    '        vUsuarioBLL.Alta(vUsuario)

    '        If vUsuarioBLL.InicioSesion(vUsuario) Then
    '            Response.Redirect("Inicio.aspx")
    '        End If
    '    Else
    '        MsgBox("Las contraseñas no coinciden")
    '    End If
    'End Sub

End Class
