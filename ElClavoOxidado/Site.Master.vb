Imports Negocio
Imports Entity
Public Class SiteMaster
    Inherits MasterPage
    Private Const AntiXsrfTokenKey As String = "__AntiXsrfToken"
    Private Const AntiXsrfUserNameKey As String = "__AntiXsrfUserName"
    Private _antiXsrfTokenValue As String

    Protected Sub Page_Init(sender As Object, e As EventArgs)
        ' El código siguiente ayuda a proteger frente a ataques XSRF
        Dim requestCookie = Request.Cookies(AntiXsrfTokenKey)
        Dim requestCookieGuidValue As Guid
        If requestCookie IsNot Nothing AndAlso Guid.TryParse(requestCookie.Value, requestCookieGuidValue) Then
            ' Utilizar el token Anti-XSRF de la cookie
            _antiXsrfTokenValue = requestCookie.Value
            Page.ViewStateUserKey = _antiXsrfTokenValue
        Else
            ' Generar un nuevo token Anti-XSRF y guardarlo en la cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N")
            Page.ViewStateUserKey = _antiXsrfTokenValue

            Dim responseCookie = New HttpCookie(AntiXsrfTokenKey) With { _
                 .HttpOnly = True, _
                 .Value = _antiXsrfTokenValue _
            }
            If FormsAuthentication.RequireSSL AndAlso Request.IsSecureConnection Then
                responseCookie.Secure = True
            End If
            Response.Cookies.[Set](responseCookie)
        End If

        AddHandler Page.PreLoad, AddressOf master_Page_PreLoad
    End Sub

    Protected Sub master_Page_PreLoad(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            ' Establecer token Anti-XSRF
            ViewState(AntiXsrfTokenKey) = Page.ViewStateUserKey
            ViewState(AntiXsrfUserNameKey) = If(Context.User.Identity.Name, [String].Empty)
        Else
            ' Validar el token Anti-XSRF
            If DirectCast(ViewState(AntiXsrfTokenKey), String) <> _antiXsrfTokenValue OrElse DirectCast(ViewState(AntiXsrfUserNameKey), String) <> (If(Context.User.Identity.Name, [String].Empty)) Then
                Throw New InvalidOperationException("Error de validación del token Anti-XSRF.")
            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Roles.CreateRole("1")
            Roles.CreateRole("2")
            Roles.CreateRole("3")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Unnamed_LoggingOut(sender As Object, e As LoginCancelEventArgs)
        Context.GetOwinContext().Authentication.SignOut()
        CargarBitacora(HttpContext.Current.User.Identity.Name)
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
        _bitacoraEntity.Tipo = "Cierre de sesión"
        _bitacoraEntity.Actividad = usuario & " cerró sesión"
        _bitacoraNeg.Alta_Bitacora(_bitacoraEntity)
    End Sub
End Class