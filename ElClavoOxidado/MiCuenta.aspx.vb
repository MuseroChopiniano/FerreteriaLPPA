Imports Negocio
Imports Entity
Partial Class MiCuenta
    Inherits System.Web.UI.Page

    Protected Property SuccessMessageText() As String
        Get
            Return m_SuccessMessage
        End Get
        Private Set(value As String)
            m_SuccessMessage = value
        End Set
    End Property
    Private m_SuccessMessage As String


    Protected Sub ChangePassword_Click(sender As Object, e As EventArgs) Handles CambiarContraseñaBtn.Click

    End Sub
End Class
