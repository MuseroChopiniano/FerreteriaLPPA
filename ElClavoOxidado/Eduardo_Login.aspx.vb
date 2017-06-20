
Partial Class Eduardo_Login
    Inherits System.Web.UI.Page

    Sub Page_load() Handles Me.Load
        Dim usuario As String
        Dim pass As String
        usuario = Request.Form("txtUser")
        pass = Request.Form("txtPass")

        Dim _blUser As New Negocio.Usuario
        Dim _user As New Entity.Usuario
        _user.Usuario = usuario

        Response.Write(usuario)
        Response.Write(pass)
        Response.Write(_user.Usuario)
        Try
            _blUser.Validar_Login(_user, pass)
            Response.Write(_user.Usuario)
            Response.Write(_user.IsValid)
            Response.Write(_user.Bloqueado)
            Response.Write(_user.Cant_Bloqueos)
        Catch ex As Entity.Excepcion_Personalizada
            Response.Write(ex.Descripcion)
        Catch ex2 As Exception
            Response.Write(ex2.Message)
        End Try
    End Sub
End Class
