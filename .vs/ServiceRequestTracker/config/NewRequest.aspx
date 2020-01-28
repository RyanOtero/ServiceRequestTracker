<%@ Page Title="New Request" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="NewRequest.aspx.vb" Inherits="ServiceRequestTracker.NewRequest" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="Stylesheets" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="center">
        <h1 style="text-align: center;">Service Request Tracker</h1>
    </div>

    <div class="row center">
        <div class="col-md-2">
            <h3>Requester</h3>
            <asp:DropDownList ID="Requester" runat="server" Height="26px" Width="160px" DataTextField="Name" DataValueField="RequesterID"></asp:DropDownList>
        </div>
    </div>

    <div class="row center">
        <div class="col-md-4">
            <h3>Write A Description</h3>
            <asp:TextBox TextMode="MultiLine" ID="TBDescription" runat="server" Class="widthOverride" Height="175px" Width="370px"></asp:TextBox>
        </div>
    </div>
    <div class="row center pos-rel" style="height: 50px;">
        <asp:Button ID="AddRequest" runat="server" Text="Add Request" class="bottom pos-abs" OnClick="AddRequest_Click"/>
    </div>

</asp:Content>
