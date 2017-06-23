Imports System.Data.SqlClient
Imports System.Collections

Public Class SQL_Desconectado
    Private _sqlConnection As SqlConnection
    Private mDs As DataSet
    Private mDa As SqlDataAdapter

    Sub New()
        Dim server As String = "."
        Try
            ConexionIniciar()
        Catch _ex As Exception
            '
        End Try
    End Sub

    Public Sub ConexionIniciar()
        Try
            Dim connectionString As String = "Data Source=.;Initial Catalog=ElClavoOxidado;Integrated Security=True"
            _sqlConnection = New SqlConnection(connectionString)
            _sqlConnection.Open()
        Catch ex As Exception
            '
        End Try
    End Sub

    Public Sub ConexionFinalizar()
        Try
            _sqlConnection.Close()
            SqlConnection.ClearAllPools()
        Catch ex As Exception
            '
        End Try
    End Sub

    Public Function Obtener_DatasetStoreProcedure(sp As String, Optional parametros As Dictionary(Of String, Object) = Nothing)
        Try

            Dim unComando As New SqlCommand()

            '1) La conexion abierta.
            unComando.Connection = _sqlConnection

            '2) Texto de la consulta.
            unComando.CommandText = sp

            If Not parametros Is Nothing Then
                For Each p In parametros
                    unComando.Parameters.AddWithValue(p.Key, p.Value)
                Next
            End If


            '3) Tipo de consulta.
            unComando.CommandType = CommandType.StoredProcedure

            'SE CREA EL OBJETO DATAADAPTER PARA LLENAR EL DATASET
            mDa = New SqlDataAdapter(unComando)



            'LA SIGUIENTE LINEA ESTA COMENTADA PORQUE EL DATADAPTER ABRE Y CIERRA SOLO LA CONEXION
            'SIN AMBARGO, SI HUBIESE QUE LLENAR VARIAS TABLAS EN DISTINTOS PASOS, SE PODRIA ABRIR
            'Y CERRAR LA CONEXION MANUALMENTE
            'mCon.Open()

            'LLENAMOS EL DATASET CON LOS DATOS DE LA BASE DE DATOS
            'UNA DE LAS SOBRECARGAS DEL METODO FILL ACEPTA TAMBIEN UNA DATATABLE
            'OSEA QUE PODRIAMOS HABER TRABAJADO TRANQUILAMENTE CON UN OBJETO DATATABLE
            'AISLADO SIN DATASET. ES DECIR: Dim mDt As New DataTable : mDa.Fill(mDt)
            mDs = New DataSet
            mDa.Fill(mDs)

            'NO ES NECESARIO CERRAR LA CONEXION 
            'SI SERIA NECESARIO SI HUBIESEMOS DESCOMENTADO LA LINEA
            'DONDE SE ABRE MANUALMENTE. EN ESE CASO DEBERIAMOS TAMBIEN CERRARLA MANUALMENTE
            'mCon.Close()

        Catch ex As Exception
            '
        End Try
        Return mDs
    End Function

    Public Function EjecutarEscalar_StoreProcedure(consulta As String, parametros As Dictionary(Of String, Object)) As Object
        Try
            Dim unComando As New SqlCommand()

            '1) La conexion abierta.
            unComando.Connection = _sqlConnection
            'unComando.Transaction = _unaTransaccion

            '2) Texto de la consulta.
            unComando.CommandText = consulta

            For Each p In parametros
                unComando.Parameters.AddWithValue(p.Key, p.Value)
            Next

            '3) Tipo de consulta.
            unComando.CommandType = CommandType.StoredProcedure

            '4) Ejecutar y esperar el resultado.
            Return unComando.ExecuteScalar()
        Catch ex As Exception
            Return -1
        End Try
    End Function

    Public Sub EjecutarNonQuery_StoreProcedure(sp As String, Optional parametros As Dictionary(Of String, Object) = Nothing)
        Try
            Dim unComando As New SqlCommand()

            '1) La conexion abierta.
            unComando.Connection = _sqlConnection

            '2) Texto de la consulta.
            unComando.CommandText = sp

            unComando.Parameters.Clear()
            For Each p In parametros
                unComando.Parameters.AddWithValue(p.Key, p.Value)
                If p.Key = "@Result" Then
                    unComando.Parameters("@Result").Direction = ParameterDirection.Output
                End If
            Next

            '3) Tipo de consulta.
            unComando.CommandType = CommandType.StoredProcedure

            '4) Ejecutar y esperar el resultado.
            unComando.ExecuteNonQuery()
        Catch ex As Exception
        End Try
    End Sub
End Class
