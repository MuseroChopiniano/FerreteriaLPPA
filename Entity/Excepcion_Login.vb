Public Class Excepcion_Login
    Inherits Excepcion_Personalizada


    Public Overrides Property Codigo As String

    Public Overrides Property Descripcion As String

    Sub New(_mensaje As String)
        Codigo = "C001"
        Descripcion = _mensaje
    End Sub
End Class
