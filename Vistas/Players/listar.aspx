<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="listar.aspx.cs" Inherits="AMP.Vistas.Players.listar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        ConnectionString="name=MapEntities1" DefaultContainerName="MapEntities1" 
        EnableFlattening="False" EntitySetName="Player">
    </asp:EntityDataSource>
    
        <br />
        <asp:HyperLink ID="hl_crear" NavigateUrl="~/Vistas/Players/Crear.aspx" runat="server">Crear Nuevo</asp:HyperLink>
    <br />
        <br />
        <asp:GridView ID="gv_player" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="id" DataSourceID="EntityDataSource1" Width="700px" 
            CellPadding="6" ForeColor="#333333" GridLines="None" 
        AllowPaging="True" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="nombre" HeaderText="nombre" 
                SortExpression="nombre" />
            <asp:BoundField DataField="uID" HeaderText="UID" 
                SortExpression="uID" />
            <asp:BoundField DataField="sucursal" HeaderText="Sucursal" 
                SortExpression="sucursal" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripción" 
                SortExpression="descripcion" />
            <asp:HyperLinkField DataNavigateUrlFields="idPlayer, idPlaylist" 
                DataNavigateUrlFormatString="~/Vistas/Playlist/selectplaylist.aspx?idPlayer={0}&idPlaylist={1}" 
                HeaderText="Ver Playlist" NavigateUrl="~/Vistas/Playlist/selectplaylist.aspx" 
                Text="Ver Playlist" />
        </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" BorderStyle="None" Font-Bold="True" 
                ForeColor="#333333" HorizontalAlign="Center" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
	
	
</asp:Content>
