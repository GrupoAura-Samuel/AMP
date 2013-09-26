<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Crear.aspx.cs" Inherits="AMP.Vistas.Players.Crear" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
    <style type="text/css">
        .style1
        {
            width: 318px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><b>&nbsp;&nbsp;&nbsp;Nuevo Player</b></h2>
     <table cellpadding="5"  cellspacing="0" 
        style="border-style: none; border-color: inherit; border-width: 1px; width: 915px;">
        <tr>
           <td align="right" style="width: 284px">
               <asp:Label ID="lbl_nombre" runat="server" Text="Nombre:" 
                   style="font-weight: 700"></asp:Label>
             </td>
           <td class="style1"><asp:TextBox ID="txt_nombre" runat="server" Width="300px"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="validatorNombre" runat="server" Width="300px" 
                   ErrorMessage="El nombre del Player es Obligatorio" ControlToValidate="txt_nombre" 
                   ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
              
         <tr>
           <td align="right" style="font-weight: 700; width: 284px;">
               <asp:Label ID="lbl_uid" runat="server" Text="UID:"></asp:Label>
             </td>
           <td class="style1"><asp:TextBox ID="txt_uid" runat="server" Width="300px"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Width="300px" 
                   ErrorMessage="El campo UID es obligatorio." ControlToValidate="txt_uid" 
                   ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
           <td align="right" style="font-weight: 700; height: 46px; width: 284px;">
               <asp:Label ID="lbl_sucursal" runat="server" Text="Sucursal:"></asp:Label>
             </td>
           <td class="style1"><asp:TextBox ID="txt_sucursal" runat="server" 
                   Width="300px"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Width="300px" 
                   ErrorMessage="La Sucursal es obligatoria." ControlToValidate="txt_sucursal" 
                   ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
      
            <tr>
           <td align="right" style="font-weight: 700; width: 284px;">
               <asp:Label ID="lbl_descripcion" runat="server" style="font-weight: 700" 
                   Text="Descripcion:"></asp:Label>
                </td>
           <td class="style1"><asp:TextBox ID="txt_descripcion" runat="server" TextMode="MultiLine" Width="300px"></asp:TextBox></td>
           <td>&nbsp;</td>
        </tr>
         <tr>
           <td align="right" style="width: 284px">&nbsp;</td>
           <td class="style1">
               <asp:Button ID="bt_guardar" runat="server" Text="Guardar" BorderStyle="Groove" 
                   Width="89px" onclick="guardar_Click" />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:Button ID="Button1" runat="server" BorderStyle="Groove" Text="Cancelar" 
                   Width="80px" />
             </td>
            </tr>
                                 
    </table>
</asp:Content>