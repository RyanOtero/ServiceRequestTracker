Public Class NewRequest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Requester.DataBind()
        End If
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

    Protected Sub AddRequest_Click(sender As Object, e As EventArgs)
        Dim conn As DBManager = New DBManager
        Dim params As Dictionary(Of String, Object) = New Dictionary(Of String, Object)
        Dim qry As String = "Insert INTO ServiceRequests (RequestingEmployeeID, Description, DateRequested, `Status`) Values (@reqEID, @desc, CURRENT_DATE, 'Created')"
        params.Add("@reqEID", Requester.Text)
        params.Add("@desc", TBDescription.Text)
        qry &= ";"
        conn.InsertData(qry, params)
        Requester.Text = ""
        TBDescription.Text = ""
        Response.Redirect("~/Default.aspx")
    End Sub
End Class