Public Class DAL_Usuario

    Public Sub Obtener_Usuarios(ByRef usuario As Entity.Usuario, _password As String)
        Dim _dal As New DAL.SQL_Desconectado

        Dim _ds As DataSet ' Obtengo de la BD los datos
        Dim _storeprocedure As String
        Dim _parametros As New Dictionary(Of String, Object)

        _storeprocedure = "sp_ObtenerUser" ' Nombre del store procedure de persistencia

        _parametros.Clear()
        _parametros.Add("@Usuario", usuario.Usuario)
        _parametros.Add("@Pass", _password)

        ' Obtengo el tipo
        _ds = _dal.Obtener_DatasetStoreProcedure(_storeprocedure, _parametros)

        usuario.Usuario = Nothing
        If _ds.Tables(0).Rows.Count > 0 Then
            For Each Item As DataRow In _ds.Tables(0).Rows
                usuario.Usuario = Item("Usuario")
                usuario.IsValid = Item("IsValid")
                usuario.Bloqueado = Item("Bloqueado")
                usuario.Cant_Bloqueos = Item("Cant_Bloqueos")
                usuario.Ultimo_intento = Item("Ultimo_intento")
                usuario.Familia = Item("Familia")
            Next
        Else
        End If
    End Sub
End Class
