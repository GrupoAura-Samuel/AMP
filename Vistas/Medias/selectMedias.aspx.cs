using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMP.Vistas.Medias
{
    public partial class selectMedias : System.Web.UI.Page
    {
        /// <summary>
        /// variable del entitydadsource
        /// </summary>
        MapEntities1 context = new MapEntities1();

        /// <summary>
        /// variable de la tabla normPlaylistsMedias
        /// </summary>
        normPlaylistsMedias playMedia;

        /// <summary>
        /// variable que contiene e valor del campo idPlaylist
        /// </summary>
        string idPlaylist;

        /// <summary>
        /// Funcion Load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

            string queryString = ClientQueryString;
            if (queryString.Equals(""))
            {
                GridView1.Visible = false;
                GridView2.Visible = false;
            }
            else
            {
                string[] parametros = queryString.Split(new Char[] { ' ', ',', '.', '=', '&' });

                if(parametros[0].Equals("idPlaylist")){
                    GridView1.Visible = true;
                    GridView2.Visible = true;

                    idPlaylist = parametros[1];


                    //se verifica si el idPlaylist existe

                    /*Player player = (from p in context.Player
                                     where p.idPlaylist == idPlaylist
                            select p).First();*/


                    //System.Data.Objects.ObjectQuery<AMP.Playlist> pl = context.Playlist.Where(idPlaylist==idPlaylist);


                }              
            }  

        }//fin de la funcion

        /// <summary>
        /// Funcion que desencadena el evento del gridview 1
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridViewRow row = GridView1.SelectedRow;
            int index = row.RowIndex;
            Int32 idMedia = Convert.ToInt32(GridView1.DataKeys[index].Values["id"]);

            //Recorre el gridView2
            int cont = 0;
            foreach (GridViewRow row2 in GridView2.Rows)
            {
                Int32 MediaId = Convert.ToInt32(row2.Cells[1].Text);
                if (idMedia == MediaId)
                {
                    cont++;
                }
            }

            if(cont==0){
                string nombre = GridView1.Rows[index].Cells[2].Text;
                string ext = GridView1.Rows[index].Cells[3].Text;

                playMedia = new normPlaylistsMedias()
                {
                    archivo = idMedia + "." + ext,
                    idPlaylist = idPlaylist,
                    nombre = nombre,
                    idMedia = idMedia
                };

                context.AddTonormPlaylistsMedias(playMedia);
                int resul = context.SaveChanges();

                if (resul == 1)
                {
                    GridView2.DataBind();

                }
            }else{
                //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "**" + "');", true);
                //System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('El Archivo ya existe en este Playlist')</SCRIPT>");
            }
            
            
        }//fin de la funcion

        /// <summary>
        /// Funcion que desencadena el evento del gridview 2
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            int index = row.RowIndex;
            Int32 id = Convert.ToInt32(GridView2.DataKeys[index].Values["id"]);

            normPlaylistsMedias query = new normPlaylistsMedias(); 
            query = (from q in context.normPlaylistsMedias
                     where q.id == id
                      select q).Single();

            context.DeleteObject(query);
            int result = context.SaveChanges();
            if(result == 1){
                GridView2.DataBind();
            }
        }//fin de la funcion
    }
}