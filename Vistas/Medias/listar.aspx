<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="listar.aspx.cs" Inherits="AMP.Vistas.Medias.listar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" BorderWidth="1px">
      <table>
      <tr>
        <td>
        <asp:Label ID="Label1" runat="server" Text="Nombre del Contenido"></asp:Label><br />
        <asp:TextBox ID="txtContenido" runat="server" Width="269px"></asp:TextBox>
        </td>
        <td>
        <asp:RequiredFieldValidator ID="validateContenido" runat="server" 
            ControlToValidate="txtContenido" EnableTheming="True" 
            ErrorMessage="Escriba el nombre del Contenido." ForeColor="Red">Escriba el nombre del Contenido.</asp:RequiredFieldValidator>
      </td></tr>

      <tr><td>
        <asp:FileUpload ID="FileUploadExaminar" runat="server" Width="404px" /></td>
        <td><asp:RequiredFieldValidator ID="validateAdjunto" runat="server" 
            ControlToValidate="FileUploadExaminar" ErrorMessage="Adjunte un archivo." 
            ForeColor="Red">Adjunte un archivo.</asp:RequiredFieldValidator>
      </td></tr>
      <tr>
      <td><asp:Button ID="btnSubir" runat="server" onclick="btnSubir_Click" 
            Text="Guardar" Width="129px" /></td>
      </tr>  
        
        </table>
    </asp:Panel>
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Height="172px" Width="98%" AutoGenerateColumns="False" 
        DataKeyNames="id" DataSourceID="edsMedias" AllowSorting="True" 
        AllowPaging="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" 
                SortExpression="id" >
            <ItemStyle HorizontalAlign="Center" Width="5px" />
            </asp:BoundField>
            <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                SortExpression="nombre" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="fileOriginal" HeaderText="Archivo" 
                SortExpression="fileOriginal" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ext" HeaderText="Tipo" SortExpression="ext">
            <ItemStyle HorizontalAlign="Center" />
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
    <br />
    <asp:EntityDataSource ID="edsMedias" runat="server" 
    ConnectionString="name=MapEntities1" DefaultContainerName="MapEntities1" 
    EnableDelete="True" EnableFlattening="False" EnableInsert="True" 
    EnableUpdate="True" EntitySetName="Media" EntityTypeFilter="Media">
</asp:EntityDataSource>
    <br />
</asp:Content>
