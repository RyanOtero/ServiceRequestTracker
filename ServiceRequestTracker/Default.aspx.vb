
Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            TechID.DataBind()
            Status.DataBind()
            Requester.DataBind()
            gvServiceRequests.DataBind()
        End If
    End Sub

    Private Sub gvServiceRequests_Databind() Handles gvServiceRequests.DataBinding
        Dim conn As DBManager = New DBManager
        Dim params As Dictionary(Of String, Object) = New Dictionary(Of String, Object)
        Dim ds As DataSet = Nothing
        Dim qry As String = "SELECT * FROM ServiceRequests"

        If StartDate.Text <> "" Then
            qry &= " WHERE date(DateRequested) >= date(@startDate)"
            params.Add("@startDate", StartDate.Text)
        End If

        If EndDate.Text <> "" Then
            If params.Keys.Count = 0 Then
                qry &= " WHERE date(DateRequested) <= date(@endDate)"
            Else qry &= " AND date(DateRequested) <= date(@endDate)"
            End If
            params.Add("@endDate", EndDate.Text)
        End If

        If Requester.Text <> "" Then
            If params.Keys.Count = 0 Then
                qry &= " WHERE RequestingEmployeeID = @reqEID"
            Else qry &= " AND RequestingEmployeeID = @reqEID"
            End If
            params.Add("@reqEID", Requester.Text)
        End If

        If TechID.Text <> "" Then
            If params.Keys.Count = 0 Then
                qry &= " WHERE AssignedTechID = @techID"
            Else qry &= " AND AssignedTechID = @techID"
            End If
            params.Add("@techID", TechID.Text)
        End If

        If Status.Text <> "" Then
            If params.Keys.Count = 0 Then
                qry &= " WHERE Status = @status"
            Else qry &= " AND Status = @status"
            End If
            params.Add("@status", Status.Text)
        End If

        qry &= ";"
        ds = conn.GetDataSet(qry, params)
        gvServiceRequests.DataSource = ds
    End Sub

    Protected Sub gvServiceRequests_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If e.Row.RowType <> DataControlRowType.Header Then
            If e.Row.Cells(2).Text.Replace("&#39;", "'").Count > 32 Then
                e.Row.Cells(2).ToolTip = e.Row.Cells(2).Text.Replace("&#39;", "'")
                e.Row.Cells(2).Text = Strings.Left(e.Row.Cells(2).Text.Replace("&#39;", "'"), 32) & "..."
            End If
            If e.Row.Cells(7).Text.Replace("&#39;", "'").Count > 32 Then
                e.Row.Cells(7).ToolTip = e.Row.Cells(7).Text.Replace("&#39;", "'")
                e.Row.Cells(7).Text = Strings.Left(e.Row.Cells(7).Text.Replace("&#39;", "'"), 32) & "..."
            End If
        End If
    End Sub

    Private Sub TechID_Databind() Handles TechID.DataBinding
        Dim conn As DBManager = New DBManager
        Dim ds As DataSet = Nothing
        Dim qry As String = "SELECT FirstName || ' ' || LastName as Name, EmployeeID AS `TechID` FROM Employees WHERE Department = 'IT';"
        ds = conn.GetDataSet(qry)
        TechID.Items.Add(New ListItem(String.Empty, String.Empty))
        For Each row As DataRow In ds.Tables(0).Rows
            TechID.Items.Add(New ListItem(row.ItemArray(0), row.ItemArray(1)))
        Next
    End Sub

    Private Sub Requester_Databind() Handles Requester.DataBinding
        Dim conn As DBManager = New DBManager
        Dim ds As DataSet = Nothing
        Dim qry As String = "SELECT FirstName || ' ' || LastName as Name, EmployeeID AS `RequesterID` FROM Employees WHERE Department <> 'IT';"
        ds = conn.GetDataSet(qry)
        Requester.Items.Add(New ListItem(String.Empty, String.Empty))
        For Each row As DataRow In ds.Tables(0).Rows
            Requester.Items.Add(New ListItem(row.ItemArray(0), row.ItemArray(1)))
        Next
    End Sub

    Private Sub Status_Databind() Handles Status.DataBinding
        Status.Items.Add(New ListItem(String.Empty, String.Empty))
        Status.Items.Add(New ListItem("Created", "Created"))
        Status.Items.Add(New ListItem("Assigned", "Assigned"))
        Status.Items.Add(New ListItem("Complete", "Complete"))
    End Sub

    Protected Sub Search_Click(sender As Object, e As EventArgs)
        gvServiceRequests.DataBind()
    End Sub
End Class