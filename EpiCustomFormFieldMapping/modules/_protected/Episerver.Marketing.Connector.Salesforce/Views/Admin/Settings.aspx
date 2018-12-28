<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="Episerver.Marketing.Connector.Salesforce.Views.Admin.Settings" %>

<%@ Register Assembly="EPiServer.UI" Namespace="EPiServer.UI.WebControls" TagPrefix="EPiServerUI" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web" %>

<%@ Import Namespace="EPiServer" %>
<%@ Import Namespace="Episerver.Marketing.Connector.Salesforce" %>
<%@ Import Namespace="EPiServer.Shell.WebForms" %>

<asp:content contentplaceholderid="HeaderContentRegion" runat="server">
</asp:content>

<asp:content contentplaceholderid="FullRegion" runat="server">
    <div class="epi-contentContainer epi-padding">
        <h1 class="EP-prefix">
            <%= Translate("/EPiServer/salesforce/admin/displayname")%></h1>
        <p class="EP-systemInfo"><%= Translate("/EPiServer/salesforce/admin/description")%></p>
        <div class="epi-size20">
            <div class="epi-buttonDefault">
                <span class="epi-cmsButton">
                    <asp:Button runat="server" ID="uxAdd" OnClick="AddClick" CssClass="epi-cmsButton-text epi-cmsButton-tools epi-cmsButton-Add" onmouseover="EPi.ToolButton.MouseDownHandler(this)" onmouseout="EPi.ToolButton.ResetMouseDownHandler(this)" />
                </span>
            </div>
        </div>
        </br>
        <div class="epi-formArea">
            <p runat="server" clientidmode="Static" class="EP-systemMessage" id="parentStatusMessage" visible="false"></p>

            <asp:placeholder ID="ConnectorControlsContainer" runat="server" />
        </div>
    </div>
</asp:content>