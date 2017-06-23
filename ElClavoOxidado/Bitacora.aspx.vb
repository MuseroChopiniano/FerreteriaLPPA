Imports Negocio
Public Class Bitacora
    Inherits System.Web.UI.Page
    Dim _Bitacora_Negocio As New Negocio.Bitacora

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        GrillaBitacora.DataSource = Nothing
        GrillaBitacora.DataSource = _Bitacora_Negocio.Obtener_Bitacora
        GrillaBitacora.DataBind()
    End Sub

End Class