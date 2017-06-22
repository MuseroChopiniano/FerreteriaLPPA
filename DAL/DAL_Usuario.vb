Public Class DAL_Usuario

    Public Sub Obtener_Usuarios(ByRef usuario As Entity.Usuario, _password As String)
        Dim _dal As New DAL.SQL_Desconectado

        Dim _ds As DataSet ' Obtengo de la BD los datos
        Dim _storeprocedure As String
        Dim _parametros As New Dictionary(Of String, Object)

        _storeprocedure = "ObtenerUser" ' Nombre del store procedure de persistencia

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
                usuario.Familia = Item("Familia")
            Next
        Else
        End If
    End Sub

    Public Sub Bloquear_Usuarios(ByRef usuario As Entity.Usuario)
        Dim _dal As New DAL.SQL_Desconectado

        Dim _ds As DataSet ' Obtengo de la BD los datos
        Dim _storeprocedure As String
        Dim _parametros As New Dictionary(Of String, Object)

        _storeprocedure = "BloquearUser" ' Nombre del store procedure de persistencia

        _parametros.Clear()

        _parametros.Add("@Usuario", usuario.Usuario)

        ' Obtengo el tipo
        _ds = _dal.EjecutarEscalar_StoreProcedure(_storeprocedure, _parametros)

    End Sub

    Public Sub Alta_Usuario(ByRef usuario As Entity.Usuario)
        Dim _dal As New DAL.SQL_Desconectado
        Dim _storeProcedure As String
        Dim _parametros As New Dictionary(Of String, Object)

        _storeProcedure = "AltaUsuario"

        _parametros.Clear()
        _parametros.Add("@Usuario", usuario.Usuario)
        _parametros.Add("@Email", usuario.Email)
        _parametros.Add("@Password", usuario.Password)
        _parametros.Add("@Familia", usuario.Familia)

        _dal.EjecutarNonQuery_StoreProcedure(_storeProcedure, _parametros)
    End Sub

    Public Function Chequear_Usuario(username As String) As Boolean
        Dim _dal As New DAL.SQL_Desconectado
        Dim _ds As DataSet
        Dim _storeProcedure As String
        Dim _parametros As New Dictionary(Of String, Object)

        _storeProcedure = "ChequearUsuario"

        _parametros.Clear()
        _parametros.Add("@Usuario", username)

        _ds = _dal.Obtener_DatasetStoreProcedure(_storeProcedure, _parametros)

        If _ds.Tables(0).Rows.Count > 0 Then
            Return False
        Else
            Return true
        End If
    End Function
End Class
