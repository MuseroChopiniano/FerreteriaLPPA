﻿Public Class Usuario

    Public Function Validar_Login(_user As Entity.Usuario, _pass As String) As Boolean
        Dim _dal As New DAL.DAL_Usuario
        ' Validamos el usuario
        _dal.Obtener_Usuarios(_user, _pass)

        ' Verificamos que sea un usuario registrado
        If _user.Usuario Is Nothing And _user.IsValid = False Then
            Dim _ex As New Entity.Excepcion_Login("Usuario invalido")
            Throw _ex
        End If

        ' Verificamos que no supere la cantidad de intentos - Caso contrario usuario bloqueado
        If _user.Bloqueado = True Then
            Dim _ex As New Entity.Excepcion_Login("Usuario Bloqueado")
            Throw _ex
        End If

        ' Si usuario esta informado pero no es valido es error en clave
        If _user.IsValid = False Then
            If _user.Cant_Bloqueos >= 3 Then
                _user.Bloqueado = True
                ' Actualizo el usuario y retorno el error
                _dal.Bloquear_Usuarios(_user)

                Dim _ex As New Entity.Excepcion_Login("Usuario Bloqueado")
                Throw _ex
            End If

            Dim _ex2 As New Entity.Excepcion_Login("Password invalida")
            Throw _ex2
        End If

        'Obtenemos los perfiles habilitados

        ' Si la validaciones son correcta retornamos el usuario y true indicando que es un usuario valido.

        Return True
    End Function

    Public Function Obtener_Familia(_user As Entity.Usuario, _pass As String) As Integer
        Dim _dal As New DAL.DAL_Usuario
        _dal.Obtener_Usuarios(_user, _pass)

        Return _user.Familia

    End Function

    Public Sub Alta_Usuario(_usuario As Entity.Usuario)
        Dim _dal As New DAL.DAL_Usuario
        _dal.Alta_Usuario(_usuario)
    End Sub

    Public Function Chequear_Usuario(_username As String) As Boolean
        Dim _dal As New DAL.DAL_Usuario
        Return _dal.Chequear_Usuario(_username)
    End Function
End Class
