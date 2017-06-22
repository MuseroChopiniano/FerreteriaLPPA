﻿Imports System.Web.Security
Imports Entity
Imports Negocio
Partial Class LogIn
    Inherits System.Web.UI.Page

    Dim vUsuarioNeg As New Negocio.Usuario
    Dim vUsuarioEntity As Entity.Usuario
    Dim vIntentos As Integer


    Protected Sub LogInBtn_Click(sender As Object, e As EventArgs) Handles LogInBtn.Click
        vUsuarioEntity = New Entity.Usuario With {.Usuario = UserName.Text}
        Try
            If vUsuarioNeg.Validar_Login(vUsuarioEntity, Password.Text) Then
                If RememberMe.Checked Then
                    FormsAuthentication.SetAuthCookie(UserName.Text, True)
                Else
                    FormsAuthentication.SetAuthCookie(UserName.Text, False)
                End If
                'HttpContext.Current.User.IsInRole(vUsuarioEntity.Familia)
                MsgBox("Usted se ha logueado correctamente")
                    MsgBox("Bienvenido " + UserName.Text)
                Response.Redirect("/Default", True)

            Else
                    vUsuarioEntity.Cant_Bloqueos += 1
                'vIntentos += 1
            End If
        Catch ex As Exception
            ' MsgBox("Error")
        End Try
    End Sub

    Private Sub LogIn_PreLoad(sender As Object, e As EventArgs) Handles Me.PreLoad
        Dim isSomeoneLoggedIn As Boolean = HttpContext.Current.User.Identity.IsAuthenticated
        If isSomeoneLoggedIn Then
            Response.Redirect("~/Default", True)
        End If
    End Sub
End Class
