<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="selectMedias.aspx.cs" Inherits="AMP.Vistas.Medias.selectMedias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div style="float:left">
        <asp:EntityDataSource ID="edsNormPlaylistMedia" runat="server" 
            ConnectionString="name=MapEntities1" DefaultContainerName="MapEntities1" 
            EnableFlattening="False" EntitySetName="normPlaylistsMedias" 
            EntityTypeFilter="normPlaylistsMedias" Where="" 
            AutoGenerateWhereClause="True">
            
            <WhereParameters>
                <asp:QueryStringParameter Name="idPlaylist" QueryStringField="idPlaylist" 
                    DefaultValue="" />
            </WhereParameters>

        </asp:EntityDataSource>
    <asp:GridView ID="GridView2" runat="server" Height="176px" 
        HorizontalAlign="Left" style="margin-left: 10px; margin-top: 0px" 
            Width="433px" AllowSorting="True" AutoGenerateColumns="False" 
            Caption="Playlist" CellPadding="4" DataSourceID="edsNormPlaylistMedia" 
            ForeColor="#333333" GridLines="None" DataKeyNames="id"
            onselectedindexchanged="GridView2_SelectedIndexChanged" AllowPaging="True">


        <emptydatatemplate>
          <asp:image id="NoDataImage" ImageUrl="~/Imagenes/multimedia.png" ImageAlign="Middle"
            alternatetext="No Image" 
            runat="server"/>
           <asp:Label ID="Label1" runat="server"> Pase los Contenidos del Datastore al Playlist</asp:Label>
        </emptydatatemplate>


        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Seleccionar" ItemStyle-HorizontalAlign="Center" 
                HeaderImageUrl="~/Imagenes/delete.png">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Select" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" ImageUrl="~/Imagenes/delete.png"/>
                </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="5px"></ItemStyle>
            </asp:TemplateField>


            <asp:BoundField DataField="idMedia" HeaderText="ID" >
            <ItemStyle HorizontalAlign="Center" Width="5px" />
            </asp:BoundField>


            <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                SortExpression="nombre" >
            <ItemStyle HorizontalAlign="Center" Width="10px" />
            </asp:BoundField>
            <asp:BoundField DataField="idPlaylist" Visible="False" 
                HeaderText="IdPlaylist" />
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
    </div>

    <div style="float:right">
        <asp:EntityDataSource ID="edsMedia" runat="server" 
            ConnectionString="name=MapEntities1" DefaultContainerName="MapEntities1" 
            EnableFlattening="False" EntitySetName="Media" EntityTypeFilter="Media">
        </asp:EntityDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataKeyNames="id" DataSourceID="edsMedia" Height="185px" 
        HorizontalAlign="Justify" style="margin-left: 6px" Width="452px" 
            Caption="DataStore" CellPadding="4" ForeColor="#333333" GridLines="None"
            onselectedindexchanged="GridView1_SelectedIndexChanged" AllowPaging="True" 
            AllowSorting="True" >

        <emptydatatemplate>
          <asp:image id="NoDataImage1" ImageUrl="~/Imagenes/multimedia.png" ImageAlign="Middle"
            alternatetext="No Image" 
            runat="server"/>
            <asp:LinkButton runat="server" PostBackUrl="~/Vistas/Medias/listar.aspx">Presione aqui para agregar Contenido al DataStore</asp:LinkButton>
        </emptydatatemplate>

     
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>

           <asp:TemplateField HeaderText="Seleccionar" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Select" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" ImageUrl="~/Imagenes/pasar.png"/>
                </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="5px"></ItemStyle>
           </asp:TemplateField>

            <asp:BoundField DataField="id" HeaderText="ID" 
                ReadOnly="True" SortExpression="id" >
            </asp:BoundField>
            <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                SortExpression="nombre" >
            </asp:BoundField>
            <asp:BoundField DataField="ext" HeaderText="Tipo" SortExpression="ext" />
            <asp:BoundField DataField="fileOriginal" HeaderText="Archivo">
            <ItemStyle HorizontalAlign="Center" Width="15px" />
            </asp:BoundField>
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
    </div>
    <br/><br/><br/>

    <div style="float:left">
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="81px" /> 
        <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" Width="94px" /> 
    </div>
    
    <br/>
    <div style="float:left">

        <asp:EntityDataSource ID="edsPlayers" runat="server" 
            ConnectionString="name=MapEntities1" DefaultContainerName="MapEntities1" 
            EnableFlattening="False" EntitySetName="Player" EntityTypeFilter="Player" 
            Select="" Where="" AutoGenerateWhereClause="True">
            <WhereParameters>
                <asp:QueryStringParameter Name="idPlaylist" QueryStringField="idPlaylist" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:GridView ID="GridView3" runat="server" Width="437px" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="id" DataSourceID="edsPlayers" ForeColor="#333333" 
            GridLines="None" Caption="Players Asignados al Playlist">
            
            <emptydatatemplate>
              <asp:image id="NoDataImage2" ImageUrl="~/Imagenes/computer.png" ImageAlign="Middle"
                alternatetext="No Image" 
                runat="server"/>
                No hay Player asignados a este Playlist.
                <%--<asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Vistas/Medias/listar.aspx">Presione aqui para agregar Contenido al DataStore</asp:LinkButton> --%>
            </emptydatatemplate>
            

            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" 
                    SortExpression="id" />
                <asp:BoundField DataField="uID" HeaderText="UID" SortExpression="uID" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                    SortExpression="nombre" />
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
    </div>

</asp:Content>
