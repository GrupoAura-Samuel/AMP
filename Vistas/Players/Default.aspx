<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="AMP._Default" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<script>
    function abrir() {
        var id = document.getElementById('<%= txt_hide.ClientID %>').value;
        var options = 'location=1,status=1,width=967,height=580,scrollbars=yes';
        window.open("Crear.aspx", "Nuevo Cliente", options);

    }
  
  </script>
    <h2 align="left">
        
        <asp:Label ID="lbl_nombre" runat="server" Text="Cliente: "></asp:Label>
&nbsp;<asp:Label ID="lbl_cliente" runat="server"></asp:Label>
        
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
            ConnectionString="name=MapEntities1" DefaultContainerName="MapEntities1" 
            EnableFlattening="False" EntitySetName="Player">
        </asp:EntityDataSource>
        
        <asp:GridView ID="gdv_player" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="id" DataSourceID="EntityDataSource1" 
            ForeColor="#333333" GridLines="None" BorderStyle="None" 
                HorizontalAlign="Center" Width="662px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                    SortExpression="nombre" />
                <asp:BoundField DataField="uID" HeaderText="U-ID" SortExpression="uID" />
                <asp:BoundField DataField="sucursal" HeaderText="Sucursal" 
                    SortExpression="sucursal" />
                <asp:BoundField DataField="descripcion" HeaderText="Descripcion" ReadOnly="true"
                    SortExpression="descripcion" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" 
                HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" 
                HorizontalAlign="Center" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" 
                HorizontalAlign="Center" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" HorizontalAlign="Center" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView><br />
  
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <div align="center">
        <asp:Button ID="Button1" runat="server" Height="33px" Text="Ver PlayList" 
            Width="179px" />
&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Height="33px" Text="Agregar Player" 
            Width="179px" onclick="Button2_Click" />  
            </div>
</asp:Content>
