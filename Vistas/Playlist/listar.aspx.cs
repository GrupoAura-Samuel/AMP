using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMP.Vistas.Playlist
{
    public partial class listar : System.Web.UI.Page
    {
        MapEntities1 entity;
        protected void Page_Load(object sender, EventArgs e)
        {
            entity = new MapEntities1(); //new MapEntities1();
        }

        protected void btnAddPlaylist_Click(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Funcion para a
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            String playlist = txtPlaylist.Text;
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
                {
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {

            }
        }//fin de la funcion
    }
}