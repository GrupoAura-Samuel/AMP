using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMP.Vistas.Playlist
{
    public partial class edit : System.Web.UI.Page
    {
        private String idPlaylist;
        MapEntities1 context = new MapEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                idPlaylist = Convert.ToString(Request.QueryString["idPlaylist"]);
                AMP.Playlist p = new AMP.Playlist();
                p = (from p1 in context.Playlist
                     where p1.idPlaylist == idPlaylist
                          select p1).First();

                txtPlaylist.Text = p.nombre;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            idPlaylist = Convert.ToString(Request.QueryString["idPlaylist"]);

            AMP.Playlist p = new AMP.Playlist();
            
            p = (from p1 in context.Playlist
                      where p1.idPlaylist == idPlaylist
                      select p1).First();


            p.nombre = txtPlaylist.Text;
            context.SaveChanges();
        }
    }
}