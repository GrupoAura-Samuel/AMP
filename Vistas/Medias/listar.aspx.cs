using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMP.Vistas.Medias
{
    public partial class listar : System.Web.UI.Page
    {
        string path;
        MapEntities1 context = new MapEntities1();
        Media media;
        protected void Page_Load(object sender, EventArgs e)
        {
            path = AppDomain.CurrentDomain.BaseDirectory;
        }

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            string upload = System.IO.Path.GetFileName(FileUploadExaminar.PostedFile.FileName);
            string nameFileOrignal = upload;

            if (upload != "")
            {
            char[] seps = { '.' };
            String[] values = upload.Split(seps);

            if (values[1] == "jpg" || values[1] == "jpeg" || values[1] == "wmv")
            {
                path = path + "Clientes\\";
                media = new Media()
                {
                    nombre = txtContenido.Text,
                    ext = values[1],
                    creadoPor = "samuel",
                    modiificado = "samuel",
                    fileOriginal = nameFileOrignal.ToString()
                };

                    context.AddToMedia(media);
                    int resul = context.SaveChanges();

                    if (resul == 1)
                    {
                        Int32 id = media.id;

                        if ((FileUploadExaminar.PostedFile != null) && (FileUploadExaminar.PostedFile.ContentLength > 0))
                        {
                            upload = id + "." + values[1];
                            path = path + upload;
                            GridView1.DataBind();

                            try
                            {
                                FileUploadExaminar.PostedFile.SaveAs(path);
                                txtContenido.Text = "";
                            }
                            catch (Exception ex)
                            {
                                Response.Write("Error: " + ex.Message);
                            }
                        }
                        else
                        {
                            Response.Write("Seleccione un archivo que cargar.");
                        }
                    }
                
            }
            else
            {
                Response.Write("formato no permitido");
            }


            }
        }//fin de la funcion guardar


    }
}