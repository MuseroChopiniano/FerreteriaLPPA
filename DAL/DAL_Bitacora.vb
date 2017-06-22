Imports Entity
Public Class DAL_Bitacora

    Public Function Obtener_Bitacora() As List(Of Bitacora)
        Dim _listaBitacora As New List(Of Bitacora)
        Try
            Dim _dal As New DAL.SQL_Desconectado
            Dim _ds As DataSet
            Dim _storeProcedure As String
            _storeProcedure = "GetBitacora"
            _ds = _dal.Obtener_DatasetStoreProcedure(_storeProcedure)

            For Each Item As DataRow In _ds.Tables(0).Rows
                _listaBitacora.Add(New Bitacora(Item(0), Item(1), Item(2), Item(3), Item(4)))
            Next

        Catch ex As Exception
        End Try
        Return _listaBitacora
    End Function

    Public Sub Alta_Bitacora(ByRef bitacora As Entity.Bitacora)
        Dim _dal As New DAL.SQL_Desconectado
        Dim _storeProcedure As String
        Dim _parametros As New Dictionary(Of String, Object)

        _storeProcedure = "AltaBitacora"

        _parametros.Clear()
        _parametros.Add("@Id", bitacora.Id)
        _parametros.Add("@Usuario", bitacora.Usuario)
        _parametros.Add("@Tipo", bitacora.Tipo)
        _parametros.Add("@Actividad", bitacora.Actividad)

        _dal.EjecutarNonQuery_StoreProcedure(_storeProcedure, _parametros)
    End Sub
End Class
