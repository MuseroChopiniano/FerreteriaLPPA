Imports BE
Imports BLL
Partial Class LogIn
    Inherits System.Web.UI.Page
    'Dim vUsuario As Usuario
    'Dim vUsuarioBLL As New UsuarioBLL
    'Dim vIntentos As Integer
    'Private Sub LogIn_Load(sender As Object, e As EventArgs) Handles Me.Load
    'End Sub

    'Protected Sub LogInBtn_Click(sender As Object, e As EventArgs) Handles LogInBtn.Click
    '    vUsuario = New Usuario(UserName.Text, Password.Text)
    '    If vUsuarioBLL.InicioSesion(vUsuario) Then
    '        HttpContext.Current.User = vUsuario
    '        MsgBox(HttpContext.Current.User.Identity.IsAuthenticated)
    '        Response.Redirect("Inicio.aspx")
    '    Else
    '        vIntentos += 1
    '    End If
    'End Sub
End Class
