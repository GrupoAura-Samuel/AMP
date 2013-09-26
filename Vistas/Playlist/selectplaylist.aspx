<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SelectPlaylist.aspx.cs" Inherits="AMP.Vistas.Playlist.SelectPlaylist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:EntityDataSource ID="EntityDataPlaylist" runat="server" 
        ConnectionString="name=MapEntities1" DefaultContainerName="MapEntities1" 
        EnableFlattening="False" EntitySetName="Playlist">
    </asp:EntityDataSource>
    
    <asp:DropDownList ID="ddl_playlist" runat="server"
        DataSourceID="EntityDataPlaylist" DataTextField="nombre" 
        DataValueField="idPlaylist" Height="27px" Width="132px"        
        AutoPostBack="True"
        onselectedindexchanged="ddl_playlist_SelectedIndexChanged">
    </asp:DropDownList>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbl_prueba" runat="server" Text="lbl_prueba"></asp:Label>
    &nbsp;&nbsp;
    <asp:Label ID="lbl_prueba2" runat="server" Text="lbl_prueba"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="gdv_media" runat="server" AutoGenerateColumns="False" 
        CaptionAlign="Right"  
        Width="166px" >
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                SortExpression="id" />
            <asp:BoundField DataField="archivo" HeaderText="archivo" 
                SortExpression="archivo" ReadOnly="True" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" 
                SortExpression="nombre" ReadOnly="True" />
        </Columns>
    </asp:GridView>
    <div>
        <asp:Button ID="bt_guardar" runat="server" Text="Guardar" Width="144px" 
            onclick="bt_guardar_click" />
    </div>
    <br />
    <br />

</asp:Content>
