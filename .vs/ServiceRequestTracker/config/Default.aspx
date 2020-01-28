<%@ Page Title="Service Request Tracker" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ServiceRequestTracker._Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="Stylesheets" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=StartDate.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%Y-%m-%d",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
            $("#<%=EndDate.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%Y-%m-%d",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
        });
    </script>
    <div class="center">
        <h2 style="text-align: center;">Service Request Tracker</h2>
    </div>
    <div class="row center" style="margin-top: 20px;">
        <div class="paddingH10">
            <h3>Start Date</h3>
            <asp:TextBox ID="StartDate" runat="server" Height="26px" Width="120px"></asp:TextBox>
            <img src="Images/calender.png" />
        </div>
        <div class="paddingH10">
            <h3>End Date</h3>
            <asp:TextBox ID="EndDate" runat="server" Height="26px" Width="120px"></asp:TextBox>
            <img src="Images/calender.png" />
        </div>
        <div class="paddingH10">
            <h3>Requester</h3>
            <asp:DropDownList ID="Requester" runat="server" Height="26px" Width="160px" DataTextField="Name" DataValueField="RequesterID"></asp:DropDownList>
        </div>
        <div class="paddingH10">
            <h3>Tech Assigned</h3>
            <asp:DropDownList ID="TechID" runat="server" Height="26px" Width="160px" DataTextField="Name" DataValueField="TechID"></asp:DropDownList>
        </div>
        <div class="paddingH10">
            <h3>Status</h3>
            <asp:DropDownList ID="Status" runat="server" Height="26px" Width="90px" DataTextField="Status" DataValueField="StatusValue"></asp:DropDownList>
        </div>
        <div class="paddingH10" style="margin-top: 56px;">
            <asp:Button runat="server" Text="Search" CssClass="right" OnClick="Search_Click"/>
        </div>
    </div>
    <div class="row center">
        <div>
            <asp:GridView runat="server" ID="gvServiceRequests" AutoGenerateColumns="true" CssClass="gv mgn-50v center table"></asp:GridView>
        </div>
    </div>
</asp:Content>
