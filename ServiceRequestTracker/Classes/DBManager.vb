Imports System.Data.SQLite

Public Class DBManager

    Public con As SQLiteConnection = New SQLiteConnection
    Public cmd As SQLiteCommand
    Public DB As SQLiteDataAdapter
    Public DS As DataSet = New DataSet
    Public DT As DataTable = New DataTable

    Public Function GetDataSet(query As String, Optional params As Dictionary(Of String, Object) = Nothing) As DataSet
        Dim ds As DataSet = New DataSet()
        SetConnection()
        con.Open()
        Dim da As SQLiteDataAdapter = New SQLiteDataAdapter(query, con)
        If params IsNot Nothing Then
            Try
                For Each key As String In params.Keys
                    da.SelectCommand.Parameters.AddWithValue(key, params.Item(key))
                Next
            Catch ex As Exception
            End Try
        End If
        da.Fill(ds)
        da.Dispose()
        con.Close()
        Return ds
    End Function

    Public Sub InsertData(query As String, Optional params As Dictionary(Of String, Object) = Nothing)
        SetConnection()
        con.Open()
        cmd = con.CreateCommand()
        cmd.CommandText = query
        If params IsNot Nothing Then
            Try
                For Each key As String In params.Keys
                    cmd.Parameters.AddWithValue(key, params.Item(key))
                Next
            Catch ex As Exception
            End Try
        End If
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        con.Close()
    End Sub

    Public Sub SetConnection()
        con.ConnectionString = ConfigurationManager.ConnectionStrings("default").ConnectionString
        'con.ConnectionString = "Data Source=" & AppDomain.CurrentDomain.BaseDirectory & "database.db"
    End Sub

End Class
