﻿Imports DAL
Imports Entity
Public Class Bitacora
    Dim _BitacoraDAL As New DAL_Bitacora

    Public Function Obtener_Bitacora() As List(Of Entity.Bitacora)
        Return _BitacoraDAL.Obtener_Bitacora()
    End Function
End Class