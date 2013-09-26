using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;

//link: http://localhost/ack.aspx?id=Daniel&c=d&i=2&o=Observacion%20o%20comentarios
//significa que llame al servidor indicando que el pc Daniel, descargó el archivo 2
//
//Archivo de texto en el servidor
//0
//indica si debe o no actualizar contenido. 0=no 1=si
//d1*1*http://www.codeproject.com/App_Themes/CodeProject/Img/logo250x135.gif*E:\User Dan\Archivos de Programa\logo250x135.gif*0
//la letra d es el comando descarga(descarga archivo), el 1 es para decir que no se ha descargado, el * es el separador, le sigue el indice del archivo, despues la ruta de origen, y ruta destino. el ultimo 0 es el flag.
//Flag: 0=solo copia, 1=copia y recarga aura player, 2=inicia el actualizador auxiliar y cierra aura player

//e1*1*C:\ruta\archivo.ext*0

namespace AMP
{
    public partial class ack : System.Web.UI.Page
    {

        private string APlayerUID = "";
        private string Comando = "";
        private string Indice = "";
        private string Observacion = "";


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            APlayerUID = Request.QueryString["id"];
            Comando = Request.QueryString["c"];

            string FILENAME = Server.MapPath("Clientes//"+APlayerUID + ".txt");

            Response.Write(FILENAME);

            if (Comando == "f")
            {
                if (Finito(FILENAME) == true)
                {
                    Label1.Text = "ack true";
                }
                else
                {
                    Label1.Text = "archivo protegido";
                }
                return;
            }

            Indice = Request.QueryString["i"];
            Observacion = Request.QueryString["o"]; //el convierte los caracteres URI a cadena normal.

            if (string.IsNullOrEmpty(APlayerUID))
            {
                Label1.Text = "Falta de Parametros.";
                return;
            }



            StreamReader objStreamReader = null;
            string CurrentLine = "";

            string LineTemp = "";
            string DocTemp = "";

            if (File.Exists(FILENAME))
            {
                objStreamReader = File.OpenText(FILENAME);

                while (objStreamReader.Peek() != -1)
                {
                    CurrentLine = objStreamReader.ReadLine();
                    LineTemp = CurrentLine + Environment.NewLine; //para guardar las lineas leidas en el nuevo documento.

                    CurrentLine = CurrentLine.Trim(' '); //quita los espacios
                    if (!string.IsNullOrEmpty(CurrentLine))
                    {
                        string PrimeraLetraLinea = CurrentLine.Substring(0, 1).ToLower();
                        //INSTANT C# NOTE: The following VB 'Select Case' included either a non-ordinal switch expression or non-ordinal, range-type, or non-constant 'Case' expressions and was converted to C# 'if-else' logic:
                        //						Select Case PrimeraLetraLinea
                        //ORIGINAL LINE: Case Is = "0", "1", "'", ""
                        if ((PrimeraLetraLinea == "0") || (PrimeraLetraLinea == "1") || (PrimeraLetraLinea == "'") || (string.IsNullOrEmpty(PrimeraLetraLinea)))
                        {
                            //la 1ra linea que dice si debe actualizar o no, los comentarios y espacios en blanco son ignorados 
                            //ignoralo
                        }
                        //ORIGINAL LINE: Case Is = "r"
                        else if (PrimeraLetraLinea == "r")
                        {
                            string[] VectorElimina = CurrentLine.Split('*');
                            if (VectorElimina.Length >= 3)
                            {
                                if (VectorElimina[0] == "r1")
                                {
                                    //dice esa linea que es una orden de cambiar la Resolucion de la pantalla
                                    string strBusca = "r1*";
                                    string strRemplaza = "r0*";
                                    LineTemp = LineTemp.Replace(strBusca, strRemplaza);
                                    if (!string.IsNullOrEmpty(Observacion))
                                    {
                                        LineTemp = LineTemp + " '" + Observacion + Environment.NewLine + Environment.NewLine;
                                    }

                                }
                            }
                            else
                            {
                                //hay un error en la linea

                            }

                        }
                        //ORIGINAL LINE: Case Is = "s"
                        else if (PrimeraLetraLinea == "s")
                        {
                            string[] VectorElimina = CurrentLine.Split('*');
                            if (VectorElimina.Length >= 2)
                            {
                                if (VectorElimina[0] == "s1")
                                {
                                    //dice esa linea que es una orden de Apagar / Reiniciar
                                    string strBusca = "s1*";
                                    string strRemplaza = "s0*";
                                    LineTemp = LineTemp.Replace(strBusca, strRemplaza);
                                    if (!string.IsNullOrEmpty(Observacion))
                                    {
                                        LineTemp = LineTemp + " '" + Observacion + Environment.NewLine + Environment.NewLine;
                                    }

                                }
                            }
                            else
                            {
                                //hay un error en la linea

                            }
                        }
                        //ORIGINAL LINE: Case Is = "e"
                        else if (PrimeraLetraLinea == "e")
                        {
                            string[] VectorElimina = CurrentLine.Split('*');
                            if (VectorElimina.Length >= 4)
                            {
                                if (VectorElimina[0] == "e1")
                                {
                                    //dice esa linea que es una orden de Eliminar... ve si es la misma
                                    if (Indice == VectorElimina[1])
                                    {
                                        //el indice indicado es el mismo que tengo aqui... modificalo a 1 para indicar que se descargo o no y coloca la observacion
                                        string strBusca = "e1*" + VectorElimina[1];
                                        string strRemplaza = "e0*" + VectorElimina[1];
                                        LineTemp = LineTemp.Replace(strBusca, strRemplaza);
                                        if (!string.IsNullOrEmpty(Observacion))
                                        {
                                            LineTemp = LineTemp + " '" + Observacion + Environment.NewLine + Environment.NewLine;
                                        }

                                    }
                                }
                            }
                            else
                            {
                                //hay un error en la linea

                            }
                        }
                        //ORIGINAL LINE: Case Is = "d"
                        else if (PrimeraLetraLinea == "d")
                        {
                            //descarga..
                            string[] VectorDescarga = CurrentLine.Split('*');
                            if (VectorDescarga.Length >= 5)
                            {
                                if (VectorDescarga[0] == "d1")
                                {
                                    //dice esa linea que es una orden de descarga, ve si es la misma.
                                    if (Indice == VectorDescarga[1])
                                    {
                                        //el indice indicado es el mismo que tengo aqui... modificalo a 1 para indicar que se descargo o no y coloca la observacion
                                        string strBusca = "d1*" + VectorDescarga[1];
                                        string strRemplaza = "d0*" + VectorDescarga[1];
                                        LineTemp = LineTemp.Replace(strBusca, strRemplaza);
                                        if (!string.IsNullOrEmpty(Observacion))
                                        {
                                            LineTemp = LineTemp + " '" + Observacion + Environment.NewLine + Environment.NewLine;
                                        }

                                    }           
                                }
                            }
                            else
                            {
                                //hay un error en la linea
                                        
                            }

                        }
                        //... do whatever else you need to do ...
                    }

                    DocTemp = DocTemp + LineTemp; //guardo el documento a medida que lo voy leyendo.

                }

                objStreamReader.Close();
                //para este punto ya leí todo el archivo, y modifique la linea d1 por d0 y añadi la observacion.
                //escribe el archivo de texto.

                int ContError = 0;
                bool PudoEscribirTxt = false;
                do
                {
                    ContError = ContError + 1;
                    PudoEscribirTxt = EscribeTxt(FILENAME, DocTemp);
                } while (!(PudoEscribirTxt == true || ContError == 10));

                //al llegar a este punto terminó
                if (PudoEscribirTxt == true)
                {
                    Label1.Text = "ack true";
                }
                else
                {
                    Label1.Text = "archivo protegido";
                }

            }
            else
            {
                //'el archivo no existe..
                Label1.Text = "archivo no existe";
            }
        }//fin de la funcion


        /// <summary>
        /// 
        /// </summary>
        /// <param name="ArchivoTxt"></param>
        /// <param name="Contenido"></param>
        /// <returns></returns>
        private bool EscribeTxt(string ArchivoTxt, string Contenido)
        {
            bool tempEscribeTxt = false;
            try
            {
                tempEscribeTxt = true;

                var objStreamReader = File.CreateText(ArchivoTxt);
                objStreamReader.Write(Contenido);
                objStreamReader.Close();


                return tempEscribeTxt;
            }
            catch
            {
                goto errHndl;
            }
        errHndl:
            return false;

        }//fin de la funcion




        /// <summary>
        /// 
        /// </summary>
        /// <param name="ArchivoTxt"></param>
        /// <returns></returns>
        private bool Finito(string ArchivoTxt)
        {
            bool tempFinito = false;
            try
            {
                tempFinito = true;

                var objStreamReader = File.OpenText(ArchivoTxt);
                string TodoElArchivo = objStreamReader.ReadToEnd();
                TodoElArchivo = "0" + TodoElArchivo.Substring(1);
                objStreamReader.Close();

                var objStreamReaderW = File.CreateText(ArchivoTxt);
                objStreamReaderW.Write(TodoElArchivo);
                objStreamReaderW.Close();

                return tempFinito;
            }
            catch
            {
                goto errHndl;
            }
        errHndl:
            return false;


        }//fin de la funcion

    }
}