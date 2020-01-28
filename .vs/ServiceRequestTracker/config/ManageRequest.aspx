<%@ Page Title="Manage Request" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ManageRequest.aspx.vb" Inherits="ServiceRequestTracker.ManageRequest" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="Stylesheets" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

    </script>

    <div class="center">
        <h1 style="text-align: center;">Service Request Tracker</h1>
    </div>

    <div id="Finder" runat="server" ClientIdMode="Static" class="row center">
        <div class="col-md-2">
            <h3>Request ID</h3>
            <asp:DropDownList ID="ReqID" ClientIDMode="Static" runat="server" Height="26px" Width="160px"></asp:DropDownList>
        </div>
        <div class="col-md-2">
            <asp:Button runat="server" Text="Manage Request" ID="ManageRequest" class="bottom pos-abs" OnClick="ManageRequest_Click"/>
        </div>
    </div>

    <div id="Manager" runat="server" ClientIdMode="Static">
        <div class="row center">
            <div class="paddingH10">
                <h3>Assign Tech</h3>
                <asp:DropDownList ID="TechID"  ClientIDMode="Static" runat="server" Height="26px" Width="160px" DataTextField="Name" DataValueField="TechID"></asp:DropDownList>
            </div>
            <div class="paddingH10">
                <h3>Status</h3>
                <asp:DropDownList ID="Status"  ClientIDMode="Static" runat="server" Height="26px" Width="110px" DataTextField="Status" DataValueField="StatusValue"></asp:DropDownList>
            </div>
        </div>
        <div class="row center">
            <div class="col-md-4">
                <h3>Description</h3>
                <asp:Label TextMode="MultiLine" ID="Description"  ClientIDMode="Static" runat="server" Class="widthOverride" Height="175px" Width="370px"></asp:Label>
            </div>
            <div class="col-md-4">
                <h3>Notes</h3>
                <asp:TextBox TextMode="MultiLine" ID="Notes"  ClientIDMode="Static" runat="server" Class="widthOverride" Height="175px" Width="370px"></asp:TextBox>
            </div>
        </div>
        <div class="row center mgn-25v">
            <div class="col-md-1">
                <asp:Button runat="server" Text="Cancel" ID="Cancel" class="bottom center" OnClick="Cancel_Click"/>
            </div>
            <div class="col-md-1">
                <asp:Button runat="server" Text="Confirm" ID="Confirm" class="bottom center" OnClick="Confirm_Click"/>
            </div>
        </div>
        <div>
            <asp:Label runat="server" Text="" ID="InvalidMsg" class="bottom center error" />
        </div>
    </div>
</asp:Content>
