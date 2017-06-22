Imports DAL
Imports Entity
Public Class Bitacora
    Dim _BitacoraDAL As New DAL_Bitacora

    Public Function Obtener_Bitacora() As List(Of Entity.Bitacora)
        Return _BitacoraDAL.Obtener_Bitacora()
    End Function

    Public Sub Alta_Bitacora(ByRef bitacora As Entity.Bitacora)
        _BitacoraDAL.Alta_Bitacora(bitacora)
    End Sub
End Class
