<%@ Page Title="Service Request Tracker" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ServiceRequestTracker._Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="Stylesheets" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
    <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

    <script type="text/javascript">
        $(function () {
            $(document).tooltip();
            $(".datepick").datepicker({ dateFormat: "yy-mm-dd" });
        });
    </script>
    <div class="row center paddingV10">
        <h2 style="margin-bottom: 30px;">Service Request Tracker</h2>
    </div>
    <div class="row center paddingV10">
        <div class="paddingH10">
            <h3>Start Date</h3>
            <asp:TextBox ID="StartDate" runat="server" class="datepick"  Height="30px" Width="120px"></asp:TextBox>
        </div>
        <div class="paddingH10">
            <h3>End Date</h3>
            <asp:TextBox ID="EndDate" runat="server" class="datepick" Height="30px" Width="120px"></asp:TextBox>
        </div>
        <div class="paddingH10">
            <h3>Requester</h3>
            <asp:DropDownList ID="Requester" runat="server" Height="30px" Width="160px" DataTextField="Name" DataValueField="RequesterID"></asp:DropDownList>
        </div>
        <div class="paddingH10">
            <h3>Tech Assigned</h3>
            <asp:DropDownList ID="TechID" runat="server" Height="30px" Width="160px" DataTextField="Name" DataValueField="TechID"></asp:DropDownList>
        </div>
        <div class="paddingH10">
            <h3>Status</h3>
            <asp:DropDownList ID="Status" runat="server" Height="30px" Width="90px" DataTextField="Status" DataValueField="StatusValue"></asp:DropDownList>
        </div>
        <div class="paddingH10 mgn-V50bottom" style="margin-top: 41px;">
            <asp:Button runat="server" Text="Search" CssClass="right" OnClick="Search_Click" />
        </div>
    </div>
    <div class="row center paddingV10">
        <div class="gvDiv">
            <asp:GridView runat="server" ID="gvServiceRequests" AutoGenerateColumns="true" OnRowDataBound="gvServiceRequests_RowDataBound" CssClass="gv center table"></asp:GridView>
        </div>
    </div>
</asp:Content>
