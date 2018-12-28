<%@ Control Language="C#"
    AutoEventWireup="true"
    CodeBehind="SettingsControl.ascx.cs" Inherits="Episerver.Marketing.Connector.Salesforce.Views.Admin.SettingsControl" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web" %>

<%@ Import Namespace="EPiServer" %>
<%@ Import Namespace="Episerver.Marketing.Connector.Salesforce" %>
<%@ Import Namespace="EPiServer.Shell.WebForms" %>
<%@ Import Namespace="EPiServer.Framework.Localization" %>
<script type="text/javascript">
    function confirmRemove(uxConnectorNameId) {
        var connectorName = document.getElementById(uxConnectorNameId).value;
        var confirmMessage = "<%= LocalizationService.Current.GetString("/episerver/marketing/connectors/common/removeconfirmation")%> "; 
        var warningMessage = "\n<%= LocalizationService.Current.GetString("/episerver/marketing/connectors/common/removewarning")%>";
        if (connectorName == "") {
            connectorName = "New Connector"
            return confirm(confirmMessage + connectorName);
        } else {
            return confirm( confirmMessage + connectorName + warningMessage); 
        }
    }

</script>
<fieldset>

    <legend><span id="controlDescription" runat="server"></span></legend>
    <p runat="server" clientidmode="Static" class="EP-systemMessage" id="pErrorMessage" visible="false"></p>
    <p runat="server" clientidmode="Static" class="EP-systemMessage" id="pStatusMessage" visible="false"></p>

    <div class="epi-size20">
        <div>
            <asp:Label runat="server" ID="lblConnectorName" AssociatedControlID="uxConnectorName">Connector Name</asp:Label>
            <asp:TextBox runat="server" ID="uxConnectorName"></asp:TextBox>
            <asp:label runat="server" ID="uxConnectorNameRequired" style="color: red">*</asp:label>
        </div>
        <div>
            <asp:Label runat="server" ID="lblEmail" AssociatedControlID="uxEmail"></asp:Label>
            <asp:TextBox runat="server" ID="uxEmail" TextMode="Email"></asp:TextBox>
            <asp:label runat="server" ID="uxEmailRequired" style="color: red">*</asp:label>
        </div>
        <div>
            <asp:Label runat="server" ID="lblPassword" AssociatedControlID="uxPassword"></asp:Label>
            <asp:TextBox runat="server" ID="uxPassword" TextMode="Password"></asp:TextBox>
            <asp:label runat="server" ID="uxPasswordRequired" style="color: red">*</asp:label>
        </div>
        <div>
            <asp:Label runat="server" ID="lblUserKey" AssociatedControlID="uxUserKey"></asp:Label>
            <asp:TextBox runat="server" ID="uxUserKey"></asp:TextBox>
            <asp:label runat="server" ID="uxUserKeyRequired" style="color: red">*</asp:label>
        </div>
        <div>
            <asp:Label runat="server" ID="lblAccountType" AssociatedControlID="uxAccountType"></asp:Label>
            <asp:DropDownList ID="uxAccountType" runat="server">
                <asp:ListItem Text="Production" Value="false"></asp:ListItem>
                <asp:ListItem Text="Sandbox" Value="true"></asp:ListItem>
            </asp:DropDownList>
            <br />
        </div>
        <div>
            <asp:Label runat="server" ID="lblUpdateEntity" AssociatedControlID="uxUpdateEntity"></asp:Label>
            <asp:DropDownList ID="uxUpdateEntity" runat="server">
            </asp:DropDownList>
            <br />
        </div>
        <div class="epi-buttonContainer">
            <span class="epi-cmsButton">
                <asp:Button runat="server" ID="uxEdit" OnClick="EditClick" CssClass="epi-cmsButton-text epi-cmsButton-tools epi-cmsButton-Edit" onmouseover="EPi.ToolButton.MouseDownHandler(this)" onmouseout="EPi.ToolButton.ResetMouseDownHandler(this)" />
            </span>
            <span class="epi-cmsButton">
                <asp:Button runat="server" ID="uxSave" OnClick="SaveClick" CssClass="epi-cmsButton-text epi-cmsButton-tools epi-cmsButton-Save" onmouseover="EPi.ToolButton.MouseDownHandler(this)" onmouseout="EPi.ToolButton.ResetMouseDownHandler(this)" />
            </span>
            <span class="epi-cmsButton">
                <asp:Button runat="server" ID="uxRemove" OnClick="RemoveClick" CssClass="epi-cmsButton-text epi-cmsButton-tools epi-cmsButton-Cancel" onmouseover="EPi.ToolButton.MouseDownHandler(this)" onmouseout="EPi.ToolButton.ResetMouseDownHandler(this)" />
            </span>
        </div>
    </div>
</fieldset>
