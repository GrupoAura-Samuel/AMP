using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;

namespace AMP
{
    public partial class creaplayer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                string fileToCreate = Request.QueryString["f"];
                if (string.IsNullOrEmpty(fileToCreate))
                {
                    Label1.Text = "Nombre de Archivo No Valido";
                    return;
                }

                string filename = Server.MapPath("Clientes//"+fileToCreate);
                if (File.Exists(filename))
                {
                    Label1.Text = "Archivo ya Existe";
                }
                else
                {
                    var objStreamReader = File.CreateText(filename+".txt");
                    objStreamReader.WriteLine("0");
                    objStreamReader.Close();
                    Label1.Text = "Archivo Creado Exitosamente";
                }

                return;


            }
            catch
            {
                //goto errorhdl;
            }
       // errorhdl:
            //INSTANT C# TODO TASK: Calls to the VB 'Err' function are not converted by Instant C#:
            //Label1.Text = Microsoft.VisualBasic.Information.Err().Description;

        }
    }
}