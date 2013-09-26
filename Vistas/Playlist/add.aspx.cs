using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AMP;
using AMP.Libraries;

namespace AMP.Vistas.Playlist
{
    public partial class add : System.Web.UI.Page
    {
        MapEntities1 entity;

        protected void Page_Load(object sender, EventArgs e)
        {
            entity = new MapEntities1(); //new MapEntities1();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            String playlist = txtPlaylist.Text;

            //if(playlist.Equals(""))
            //{
                //lblMensaje.Text = "Escriba el nombre de Playlist";
            //}else{

                AMP.Playlist p = new AMP.Playlist
                {
                    nombre = playlist,
                    creadoPor = "samuel",
                    modificadoPor = "samuel",
                };

                try
                {
                    entity.AddToPlaylist(p);
                    int resul = entity.SaveChanges();

                    if (resul == 1)
                    {//se inserto el registro

                       /* Int32 id = p.id;

                        MapEntities1 context = new MapEntities1();
                       AMP.Playlist p1 = (from p2 in context.Playlist
                                  where p2.id == id
                                  select p2).First();

                       String playlistID = p1.idPlaylist;

                        string path = AppDomain.CurrentDomain.BaseDirectory;
                        path = path + "Clientes\\CajaAhorro";

                        ff = new FolderFile();

                        ff.addFolder(path, ""+playlistID); */

                       // lblMensaje.Text = "El Playlist fue registrado con exito";
                    }   
               }
                catch (Exception ex)
                { 

                }
            //}
        }
    }
}