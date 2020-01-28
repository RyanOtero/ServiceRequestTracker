Public Class ManageRequest
    Inherits Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ViewState("alreadyCompleted") = False
            Finder.Visible = False
            Manager.Visible = False
            ConfirmDelete.Visible = False
            ReqID.SelectedIndex = 0
            ReqID.DataBind()
            Status.DataBind()
            TechID.DataBind()
        End If
    End Sub

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        If PasswordTextBox.Text = "EmployeesAreSilly" Then
            ShowFinder()
            LoginDiv.Visible = False
        End If
    End Sub

    Private Sub ReqID_Databind() Handles ReqID.DataBinding
        Dim conn As DBManager = New DBManager
        Dim ds As DataSet = Nothing
        Dim qry As String = "SELECT RequestID FROM ServiceRequests;"
        ds = conn.GetDataSet(qry)
        ReqID.DataValueField = "RequestID"
        ReqID.Items.Add(New ListItem(String.Empty, String.Empty))
        For Each row As DataRow In ds.Tables(0).Rows
            ReqID.Items.Add(New ListItem(row.ItemArray(0), row.ItemArray(0)))
        Next
    End Sub

    Private Sub Status_Databind() Handles Status.DataBinding
        Status.Items.Add(New ListItem(String.Empty, String.Empty))
        Status.Items.Add(New ListItem("Created", "Created"))
        Status.Items.Add(New ListItem("Assigned", "Assigned"))
        Status.Items.Add(New ListItem("Complete", "Complete"))
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

    Protected Sub Confirm_Click(sender As Object, e As EventArgs)
        If ViewState("alreadyCompleted") = True Then
            InvalidMsg.Text = "This service request has already been completed."
            Return
        End If
        Dim valid As Boolean = True
        If TechID.Text = "" AndAlso (Status.Text = "Assigned" OrElse Status.Text = "Complete") Then
            valid = False
            InvalidMsg.Text = "Please assign a technician."
        End If

        If TechID.Text = "" AndAlso Notes.Text <> "" Then
            valid = False
            InvalidMsg.Text = "Please assign a technician before adding notes."
        End If

        If TechID.Text <> "" AndAlso (Status.Text = "Created" OrElse Status.Text = "") Then
            valid = False
            InvalidMsg.Text = "Please change Status to Assigned or Complete."
        End If

        If Status.Text = "Complete" AndAlso Notes.Text = "" Then
            valid = False
            InvalidMsg.Text = "Please enter notes on the completed service request."
        End If

        If valid Then
            Dim conn As DBManager = New DBManager
            Dim params As Dictionary(Of String, Object) = New Dictionary(Of String, Object)
            Dim qry As String = "UPDATE ServiceRequests SET AssignedTechID = @techID, `Status` = @status, Notes = @notes"
            If Status.Text = "Complete" Then
                qry &= ", DateComplete = @dateComplete "
                params.Add("@dateComplete", Date.Today.ToString("yyyy-MM-dd"))
            End If
            qry &= " WHERE RequestID = @reqID;"
            params.Add("@reqID", ReqID.SelectedValue)
            params.Add("@techID", TechID.SelectedValue)
            params.Add("@status", Status.SelectedValue)
            params.Add("@notes", Notes.Text)
            conn.InsertData(qry, params)
            Cancel_Click(Nothing, Nothing)
        End If
    End Sub

    Protected Sub ManageRequest_Click(sender As Object, e As EventArgs)
        Dim id As String = ReqID.SelectedValue
        Dim qry As String = "SELECT * FROM ServiceRequests WHERE RequestID = @reqID;"
        Dim params As Dictionary(Of String, Object) = New Dictionary(Of String, Object)
        Dim conn As DBManager = New DBManager
        Dim ds As DataSet = Nothing
        params.Add("@reqID", id)
        ds = conn.GetDataSet(qry, params)
        If (id = "") Then
            Return
        End If
        ShowManager()
        If (ds.Tables(0).Rows(0).ItemArray(5) IsNot DBNull.Value) Then
            Status.SelectedIndex = Status.Items.IndexOf(New ListItem(ds.Tables(0).Rows(0).ItemArray(5)))
            If Status.SelectedIndex = 3 Then
                ViewState("alreadyCompleted") = True
            End If
        Else
            Status.SelectedIndex = 0
        End If
        If (ds.Tables(0).Rows(0).ItemArray(4) IsNot DBNull.Value) Then
            TechID.SelectedIndex = TechID.Items.IndexOf(TechID.Items.FindByValue(ds.Tables(0).Rows(0).ItemArray(4)))
        Else
            TechID.SelectedIndex = 0
        End If
        If (ds.Tables(0).Rows(0).ItemArray(2) IsNot DBNull.Value) Then
            Description.Text = ds.Tables(0).Rows(0).ItemArray(2)
        Else
            Description.Text = ""
        End If
        If (ds.Tables(0).Rows(0).ItemArray(7) IsNot DBNull.Value) Then
            Notes.Text = ds.Tables(0).Rows(0).ItemArray(7)
        Else
            Notes.Text = ""
        End If
    End Sub

    Protected Sub Cancel_Click(sender As Object, e As EventArgs)
        ReqID.Items.Clear()
        ReqID.DataBind()
        ConfirmDelete.Visible = False
        Clear()
        ShowFinder()
    End Sub

    Protected Sub Delete_Click(sender As Object, e As EventArgs)
        ConfirmDelete.Visible = True
    End Sub

    Protected Sub ConfirmDel_Click(sender As Object, e As EventArgs)
        Dim conn As DBManager = New DBManager
        Dim params As Dictionary(Of String, Object) = New Dictionary(Of String, Object)
        Dim qry As String = "DELETE FROM ServiceRequests where RequestID = @reqID;"
        params.Add("@reqID", ReqID.SelectedValue)
        conn.InsertData(qry, params)
        Cancel_Click(Nothing, Nothing)
    End Sub

    Protected Sub CancelDel_Click(sender As Object, e As EventArgs)
        ConfirmDelete.Visible = False
    End Sub

    Private Sub ShowManager()
        Manager.Visible = True
        Finder.Visible = False
    End Sub

    Private Sub ShowFinder()
        Manager.Visible = False
        Finder.Visible = True

    End Sub

    Private Sub Clear()
        ReqID.SelectedIndex = 0
        InvalidMsg.Text = ""
        ViewState("alreadyCompleted") = False
    End Sub
End Class