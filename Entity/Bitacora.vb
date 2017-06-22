Public Class Bitacora
    Property Id As Integer
    Property Usuario As String
    Property Fecha As Date
    Property Tipo As String
    Property Actividad As String

    Sub New()

    End Sub

    Sub New(pUsuario As String, pFecha As Date, pTipo As String, pActividad As String)
        Usuario = pUsuario
        Fecha = pFecha
        Tipo = pTipo
        Actividad = pActividad
    End Sub

    Sub New(pId As Integer, pUsuario As String, pFecha As Date, pTipo As String, pActividad As String)
        Id = pId
        Usuario = pUsuario
        Fecha = pFecha
        Tipo = pTipo
        Actividad = pActividad
    End Sub


End Class
