using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace AMP.Vistas.Playlist
{
    public partial class SelectPlaylist : System.Web.UI.Page
    {
        string Uid;
        string Path;
        string idPlayer;

        protected void Page_Load(object sender, EventArgs e)
        {
            string qString = ClientQueryString;
            string[] arrayQueryString = qString.Split(new Char[] { ' ', ',', '.', '=', '&' });
            int cantidadParametros = arrayQueryString.Length;
            Response.Write(cantidadParametros);
            if (cantidadParametros == 4)
            {
                if (arrayQueryString[0].Equals("idPlayer") && arrayQueryString[2].Equals("idPlaylist"))
                {
                    Path = AppDomain.CurrentDomain.BaseDirectory;
                    Path = Path + "Clientes\\";

                    
                    idPlayer = Convert.ToString(Request.QueryString["idPlayer"]);
                    if (!IsPostBack)
                    {
                        string idPlaylist;
                        idPlaylist = Convert.ToString(Request.QueryString["idPlaylist"]);

                        if (idPlayer.Equals(""))
                        {
                            gdv_media.Visible = false;
                            ddl_playlist.Visible = false;
                            bt_guardar.Visible = false;
                        }
                        else
                        {
                            if (idPlaylist!="")
                            {
                                gdv_media.DataSource = GetAllPlaylist(idPlaylist);
                                gdv_media.DataBind();
                                ddl_playlist.SelectedValue = idPlaylist;
                            }
                        }
                    }
                    Uid = GetAllUid(idPlayer);
                }
            }
            else
            {
                gdv_media.Visible = false;
                ddl_playlist.Visible = false;
                bt_guardar.Visible = false;
            }
        }//fin de la funcion

        protected void ddl_playlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            gdv_media.DataSource = GetAllPlaylist(ddl_playlist.SelectedItem.Value);
            gdv_media.DataBind();
        }
        
        public static List<AMP.normPlaylistsMedias> GetAllPlaylist(string playlistid)
        {
            MapEntities1 contex = new MapEntities1();
            
            var playlist = from p in contex.normPlaylistsMedias
                           where (playlistid.Contains((string)p.idPlaylist))
                         select p;
            return playlist.ToList();
        }

       
        public string GetAllUid(string idPlayer)
        {
            MapEntities1 contex = new MapEntities1();

            Player player = (from p in contex.Player
                      where p.idPlayer == idPlayer
                           select p).First();
            return player.uID;
        }

     
        /// <summary>
        /// Funcion Para Guardar el Playlist de un Player, Escribe en e file txt
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void bt_guardar_click(object sender, EventArgs e)
        {
            Response.Write(ddl_playlist.SelectedValue);

            string nameuid = Uid.ToString();

            Path = Path + nameuid + ".txt"; 

            File.Create(Path).Close();
            string appendText = 1 + Environment.NewLine;
            File.AppendAllText(Path, appendText);

            int i = 1;
            foreach (GridViewRow row in gdv_media.Rows)
            {
                string namefile = row.Cells[1].Text;
                appendText = "d*0*" + i + "*" + "http://localhost:51831/clientes/" + namefile + "*" + "D:\\Extras\\Videos\\" + namefile + "*0" + Environment.NewLine;
                File.AppendAllText(Path, appendText);
                i++;
            }//fin del for

            


            MapEntities1 context = new MapEntities1();

            //Player player = new Player(); //= context.Player.Single(x => x.idPlayer==idPlayer);
            //player.idPlaylist = ddl_playlist.SelectedValue;

            //context.;

            //context.SaveChanges();

            Player player = (from p in context.Player
                             where p.idPlayer == idPlayer
                             select p).First();
            player.idPlaylist = ddl_playlist.SelectedValue.ToString();
            

            context.SaveChanges();

        }//fin de la funcion


        public string queryString { get; set; }
    }
}