<%@ Page Title="Manage Request" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ManageRequest.aspx.vb" Inherits="ServiceRequestTracker.ManageRequest" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="Stylesheets" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

</script>

    <div class="row center paddingV10">
        <h2 style="margin-bottom: 30px;">Service Request Tracker</h2>
    </div>

    <div id="LoginDiv" runat="server" visible="true" class="row center paddingV10">
        <div class="col-md-2">
            <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" Height="30px" Width="160px"></asp:TextBox>
        </div>
        <div class="col-md-2">
            <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />
        </div>
    </div>

    <div id="Finder" runat="server" clientidmode="Static" class="row center paddingV10">
        <div class="col-md-2">
            <h3>Request ID</h3>
            <asp:DropDownList ID="ReqID" ClientIDMode="Static" runat="server" Height="30px" Width="160px"></asp:DropDownList>
        </div>
        <div class="col-md-2">
            <asp:Button runat="server" Text="Manage Request" ID="ManageRequest" CssClass="bottom pos-abs" OnClick="ManageRequest_Click" />
        </div>
    </div>

    <div id="Manager" runat="server" clientidmode="Static">
        <div class="row center paddingV10">
            <div class="paddingH10">
                <h3>Assign Tech</h3>
                <asp:DropDownList ID="TechID" ClientIDMode="Static" runat="server" Height="30px" Width="160px" DataTextField="Name" DataValueField="TechID"></asp:DropDownList>
            </div>
            <div class="paddingH10">
                <h3>Status</h3>
                <asp:DropDownList ID="Status" ClientIDMode="Static" runat="server" Height="30px" Width="110px" DataTextField="Status" DataValueField="StatusValue"></asp:DropDownList>
            </div>
        </div>
        <div class="row center paddingV10">
            <div class="col-md-4">
                <h3>Description</h3>
                <asp:Label TextMode="MultiLine" ID="Description" ClientIDMode="Static" runat="server" CssClass="widthOverride" Height="175px" Width="370px"></asp:Label>
            </div>
            <div class="col-md-4">
                <h3>Notes</h3>
                <asp:TextBox TextMode="MultiLine" ID="Notes" ClientIDMode="Static" runat="server" CssClass="widthOverride" Height="175px" Width="370px"></asp:TextBox>
            </div>
        </div>
        <div class="row center paddingV10 mgn-25v">
            <div class="col-md-1">
                <asp:Button runat="server" Text="Delete" ID="Delete" CssClass="bottom center redBold" OnClick="Delete_Click" />
            </div>
            <div class="col-md-1">
                <asp:Button runat="server" Text="Cancel" ID="Cancel" CssClass="bottom center" OnClick="Cancel_Click" />
            </div>
            <div class="col-md-1">
                <asp:Button runat="server" Text="Confirm" ID="Confirm" CssClass="bottom center" OnClick="Confirm_Click" />
            </div>

        </div>
        <div>
            <asp:Label runat="server" Text="" ID="InvalidMsg" CssClass="bottom center error" />
        </div>
    </div>
    <div id="ConfirmDelete" runat="server" clientidmode="Static">
        <div class="row center paddingV10 mgn-50vTop">
            <asp:Label Text="Are you sure you want to delete this service request?" runat="server" />
        </div>
        <div class="row center paddingV10">
            <div class="col-md-1">
                <asp:Button runat="server" Text="Cancel" ID="CancelDel" CssClass="bottom center" OnClick="CancelDel_Click" />
            </div>
            <div class="col-md-1">
                <asp:Button runat="server" Text="Confirm" ID="ConfirmDel" CssClass="bottom center" OnClick="ConfirmDel_Click" />
            </div>
        </div>
    </div>
</asp:Content>
