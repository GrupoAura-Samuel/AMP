using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace AMP.Vistas.Players
{
    public partial class Crear : System.Web.UI.Page
    {
        /// <summary>
        /// Ruta de La carpeta donde se guardaran los txt
        /// </summary>
        private string Path;

        /// <summary>
        /// Variable de MapEntities1
        /// </summary>
        MapEntities1 context;

        /// <summary>
        /// Funcion page Load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            Path = AppDomain.CurrentDomain.BaseDirectory;
            Path = Path + "Clientes\\";
            context = new MapEntities1();
        }//fin de la funcion

        /// <summary>
        /// Funcion para Guardar la Informacion cuando se crea un Player
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void guardar_Click(object sender, EventArgs e)
        {
            Player players = new Player()
            {
                nombre = txt_nombre.Text,
                uID = txt_uid.Text,
                sucursal = txt_sucursal.Text,
                descripcion = txt_descripcion.Text,
                creadoPor="gustavo",
                modificadoPor = "gustavo"
             };
            context.AddToPlayer(players);
            int result = context.SaveChanges();

            if(result == 1){
                string uid = txt_uid.Text + ".txt";
                Path = Path + uid;
                File.Create(Path).Close();
                string appendText = 0 + Environment.NewLine;
                File.AppendAllText(Path, appendText);
                Response.Redirect("listar.aspx");
            }
            
        }//fin de la funcion
    }
}