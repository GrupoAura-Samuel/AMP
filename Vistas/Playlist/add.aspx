<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="AMP.Vistas.Playlist.add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table cellpadding="5"  cellspacing="0" style="border-style: none; border-color: inherit; border-width: 1px; width: 915px;">
   <tr>
      <td align="right" style="width: 284px"><asp:Label ID="Label1" runat="server" Text="Nombre del Playlist"></asp:Label></td>
      <td><asp:TextBox ID="txtPlaylist" runat="server" Width="277px"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
              ControlToValidate="txtPlaylist" 
              ErrorMessage="El nombre del Playlist es obligatorio." ForeColor="Red"></asp:RequiredFieldValidator>
       </td>
      <td></td>
    </tr>
    <tr><td></td>
    <td><asp:Button ID="btnGuardar" runat="server" onclick="btnGuardar_Click" Text="Guardar" /></td>
    </tr>
</table>
</asp:Content>
