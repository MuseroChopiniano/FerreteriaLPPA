Imports System.Web.Security
Imports Entity
Imports Negocio
Partial Class LogIn
    Inherits System.Web.UI.Page
    Dim vUsuarioNeg As New Negocio.Usuario
    Dim vUsuarioEntity As Entity.Usuario
    'Dim vUsuarioBLL As New UsuarioBLL
    Dim vIntentos As Integer

    Private Sub LogIn_Load(sender As Object, e As EventArgs) Handles Me.Load
    End Sub

    Protected Sub LogInBtn_Click(sender As Object, e As EventArgs) Handles LogInBtn.Click
        'vUsuario = New Usuario(UserName.Text, Password.Text)
        'If vUsuarioBLL.InicioSesion(vUsuario) Then
        vUsuarioEntity = New Entity.Usuario With {.Usuario = UserName.Text}
        Try
            If vUsuarioNeg.Validar_Login(vUsuarioEntity, Password.Text) Then
                ' HttpContext.Current.User = vUsuarioEntity
                'MsgBox(HttpContext.Current.User.Identity.IsAuthenticated)
                FormsAuthentication.SetAuthCookie(UserName.Text, True)
                MsgBox("Usted se ha logueado correctamente")
                MsgBox("Bienvenido " + UserName.Text)
                Response.Redirect("/Default", False)

            Else
                vUsuarioEntity.Cant_Bloqueos += 1
                'vIntentos += 1
            End If
        Catch ex As Exception
            ' MsgBox("Error")
        End Try
    End Sub
End Class
