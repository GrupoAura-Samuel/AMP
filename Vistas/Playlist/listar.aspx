<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="listar.aspx.cs" Inherits="AMP.Vistas.Playlist.listar" %>
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
    <td><asp:Button ID="btnGuardar" runat="server"  Text="Guardar" 
            onclick="btnGuardar_Click" /></td>
    </tr>
</table>

<br />

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Gen" 
        DataSourceID="EntityDataSource1" ForeColor="#333333" GridLines="None" 
        Width="98%" Caption="Lista de Playlist" 
    onselectedindexchanged="GridView1_SelectedIndexChanged" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Gen" HeaderText="ID" 
                ReadOnly="True" SortExpression="Gen" >
            <ItemStyle HorizontalAlign="Center" Width="5px" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="idPlaylist" 
                DataNavigateUrlFormatString="~/Vistas/Medias/selectMedias.aspx?idPlaylist={0}" 
                HeaderText="Ver Contenidos" NavigateUrl="~/Vistas/Medias/selectMedias.aspx" 
                Text="Ver Contenidos">
            <ItemStyle HorizontalAlign="Center" Width="10px" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="idPlaylist" HeaderText="idPlaylist" 
                SortExpression="idPlaylist" Visible="False" />
            <asp:BoundField DataField="nombre" HeaderText="Playlist" 
                SortExpression="nombre" >
            <ItemStyle HorizontalAlign="Center" Width="10px" />
            </asp:BoundField>
            <asp:BoundField DataField="fechaCreacion" HeaderText="fechaCreacion" 
                SortExpression="fechaCreacion" Visible="False" />
            <asp:BoundField DataField="fechaModificacion" 
                HeaderText="fechaModificacion" 
                SortExpression="fechaModificacion" Visible="False" />
            <asp:BoundField DataField="creadoPor" HeaderText="creadoPor" 
                SortExpression="creadoPor" Visible="False" />
            <asp:BoundField DataField="modificadoPor" HeaderText="modificadoPor" 
                SortExpression="modificadoPor" Visible="False" />
            <asp:BoundField DataField="estado" HeaderText="estado" 
                SortExpression="estado" Visible="False" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        ConnectionString="name=MapEntities1" DefaultContainerName="MapEntities1" 
        EnableFlattening="False" EntitySetName="Playlist" 
        EntityTypeFilter="Playlist">
    </asp:EntityDataSource>

    
</asp:Content>
