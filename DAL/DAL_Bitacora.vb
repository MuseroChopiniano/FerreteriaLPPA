Imports Entity
Public Class DAL_Bitacora

    Public Function Obtener_Bitacora() As List(Of Bitacora)
        Dim _listaBitacora As New List(Of Bitacora)
        Dim _dal As New DAL.SQL_Desconectado
        Dim _ds As DataSet
        Dim _storeProcedure As String
        _storeProcedure = "GetBitacora"
        _ds = _dal.Obtener_DatasetStoreProcedure(_storeProcedure)

        For Each Item As DataRow In _ds.Tables(0).Rows
            _listaBitacora.Add(New Bitacora(Item(0), Item(1), Item(2), Item(3), Item(4)))
        Next
        Return _listaBitacora
    End Function
End Class
