<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="AMP.Vistas.Playlist.edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
<br />
    <asp:Label ID="Label1" runat="server" Text="Nombre del Playlist"></asp:Label>
    <asp:TextBox ID="txtPlaylist" runat="server" Width="277px"></asp:TextBox>
    <br />
    <asp:Button ID="btnGuardar" runat="server" onclick="btnGuardar_Click" 
        Text="Actualizar" />
</asp:Content>
